<?php

	include("lib/tpl/reply.tpl");
	
	// Setup for pagination
	
	$url = explode("/", $_SERVER['REQUEST_URI']);
	
	$page = 0;
	if ($url[2]) {
		if (is_numeric($url[2])) {
			$page = $url[2];
		}
	}
	$page += 1;
				
	if (($url[2] != "thread") && ($url[2] != "catalog")) {
	
		$query = mysql_query("SELECT * FROM ".$cfg['prefix']."_threads WHERE threads_board='$addr' ORDER BY threads_sticky DESC, threads_bump DESC");
		$rows = mysql_num_rows($query);
		if ($rows) {
			$limit = $cfg['threadlimit'];
			$last = ceil($rows/$limit);
			if ($page < 1)
				$page = 1;
			else if ($page > $last)
				$page = $last;
			$max = 'limit ' . ($page - 1) * $limit .','. $limit;
			$total = $rows;
		}
		$m_query = mysql_query("SELECT * FROM ".$cfg['prefix']."_threads WHERE threads_board='$addr' ORDER BY threads_sticky DESC, threads_bump DESC $max") or die(mysql_error());
	} else {
		$m_query = mysql_query("SELECT * FROM ".$cfg['prefix']."_threads WHERE threads_board='$addr' ORDER BY threads_sticky DESC, threads_bump DESC");
	}
	
	$threads = array();
	while($row = mysql_fetch_array($m_query)) {
		array_push($threads, $row['threads_uid']);
		$threaddata = $row;
	}
					
	$thread_id = array();
	
	if (!empty($threads)) {
	
		foreach($threads as $thread_id) {
			
			$query = "SELECT * FROM ".$cfg['prefix']."_threads WHERE threads_uid='$thread_id' AND threads_board='$addr' ORDER BY threads_bump DESC";
			$result = mysql_query($query) or die(mysql_error());
			while($threaddata = mysql_fetch_array($result)) {
			
				$thread_id = $threaddata['threads_uid'];
				$threaddata['threads_bump'] = fuzzyTime($threaddata['threads_bump']);
				
				$query = "SELECT * FROM ".$cfg['prefix']."_posts WHERE post_thread='$thread_id' AND post_board='$addr' AND post_isop=1";
				$result = mysql_query($query) or die(mysql_error());
				
				echo "<div class='threadcontainer'>";
				
					// OP
					while($postdata = mysql_fetch_array($result)) {
						$postdata = postdata($postdata);

						echo '
							<div style="margin-bottom: 4px; margin-top: -12px; opacity:0.6; font-size: 7pt;">
								<br>
								'.$threaddata['threads_replies'].' Replies, last updated '.$threaddata['threads_bump'].' - Thread started '.fuzzyTime($postdata['post_date']).' &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
								<a href="/'.$addr.'/thread/'.$thread_id.'/#'.$thread_id.'">Click here</a> to reply
							</div>
							<div id="'.$postdata['post_uid'].'" style="float: left; position: relative; margin: -32px;">&nbsp;</div>
						';
					
						include("lib/tpl/view_post_op.tpl");
					}
				
					// Replies
					$query = "SELECT * FROM ".$cfg['prefix']."_posts WHERE post_thread='$thread_id' AND post_board='$addr' AND post_isop=0 ORDER BY post_date DESC LIMIT 5";
					$result = mysql_query($query) or die(mysql_error());
					
					while ($row = mysql_fetch_assoc($result)) {
						$postdata[] = $row;
					}
					$postdata = array_reverse($postdata);
					
					foreach($postdata as $postdata) {
						$postdata = postdata($postdata);
						include("lib/tpl/view_post.tpl");		
					}
					
				echo "</div>";
			}
		}
		
		include("pagination.php");
	
	} else {
	
		include("lib/tpl/view_empty.tpl");
	
	}
	


?>