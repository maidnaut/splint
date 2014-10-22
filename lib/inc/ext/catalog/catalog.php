<?php

	$url = explode("/", $_SERVER['REQUEST_URI']);
	$threads = array();
	$thread_id = array();
	$catalog = array();
	
	$query = mysql_query("SELECT * FROM ".$cfg['prefix']."_threads WHERE threads_board='$addr' ORDER BY threads_sticky DESC, threads_bump DESC") or die(mysql_error());
	while($row = mysql_fetch_array($query)) {
		array_push($threads, $row['threads_uid']);
		$threaddata = $row;
	}
	
	if (!empty($threads)) {
	
		foreach($threads as $thread_id) {
			
			$query = "SELECT * FROM ".$cfg['prefix']."_threads WHERE threads_uid='$thread_id' AND threads_board='$addr' ORDER BY threads_bump DESC";
			$result = mysql_query($query) or die(mysql_error());
			while($threaddata = mysql_fetch_array($result)) {
			
				$thread_id = $threaddata['threads_uid'];
				$threaddata['threads_bump'] = fuzzyTime($threaddata['threads_bump']);
				
				$query = "SELECT * FROM ".$cfg['prefix']."_posts WHERE post_thread='$thread_id' AND post_board='$addr' AND post_isop=1 ORDER BY post_date DESC";
				$result = mysql_query($query) or die(mysql_error());
				
				while($postdata = mysql_fetch_array($result)) {
					
					if (!empty($postdata['post_image'])) {
						$catalog[] = array(
							"images"	=>	$postdata['post_image'],
							"thread"	=>	$url[1]."/thread/".$postdata['post_thread']."/#".$postdata['post_thread'],
							"replies"	=>	$threaddata['threads_replies'],
							"subject"	=>	$postdata['post_subject'],
							"content"	=>	$postdata['post_content']
						);
					}
				}
				
			}
		}
	
	} else {
	
		include("lib/inc/ext/globals/view_empty.tpl");
	
	}
?>