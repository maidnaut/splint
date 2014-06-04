<?php

	include("lib/tpl/reply.tpl");
		
	echo "<div class='threadcontainer' style='margin-bottom: 8px;'>";
		echo "<a href='/$addr/'><< Return</a>";
		echo "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
		echo "
			[ <a href='javascript:window.scrollTo(0,document.body.scrollHeight);'>Bottom</a> ] &nbsp;
			[ <a href='/$addr/catalog/'>Catalog</a> ] &nbsp;
			[ <a href='javascript:void(0);'>Update</a> ]
		";
	echo "</div>";
	
	$url = explode("/", $_SERVER['REQUEST_URI']);
	$thread_id = $url[3];
			
	$query = "SELECT * FROM ".$cfg['prefix']."_threads WHERE threads_uid='$thread_id' AND threads_board='$addr' ORDER BY threads_bump DESC";
	$result = mysql_query($query) or die(mysql_error());
	while($threaddata = mysql_fetch_array($result)) {
	
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
					</div>
					<div id="'.$postdata['post_uid'].'" style="float: left; position: relative; margin: -32px;">&nbsp;</div>
				';
				
				include("lib/tpl/view_post_op.tpl");
			}
		
			// Replies
			$query = "SELECT * FROM ".$cfg['prefix']."_posts WHERE post_thread='$thread_id' AND post_board='$addr' AND post_isop=0 ORDER BY post_date DESC";
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
		
	echo "<div class='threadcontainer' style='margin-bottom: 8px;'>";
		echo "<a href='/$addr/'><< Return</a>";
		echo "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
		echo "
			[ <a href='javascript:window.scrollTo(0,top);'>Top</a> ] &nbsp;
			[ <a href='/$addr/catalog/'>Catalog</a> ] &nbsp;
			[ <a href='javascript:void(0);'>Update</a> ]
		";
	echo "</div>";
	


?>