<?php
	$query = "SELECT * FROM ".$cfg['prefix']."_config";
	$result = mysql_query($query) or die(mysql_error());
	$row = mysql_fetch_array($result);
	$faq = $row['conf_faq'];
?>