<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title><?=$title?></title>
		<link rel="icon" type="image/png" href="<?=$cfg['sitedir']?>/lib/media/ico/douevenlift.png">
		<link href="/lib/bootstrap/css/bootstrap.css" rel="stylesheet">
		<link href="/lib/css/default.css" type="text/css" media="screen" rel="stylesheet">
		<link href="/lib/css/splint.css" title="splint" type="text/css" media="screen" rel="stylesheet">
		<link href="/lib/css/mio.css" title="mio" type="text/css" media="screen" rel="alternate stylesheet">
		<link href="/lib/css/yuuko.css" title="yuuko" type="text/css" media="screen" rel="alternate stylesheet">
		<link href="/lib/css/rollerskates.css" title="rollerskates" type="text/css" media="screen" rel="alternate stylesheet">
		<link href="/lib/css/ubuu.css" title="ubuu" type="text/css" media="screen" rel="alternate stylesheet">
		<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
		<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
		<script type="text/javascript" src="/lib/js/stylesheet.js"></script>
		<script type="text/javascript">
			$(function() {
				$( document ).tooltip();
			});
		</script>
	</head>
<body>
	<div class="wrapper">
		<div class="header">
			<div class="nav" style="padding-left: 72px;">
				<a href="/home/">
					<img src="/lib/media/ico/douevenlift.png" style="width: 32px; height: auto; float: left; position: fixed; top: -4px; left: 24px;">
				</a>
				<?=nav()?>
				&nbsp;<?php /*if (($cfg['offline'] == 0) || ($auth)) {  }*/ ?>
				<div style="float: right; position: fixed; top: 4px; right: 12px;"><a href="/mod/"><img src="/lib/media/ico/admin.png" title="Staff Panel"></a></div>
			</div>
			<div id="styles" style="z-index: 9002; float: right; position: fixed; top: 36px; right: 9px;">
				<a onclick="setActiveStyleSheet('splint'); return false;" title="Splint" href="javascript:void(0);"><div style="
					width: 15px; height: 15px; background: #4DA0BB; margin-bottom: 4px; margin-right: 4px;
					box-shadow: 1px 1px 2px #000;
					border-bottom: 1px solid #000;
					border-radius: 2px;">&nbsp;</div>
				</a>
				<a onclick="setActiveStyleSheet('mio'); return false;" title="Mio" href="javascript:void(0);"><div style="
					width: 15px; height: 15px; background: #C5C5D0; margin-bottom: 4px; margin-right: 4px;
					box-shadow: 1px 1px 2px #000;
					border-bottom: 1px solid #000;
					border-radius: 2px;">&nbsp;</div>
				</a>
				<a onclick="setActiveStyleSheet('yuuko'); return false;" title="Yuuko" href="javascript:void(0);"><div style="
					width: 15px; height: 15px; background: #E2C49C; margin-bottom: 4px; margin-right: 4px;
					box-shadow: 1px 1px 2px #000;
					border-bottom: 1px solid #000;
					border-radius: 2px;">&nbsp;</div>
				</a>
				<a onclick="setActiveStyleSheet('rollerskates'); return false;" title="Rollerskates" href="javascript:void(0);"><div style="
					width: 15px; height: 15px; background: #92BE9E; margin-bottom: 4px; margin-right: 4px;
					box-shadow: 1px 1px 2px #000;
					border-bottom: 1px solid #000;
					border-radius: 2px;">&nbsp;</div>
				</a>
				<a onclick="setActiveStyleSheet('ubuu'); return false;" title="Uboachan" href="javascript:void(0);"><div style="
					width: 15px; height: 15px; background: #B03030; margin-bottom: 4px; margin-right: 4px;
					box-shadow: 1px 1px 2px #000;
					border-bottom: 1px solid #000;
					border-radius: 2px;">&nbsp;</div>
				</a>
			</div>
			<div class="title">
				<?php /*banner();*/ ?>
				<img src="/lib/media/banners/splint.png"> <br>
				<h1> <?=$title?> </h1>
				<?php if ($board['board_sub'] != '') { ?>
					<div style="opacity:0.8; font-size: 8pt;"><?=$board['board_sub']?></div>
				<?php } ?>
				<div style="font-weight: bold; color: red; margin-left:auto; margin-right:auto; max-width: 500px; word-break: break-all !important; font-size: 10pt;">
					<br><?=$cfg['alert']?>
				</div>
				<?php
					if (($auth) && ($cfg['offline'] == 1)) {
						echo "Site is offline";
					}
				?>
			</div>
		</div>