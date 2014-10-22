<?php
	$banned = false;
	$ip = $cfg['user_ip'];
	$query = "SELECT * FROM bbs_bans WHERE bans_ip='$ip'";
	$result = mysql_query($query) or die(mysql_error());
	$bans = mysql_fetch_array($result);
?>
<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title><?=$cfg['sitename']?> - rip</title>
		<link rel="icon" type="image/png" href="<?=$cfg['sitedir']?>/lib/media/ico/douevenlift.png">
		<link href="<?=$cfg['sitedir']?>/lib/css/default.css" type="text/css" media="screen" rel="stylesheet">
		<link href="<?=$cfg['sitedir']?>/lib/css/mio.css" type="text/css" media="screen" rel="stylesheet">
	</head>
	<body>
		<div class="wrapper" style="width: calc(100% - 16px); position: absolute; top: 9.5%; left: 0; margin-top: -50px; /* half the height of the element */">
			<div class="frontpage" style="margin: 0 auto; height: 100% !important; width: 800px; vertical-align: middle; text-align: center;">
				<img src="http://i.imgur.com/bm3sbvT.png"> <br><br><br>
				<span style="font-size: 12pt;">Your IP (<?=$cfg['user_ip']?>) has been banned!</span> <br><br>
				<span style="opacity:0.8;"><?=$bans['bans_reason']?></span> <br><br>
		
				If you believe this to be in error, feel free to <s>drop us a line at <a href="mailto:<?=$cfg['support']?>"><?=$cfg['support']?></a></s> kill yourself.<br><br>
			</div>
		</div>
	</body>
</html>