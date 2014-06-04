<?php

	
	################################################################################################
		
	function nav() {
		global $cfg;
		
		$nav = '[
			<a href="/home/">home</a> /
			<a href="/news/">news</a> /
			<a href="/rules/">rules</a> /
			<a href="/faq/">faq</a> /
			<a href="/polls/">polls</a><!-- /
			<a href="http://archive.uboachan.net/">archive</a> /
			<a href="http://archive.uboachan.net/media/src/Yume_Nikki.rar">v0.10 Download</a> /
			<a href="http://widget.mibbit.com/?server=irc.datnode.net&channel=%23ka-ch" target="_blank">chat</a>-->
		] &nbsp;&nbsp;&nbsp;';
		
		$query = "SELECT * FROM ".$cfg['prefix']."_cats ORDER BY cat_order ASC";
		$result = mysql_query($query) or die(mysql_error());
		
		while($cat = mysql_fetch_array($result)) {
			$cat_id = $cat['cat_id'];
			
			$i = 0;
		
			$cat_boards = explode(",", $cat['cat_boards']);
			$limit = count(array_filter($cat_boards));
			
			if ($limit != 0) {
			
				$nav .= "[ ";
				foreach ($cat_boards as $b) {
					$bquery = "SELECT * FROM ".$cfg['prefix']."_boards WHERE board_retired='0' AND board_id='$b' LIMIT 1";
					$bresult = mysql_query($bquery) or die(mysql_error());
				
					while($row = mysql_fetch_array($bresult)) {
						$i++;
						$nav .= '<a href="'.$cfg['sitedir'].'/'.$row["board_addr"].'/" title="'.$row["board_name"].'">'.$row["board_addr"].'</a>';
						if ($i < $limit) {
							$nav .= ' / ';
						}
					}
				}
				$nav .= " ] ";
			}
		}
		
		return $nav;
		
	}
	
	################################################################################################
	
	// Throw an error if we run into one
	function error($exception) {
	
		echo "<script>alert(\"".$exception."\");</script>";
		echo "<script>window.location = document.referrer;</script>";
		die();
		
	}
	
	################################################################################################
	
	// Redirect
	function redirect($url) {
		echo "<script>window.location.replace('".$url."');</script>";
		die();
	}
	
	################################################################################################
	
	// Banner
	function banner() {
		$banners = preg_grep('~\.(jpeg|jpg|png|gif)$~', scandir('lib/media/banners/'));
		echo '<a href="'.$cfg['sitedir'].'/home/"><img src="'.$cfg['sitedir'].'/lib/media/banners/'.$banners[array_rand($banners,1)].'" style="border: none;"></a> <br>';
	}
	
	################################################################################################

	// Upload a file
	// 1=from hdd
	// 2=external
	function upload($mode) {
		
		global $spoiler;
		$extensions = array("gif", "png", "jpg", "jpeg", "bmp");
		$uploadDir = 'src/';
		$url = $_POST['url'];
		
		// 1 = upload
		// 2 = external
		
		if ($mode == 1) {
		
			// Upload file
			if($_FILES["file"]["name"] != ''){
				$extension = pathinfo($_FILES["file"]["name"],PATHINFO_EXTENSION);
				$filename = time().'.'.$extension;
				
				if (in_array($extension, $extensions)) {
					if (move_uploaded_file($_FILES['file']['tmp_name'], $uploadDir.$filename)) {
						return $filename;
					} else {
						error("There was an error uploading your file.");
						die();
					}
				} else {
					error("Extension error.");
					die();
				}
			} else {
				return;
			}
			
		} else {
			
			if (!$file = fopen($url,"rb")) {
				error("There was an error uploading your file.");
				die();
			} else {
				
				$extension = pathinfo($url, PATHINFO_EXTENSION);
				$filename = time().'.'.$extension;

				if ((in_array($extension, $extensions)) && ($extension != '')) {
					$newfile = fopen($uploadDir . $filename, "wb"); // creating new file on local server
					if($newfile){
						while(!feof($file)){ // Write the url file to the directory.
							$url = file_get_contents($url);
							fwrite($newfile,$url); // write the file to the new directory at a rate of 8kb/sec. until we reach the end.
							return $filename;
						}
					} else {
						error("There was an error uploading your file.");
						die();
					}
				} else {
					error("Extension error.");
					die();
				}
			}
			
		}
	}
	
	################################################################################################
	
	// Parse text for bbcode and linkfy
	function parseText($content) {
	
		ob_start();
		global $cfg;
		global $postdata;
		
		$url = explode("/", $_SERVER['REQUEST_URI']);
		$board = $url[1];
		
		$content = str_replace('\"', '"', $content);
		$content = str_replace("<br>", "\n", $content);
		$content = nl2br($content);
		
		//bbcode
		$content = preg_replace('#\[tm\]#iUs', '™', $content); 									// [tm]
		$content = preg_replace('#\[b\](.+)\[\/b\]#iUs', '<b>$1</b>', $content); 				// [b]$i[/b]
		$content = preg_replace('#\[i\](.+)\[\/i\]#iUs', '<i>$1</i>', $content); 				// [i]&i[/i}
		$content = preg_replace('#\[u\](.+)\[\/u\]#iUs', '<u>$1</u>', $content);				// [u]$i[/u]
		$content = preg_replace('#\[s\](.+)\[\/s\]#iUs', '<s>$1</s>', $content);				// [s]$i[/s]
		$content = preg_replace('#\[spoiler\](.+)\[\/spoiler\]#iUs', "<span style='color:#000000; background:#000000' onmouseover=\"style.color='#ffffff'\" onmouseout=\"style.color='#000000'\">$1</span>", $content); // [spoiler]$i[/spoiler]
		
		
		//Greentext
		$content = preg_replace('#\&gt;(.+)#', '<span class="quote">&gt;$1</span>', $content);
		
		//Quote
		if (preg_match('#\&gt;\&gt;(\d+)#', $content, $matches)) {
			$match = $matches[1];
			
			$query = "SELECT * FROM ".$cfg['prefix']."_posts WHERE post_board='$board' AND post_uid='$match'";
			$result = mysql_query($query) or die(mysql_error());
			$found = mysql_fetch_array($result);
			
			if (!empty($found)) {
				$content = preg_replace('#\&gt;\&gt;(\d+)#', '<a href="/'.$found['post_board'].'/thread/'.$found['post_thread'].'/#$1">&gt;&gt;\1</a></span>', $content);
			}
		}
		
		# todo: workaround for substr_count not working in searching if post/board exists for quote
		$content = preg_replace('/\&gt;\&gt;\&gt;(\/\S\/)/', '<a href="'.$cfg['sitedir'].'$1">&gt;&gt;&gt;\1</a></span>', $content); // >>>/board/

		//Link/vidify
		$vid = false;
		if (preg_match_all('/youtube\.com\/watch\?v=([^\&\?\/]+)/', $content, $id)) {
		  $vid = true;
		} else if (preg_match_all('/youtube\.com\/embed\/([^\&\?\/]+)/', $content, $id)) {
		  $vid = true;
		} else if (preg_match_all('/youtube\.com\/v\/([^\&\?\/]+)/', $content, $id)) {
		  $vid = true;
		} else if (preg_match_all('/youtu\.be\/([^\&\?\/]+)/', $content, $id)) {
		  $vid = true;
		}

		if ($vid == false) {
			$content = preg_replace('#(?<!src=")(((f|ht){1}tps://)[-a-zA-Z0-9@:%_\+.~\#?&//=]+)#','<a href="\\1" target="_blank">\\1</a>', $content);
		} else {
			$search     = '/https\:\/\/www\.youtube\.com\/watch\?v=([a-zA-Z0-9-_]+)/smi';
			$replace    = '<br><iframe width="420" height="315" style="margin: 0 auto; margin-bottom: 8px;" src="//www.youtube.com/embed/$1?wmode=opaque" frameborder="0" allowfullscreen></iframe> <br>';
			$replace    =	'<br>
							<object width="420" height="315">
							<param name="movie" value="$1"></param>
							<param name="allowFullScreen" value="true"></param>
							<param name="wmode" value="opaque"/>
							<param name="allowscriptaccess" value="always"></param>
							<embed wmode="opaque" src="http://www.youtube.com/v/$1?version=3&amp;hl=ru_RU" type="application/x-shockwave-flash" width="420" height="315" allowscriptaccess="always" allowfullscreen="true"></embed>
							</object>
							<br>';
			$content 	= preg_replace($search,$replace,$content, 1);
			$content = preg_replace('#(?<!src=")(((f|ht){1}tps://)[-a-zA-Z0-9@:%_\+.~\#?&//=]+)#','<a href="\\1" target="_blank">\\1</a>', $content);
		}
		
		$content = preg_replace("/\bKappa\b/i","<img src='http://i.imgur.com/J5VWm6C.png'>",$content);
		
		ob_end_flush();
		return $content;
		
	}
	
	################################################################################################
	
	// Fuzzy time
	function fuzzyTime($date) {
	
		$time = strtotime($date);
		$now = time();
		$ago = $now - $time;
		if ($ago < 5) {
			$fuzz = "Just now";
		}
		else if ($ago < 60) {
			$when = round($ago);
			$s = ($when == 1)?"second":"seconds";
			$fuzz = "$when $s ago";
		} else if ($ago < 3600) {
			$when = round($ago / 60);
			$m = ($when == 1)?"minute":"minutes";
			$fuzz = "$when $m ago";
		} else if ($ago >= 3600 && $ago < 86400) {
			$when = round($ago / 60 / 60);
			$h = ($when == 1)?"hour":"hours";
			$fuzz = "$when $h ago";
		} else if ($ago >= 86400 && $ago < 2629743.83) {
			$when = round($ago / 60 / 60 / 24);
			$d = ($when == 1)?"day":"days";
			$fuzz = "$when $d ago";
		} else if ($ago >= 2629743.83 && $ago < 31556926) {
			$when = round($ago / 60 / 60 / 24 / 30.4375);
			$m = ($when == 1)?"month":"months";
			$fuzz = "$when $m ago";
		} else {
			$when = round($ago / 60 / 60 / 24 / 365);
			$y = ($when == 1)?"year":"years";
			$fuzz = "$when $y ago";
		}
		
		$return = "<span class='small' title='$date'>$fuzz</span>";
		
		return $return;
		
	}
	
	################################################################################################

	// Parse postdata
	function postdata($postdata) {
	
		global $cfg;

		if ($postdata['post_author'] == null) { $postdata['post_author'] == "Anonymous"; }
		
		
		if ($postdata['post_trip'] != null) {
			if ($postdata['post_trip'] == "Admin") {
				if ($postdata['post_email'] != null) {
					$postdata['post_author'] = "<a href='mailto:".$postdata['post_email']."' style='text-decoration: underline !important;'><span style='font-weight: bold; color: ".$cfg['anon']." !important;'>".$postdata['post_author']."</span><span style='font-weight: none; color: ".$cfg['staff']." !important'> ## Admin</span></a>";
				} else {
					$postdata['post_author'] = "<span style='font-weight: bold; color: ".$cfg['anon']."'>".$postdata['post_author']."</span><span style='font-weight: none; color: ".$cfg['staff']." !important'> ## Admin</span>";
				}
			} else if ($postdata['post_trip'] == "Moderator") {
				if ($postdata['post_email'] != null) {
					$postdata['post_author'] = "<a href='mailto:".$postdata['post_email']."' style='text-decoration: underline !important;'><span style='font-weight: bold; color: ".$cfg['anon']." !important;'>".$postdata['post_author']."</span><span style='font-weight: none; color: ".$cfg['staff']." !important'> ## Mod</span></a>";
				} else {
					$postdata['post_author'] = "<span style='font-weight: bold; color: ".$cfg['anon']."'>".$postdata['post_author']."</span><span style='font-weight: none; color: ".$cfg['staff']." !important'> ## Mod</span>";
				}
			} else {
				if ($postdata['post_email'] != null) {
					$postdata['post_author'] = "<a href='mailto:".$postdata['post_email']."' style='text-decoration: underline !important;'><span style='font-weight: bold; color: ".$cfg['anon']." !important;'>".$postdata['post_author']."</span><span style='font-weight: none; color: ".$cfg['anon']." !important'>!".$postdata['post_trip']."</span></a>";
				} else {
					$postdata['post_author'] = "<span style='font-weight: bold; color: ".$cfg['anon']."'>".$postdata['post_author']."</span><span style='font-weight: none; color: ".$cfg['anon']." !important'>!".$postdata['post_trip']."</span>";
				}
			}
		} else {
			if ($postdata['post_email'] != null) {
				$postdata['post_author'] = "<a href='mailto:".$postdata['post_email']."' style='text-decoration: underline !important;'><span style='font-weight: bold; color: ".$cfg['anon']." !important;'>".$postdata['post_author']."</span></a>";
			} else {
				$postdata['post_author'] = "<span style='font-weight: bold; color: ".$cfg['anon']." !important'>".$postdata['post_author']."</span>";
			}
		}
		
		if ($postdata['post_image'] != '') {
			$postdata['post_image'] = '
			<div class="postimage">
				<a href="'.$cfg['sitedir'].'/src/'.$postdata["post_image"].'" target="_blank">
					<img src="'.$cfg['sitedir'].'/src/'.$postdata["post_image"].'" style="max-width: '.$cfg['img_x'].'px; max-height: '.$cfg['img_y'].'px; width: auto; height: auto;">
				</a>
			</div>';
		}
		
		return $postdata;
	}
	
?>