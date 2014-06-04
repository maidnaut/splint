<?php

	//////////////////////////

	function fnav() {
	
		global $cfg;
	
		$cquery = "SELECT * FROM ".$cfg['prefix']."_cats ORDER BY cat_order ASC";
		$cresult = mysql_query($cquery) or die(mysql_error());
		
		while($cat = mysql_fetch_array($cresult)) {
			$cat_id = $cat['cat_id'];
			
			$cat_boards = explode(",", $cat['cat_boards']);
			$limit = count(array_filter($cat_boards));
			
			if ($limit != 0) {
			
				$fnav .= '<div class="span3">';
					$fnav .= '<div style="text-align: left; padding-bottom: 6px; font-weight: bold;">'.$cat['cat_name'].'</div>';
					foreach ($cat_boards as $board) {
						$query = "SELECT * FROM ".$cfg['prefix']."_boards WHERE board_retired='0' AND board_id='$board' LIMIT 1";
						$result = mysql_query($query) or die(mysql_error());
					
						while($row = mysql_fetch_array($result)) {
							$fnav .= '<div class="span3" style=" margin-left: 0px;padding-bottom: 8px; text-align: left;">';
								$fnav .= '<a href="/'.$row["board_addr"].'/">/'.$row['board_addr'].'/ - '.$row["board_name"].'</a>';
							$fnav .= '</div>';
						}
					}
				$fnav .= '</div>';
			}
		}
		
		return $fnav;
		
	}
	
	//////////////////////////
	
	function recent_images() {
	
		global $cfg;
	
		$i = 0;
		$query = "SELECT * FROM ".$cfg['prefix']."_posts ORDER BY post_id DESC";
		$result = mysql_query($query) or die(mysql_error());
		while ($row = mysql_fetch_array($result)) {
			$board = $row['post_board'];
			$b_q = "SELECT * FROM ".$cfg['prefix']."_boards WHERE board_addr='$board' LIMIT 1";
			$b_r = mysql_query($b_q) or die(mysql_error());
			$board = mysql_fetch_array($b_r);
			
			if (($row['post_image'] != '') && ($i < 6)) {
				$recent_images .= '
					<div style="min-width: 175px !important; padding: 5px; display: inline-block; vertical-align: middle; text-align: center;">
						<div class="postimage" style="width: auto; margin: 0; float: none; box-shadow: none;">
							<a href="'.$cfg['sitedir'].'/'.$row["post_board"].'/thread/'.$row["post_thread"].'/#'.$row["post_uid"].'">
								<img src="'.$cfg['sitedir'].'/src/'.$row["post_image"].'" style="max-width: 150px; max-height: 150px; width: auto; height: auto;">
							</a>
						</div>
					</div>';
				$i++;
			}
		}
		
		return $recent_images;
							
	}
	
	//////////////////////////
	
	function recent_posts() {
	
		global $cfg;
	
		$i = 0;
		$query = "SELECT * FROM ".$cfg['prefix']."_posts ORDER BY post_id DESC";
		$result = mysql_query($query) or die(mysql_error());
		while ($row = mysql_fetch_array($result)) {
			$board = $row['post_board'];
			$b_q = "SELECT * FROM ".$cfg['prefix']."_boards WHERE board_addr='$board' LIMIT 1";
			$b_r = mysql_query($b_q) or die(mysql_error());
			$board = mysql_fetch_array($b_r);
			
			if (($row['post_content'] != '') && ($i < 8)) {
				$recent_posts .= fuzzyTime($row['post_date']).'<br>';
				$recent_posts .= "<span style='font-weight: bold;'>".$board['board_name'].": </span>";
				$recent_posts .= '<a href="/'.$row["post_board"].'/thread/'.$row["post_thread"].'/#'.$row["post_uid"].'">';
				if (strlen($row['post_content']) >= 140) {
					$recent_posts .= substr(parseText($row['post_content']), 0, 140). "...";
				}
				else {
					$recent_posts .= parseText($row['post_content']);
				}
				$recent_posts .='</a><br><br>';
				$i++;
			}
		}
		
		return $recent_posts;
							
	}
	
?>