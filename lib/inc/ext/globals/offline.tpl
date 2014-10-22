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
		
			<div class="header" style="padding-bottom: 40px;">
				<div class="nav" style="padding-left: 72px; background: none;">
					<div class="nav-icon"><a href="/mod/"><img src="/lib/media/ico/admin.png" title="Staff Panel"></a></div>
				</div>
				<div class="title">
					<?php banner(); ?>
					<h1> <?=$title?> </h1>
				</div>
			</div>
			
			<div class="frontpage">
				<div class="title" style="position: relative; top: -20px;">
					<h1>Offline</h1> <br>
					<?=$cfg['sitename']?> is going through a bit of maintenance, but we'll be back soon.
				</div>
			</div>
			
			<div class="threadcontainer reply" style="text-align: center; font-size: 7pt; opacity:0.6; margin-bottom: 0px;">
				&copy; 2013 <?=$cfg['sitename']?> - Powered by <a href="javascript:void(0);" title="Better than Tinyboard?"><?=$cfg['version']?></a> <br>
				
				<a href="https://github.com/maidnaut/splint" target="_blank"><img src="/lib/media/ico/github.png" style="width: 50px; height: 50px; position: relative; top: 5px;"></a>
			</div>
			
		</div>
	</body>
</html>