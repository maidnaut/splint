<?php
		
	require("lib/inc/config.php");
	include("lib/inc/functions.php");
	include("lib/inc/auth.php");
	
	$ref = explode("/", $_SERVER['HTTP_REFERER']);
		
	$board = $ref[3];
	$thread = $ref[5];
		
	if (!$_POST) {
		alert("woah hey what the fuck are you doing");
		redirect("/home/");
		die();
	} else {
	
		echo '<img src="/lib/media/shitposting.gif" style="width: 100%; height: 100%">';
	
	
		##################################################################################
		
		
		if ($board == "mod") {
			if ($auth == 1) {
				##################################################################################
				// Mod updates!
				
				#error("woah hey not yet bro");
				
				#die();
				
				if ($_POST['dash']) {
					$sitename 	= $_POST['sitename'];
					$alert		= $_POST['alert'];
				
					mysql_query("
						UPDATE ".$cfg['prefix']."_config SET
							conf_sitename='$sitename',
							conf_alert='$alert'
					")or die(mysql_error());
				}
				
				redirect("/mod/");
			} else {
				error("test");
				die();
			}
			
		} else {
			##################################################################################
			// Let's post something to the board
			
			$query = "SELECT * FROM ".$cfg['prefix']."_boards";
			$result = mysql_query($query) or die(mysql_error());
			$boards = array();
			while ($row = mysql_fetch_array($result)) {
				array_push($boards, $row['board_addr']);
			}
			
			
			##################################################################################
			
			
			if (in_array($board, $boards)) { // Does the board we're trying to post to exist?
			
				$date = date("Y/m/d H:i:s");
				$url = trim($_POST['url']);
				
				
				// Tripcode/name field
				if($_POST['name'] != '') {
					$author = mysql_real_escape_string($_POST['name']);
					if (preg_match('/^([^#]+)?(##|#)(.+)$/', $author, $match)) {
					
						$name = explode("#",$author);
						$author = $name[0];
						
						$secure = $match[2] == "##";
						$trip = $match[3];
						$trip = mb_convert_encoding($trip, 'Shift_JIS', 'UTF-8');
						
						$salt = substr($trip."H.",1,2);
						$salt = preg_replace("/[^\.-z]/",".",$salt);
						$salt = strtr($salt,":;<=>?@[\\]^_`","ABCDEFGabcdef");
						
						if ($secure) {
							if (($trip == "admin") && ($auth)) {
								$trip = "Admin";
							} else if (($trip == "mod") && ($auth)) {
								$trip = "Moderator";
							} else {
								$trip = substr(crypt($trip, '_..h.'.substr(base64_encode(sha1($trip . "68e69091a6a7aeb5e6a7860074a4d9ce", true)), 0, 4)), -10);
							}
						} else {
							$trip = substr(crypt($trip, $salt), -10);
						}
						
					}
				 } else {
					$author = "Anonymous";
				}
				
			
			##################################################################################
			
				// Gather up sum data
				
				$spoiler = 0;
				$spoiler = $_POST['spoiler'];
				
				$content = mysql_real_escape_string($_POST['text']);
				$content = htmlspecialchars($content);
				if (strlen($content)>5000) {
					error("Post length was too long (5000 max characters)");
				}
				
				// ignore the bump limit if we're starting a new thread
				
				if ($thread == '') {
					$query = "SELECT * FROM ".$cfg['prefix']."_config";
					$result = mysql_query($query) or die(mysql_error());
					$bumplimit = mysql_fetch_array($result);
					$bumplimit = $bumplimit['conf_bumplimit'];
				
					$query = "SELECT * FROM ".$cfg['prefix']."_threads WHERE threads_uid='$thread' LIMIT 1";
					$result = mysql_query($query) or die(mysql_error());
					$bumps = mysql_fetch_array($result);
					$bumps = $bumps['threads_replies'];
				
					if ($bumps >= $bumplimit) {
						$nobump = true;
					}
				}
				
			
			
			##################################################################################
				
				
				// Email field for easter eggs
				
				$nobump = false;
				$email = mysql_real_escape_string($_POST['email']);
				$subject = mysql_real_escape_string($_POST['subject']);
				
				# actually you know what todo: make function for parsing email so i can add to it without making this file bigger
				# and while im at it, split everything else up into functions too
				switch ($email) {
					case "sage":
						$nobump = true;
						break;
					default:
						break;
				}
				
			
			##################################################################################
				
				
				if (!$_POST['text']) {
					if($_FILES["file"]["name"] == '') {
						if ($url == '') {
							error("No message sent");
						} else {
							$extension = pathinfo($url, PATHINFO_EXTENSION);
							$extensions = array("gif", "png", "jpg", "jpeg", "bmp", "webm");
							if (!in_array($extension, $extensions)) {
								error("Extension error");
							}
						}
					}
				}
				
				
			##################################################################################
			
					
				mysql_query("UPDATE ".$cfg['prefix']."_boards SET board_posts=board_posts+1 WHERE board_addr='$board'");
				$query = "SELECT * FROM ".$cfg['prefix']."_boards WHERE board_addr='$board'";
				$result = mysql_query($query) or die(mysql_error());
				$uid = mysql_fetch_array($result);
				$uid = $uid['board_posts'];
				
				
			
				if (!$thread) { // new thread
				
					$post_isop = 1;
					$thread = $uid;

					// Make the thread
					mysql_query("
						INSERT INTO bbs_threads(
							threads_uid,
							threads_board,
							threads_replies,
							threads_bump
						) VALUES(
							'$uid',
							'$board',
							'1',
							'$date'
						)
					")or die(mysql_error());
					
				} else {
				
					$post_isop = 0;
					
					if ($nobump == false) {
						mysql_query("UPDATE ".$cfg['prefix']."_threads SET threads_bump='$date', threads_replies=threads_replies+1 WHERE threads_uid='$thread'");
					} else {
						mysql_query("UPDATE ".$cfg['prefix']."_threads SET threads_replies=threads_replies+1 WHERE threads_uid='$thread'");
					}
					
				}
				
				
					
				$filename = '';
				if($_FILES["file"]["name"] != ''){
					$filename = upload(1);
				} else if($url){
					$filename = upload(2);
				}
				
				

				// Post it!
				mysql_query("
					INSERT INTO ".$cfg['prefix']."_posts(
						post_uid,
						post_board,
						post_thread,
						post_date,
						post_author,
						post_trip,
						post_email,
						post_subject,
						post_content,
						post_image,
						post_spoiler,
						post_isop,
						post_ip
					) VALUES(
						'$uid',
						'$board',
						'$thread',
						'$date',
						'$author',
						'$trip',
						'$email',
						'$subject',
						'$content',
						'$filename',
						'$spoiler',
						'$post_isop',
						'$cfg[user_ip]'
					)
				")or die(mysql_error());
				$post_id = mysql_insert_id();
				
				setcookie("splint_remember-me", $_POST['name'], time()+(10*365*24*60*60));
				redirect($board."/thread/".$thread."/#".$uid);
					
			
				
			} else {
				error("no");
			}
		}
	}

?>