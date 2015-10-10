<?php
		
	require("lib/inc/config.php");
	include("lib/inc/functions.php");
		
	if (!$_POST) {
		alert("woah hey what the fuck are you doing");
		redirect("/home/");
		die();
	} else {
	
    	if ((isset($_POST['board'])) && (isset($_POST['thread'])) && (isset($_POST['post']))) {
    		$board = $_POST['board'];
    		$thread = $_POST['thread'];
    		$post = $_POST['post'];
    	
    		if (!$auth) {
    			$query = "SELECT * FROM ".$cfg['prefix']."_reports WHERE report_post = $post";
    			$result = mysql_query($query) or die(mysql_error());
    			$ip = mysql_fetch_array($result);
    			$ip = $ip['report_ip'];
    			$ip_array = explode(',', $ip);
    			$ip .= $cfg['user_ip'].",";
    			
    			if (!in_array($cfg['user_ip'],$ip_array)) {
    				
    				$query = "SELECT * FROM ".$cfg['prefix']."_posts WHERE post_id = $post LIMIT 1";
    				$result = mysql_query($query) or die(mysql_error());
    				$return = mysql_fetch_array($result);
    				$return = $return['post_uid'];
    				
    				// todo: one report per ip
    			
    				$result = mysql_query("SELECT * FROM ".$cfg['prefix']."_reports WHERE report_post='$post' LIMIT 1");
    				$num_rows = mysql_num_rows($result);
    
    				if ($num_rows > 0) {
    					
    				    alert('Report sent!');
    					
    				} else {
    				
    					mysql_query("
    						INSERT INTO ".$cfg['prefix']."_reports(
    							report_board,
    							report_thread,
    							report_post
    						) VALUES(
    							'$board',
    							'$thread',
    							'$post'
    						)
    					");
    					
    					alert('Report sent!');
    					
    				}
    					
    				mysql_query("UPDATE ".$cfg['prefix']."_posts SET post_reports = post_reports + 1 WHERE post_id = $post");
    				mysql_query("UPDATE ".$cfg['prefix']."_reports SET report_ip = '$ip' WHERE report_post='$post'");
    				
    			} else {
    				error("You've already reported this post.");
    			}
    		}  else {
    			alert('What are you trying to do?');
    		}
    	}
    	
    	// todo: clean this up
    	if ($board) {
    		if ($thread) {
    			if ($post) {
    			    redirect($board."/thread/".$thread."/#".$return);
    			} else {
    			    redirect($board."/thread/".$thread."/");
    			}
    		} else {
                redirect($board."/");
    		}
    	} else {
            redirect("/home/");
    	}
    	
	}
?>