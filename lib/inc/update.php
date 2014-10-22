<?php

	include("config.php");
	include("functions.php");
	include("auth.php");
	
	$last_id = $_GET['last_id'];
	$addr = $_GET['addr'];
	$thread = $_GET['thread'];
	//$update = "nothing...<br>";
	
	//$update = $last_id;

	$query = "SELECT * FROM ".$cfg['prefix']."_posts WHERE post_uid > $last_id AND post_thread='$thread' AND post_board='$addr' ORDER BY post_uid DESC";
	$result = mysql_query($query);
	$postdata = array();
	while ($row = mysql_fetch_assoc($result)) {
		$postdata[] = $row;
	}
	$postdata = array_reverse($postdata);
	foreach($postdata as $postdata) {
		
		$postdata = postdata($postdata);
		$last_id = $postdata['post_uid'];
		
		include("ext/globals/view_post.tpl");
	}
	
	//echo "<br><br>".$last_id;
	
	//setcookie("splint.update", $last_id);


?>
	
	<script type="text/javascript">
		var last_id = <?=$last_id?>;
	</script>