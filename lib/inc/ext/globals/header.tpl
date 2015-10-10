<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="viewport" content="width=device-width" />
		<title><?=$title?></title>
		<link rel="icon" type="image/png" href="<?=$cfg['sitedir']?>/lib/media/ico/douevenlift.png">
		<link rel="stylesheet" type="text/css" href="/lib/css/default.css" media="screen and (min-width:480px)">
		<link rel="stylesheet" type="text/css" href="/lib/css/default.480.css" media="only screen and (min-width: 320px) and (max-width:480px)">
		<link rel="stylesheet" type="text/css" href="/lib/css/default.320.css" media="only screen and (max-width:320px)">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
		<link href="/lib/css/mio.css" title="mio" type="text/css" media="screen" rel="alternate stylesheet">
		<link href="/lib/css/yuuko.css" title="yuuko" type="text/css" media="screen" rel="alternate stylesheet">
		<link href="/lib/css/rollerskates.css" title="rollerskates" type="text/css" media="screen" rel="alternate stylesheet">
		<link href="/lib/css/splint.css" title="splint" type="text/css" media="screen" rel="stylesheet">
		<link href="/lib/css/ubuu.css" title="ubuu" type="text/css" media="screen" rel="alternate stylesheet">


		<script src="//code.jquery.com/jquery-1.9.1.js" type="text/javascript"></script>

		<script src="//code.jquery.com/ui/1.9.2/jquery-ui.js" type="text/javascript"></script>

		<link href="//code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" type="text/css" rel="stylesheet"></link>

		<script type="text/javascript" src="/lib/js/stylesheet.js"></script>
		<script type="text/javascript" src="/lib/js/sortable.js"></script>
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
				<a href="/home/" style="position: fixed; left: 24px; top: 4px;">
				(͡° ͜ʖ ͡°)
				&nbsp;&nbsp;&nbsp;
				</a>
				
		
				&nbsp;&nbsp;&nbsp;
				
				<span class="nav-text">
					&nbsp; <a href="javascript:void(0);" class="toggle" title="Open Menu">+</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
					<span class="hide" style="display: none;">
						 [ &nbsp;
							<a href="/home/">home</a> /
							<a href="/rules/">rules</a> /
							<a href="/faq/">faq</a> / <!--
							<a href="http://archive.uboachan.net/">archive</a> /
							<a href="http://archive.uboachan.net/media/src/Yume_Nikki.rar">v0.10 Download</a> / -->
							<a href="https://kiwiirc.com/client/irc.irchighway.net/?theme=cli#uboachan" target="_blank">chat</a>
						&nbsp; ] &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
					</span>
		
					<?=nav()?>
					
				</span>
				
				<script type="text/javascript">
				$( ".toggle" ).click(function() {
					
					$(".hide").toggle(100);
					($(".toggle").text() === "+") ? $(".toggle").text("-") : $(".toggle").text("+");
					 
				});
				</script>
				
				
					
				
				&nbsp;<?php /*if (($cfg['offline'] == 0) || ($auth)) {  }*/ ?>
				<div class="nav-icon"><a href="/mod/"><i class="fa fa-cogs" title="Staff Panel"></i></div>
			</div>
			<div id="styles" style="z-index: 9002; float: right; position: fixed; top: 36px; right: 9px;">
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
				<a onclick="setActiveStyleSheet('splint'); return false;" title="Splint" href="javascript:void(0);"><div style="
					width: 15px; height: 15px; background: #c06ddb; margin-bottom: 4px; margin-right: 4px;
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
				<?php banner(); ?>
				<h1> <?=$title?> </h1>
				<?php if ($board['board_sub'] != '') { ?>
					<div style="opacity:0.8; font-size: 8pt;"><?=$board['board_sub']?></div>
				<?php } ?>
				<div style="font-weight: bold; color: red; margin-left:auto; margin-right:auto; max-width: 500px; font-size: 10pt;">
					<br><?=$cfg['alert']?>
				</div>
				<?php
					if (($auth) && ($cfg['offline'] == 1)) {
						echo "Site is offline";
					}
				?>
			</div>
		</div>