<?php				
	$query = mysql_query("SET NAMES utf8");
	$query = "SELECT * FROM ".$cfg['prefix']."_config";
	$result = mysql_query($query) or die(mysql_error());
	
	$conf = mysql_fetch_array($result);
?>

<!-- Global Settings -->
<form action="/mod.php" method="post">
<div class="postbody" style="margin-left: 80px; padding-top: 12px;">
	<div style="float: left; width: 25%; height: 26px; position: relative; top: 5px;">
		<b>Dashboard</b>
	</div>
	<div style="float: right; width: 75%; position: relative; top: 4px;">
		Site is <span style='color: #2A2; font-weight: bold;'>live</span>
	</div>
	
	<div class="spacer" style="clear: both;"><br></div>
	
	<div style="float: left; width: 25%; height: 26px; position: relative; top: 5px;">
		Site Name
		<a href='javascript:void(0);' style='font-size: 6pt; position: relative; top: -6px; right: -4px;'
			title='Whats our name?'
		>?</a>
	</div>
	<div style="float: right; width: 75%;">
		<input type="text" style="width: 100%;" value="<?=$conf['conf_sitename']?>" name="sitename">
	</div>
	<div class="spacer" style="clear: both;"></div>
	<div style="float: left; width: 25%; height: 26px; position: relative; top: 5px;">
		Alert
		<a href='javascript:void(0);' style='font-size: 6pt; position: relative; top: -6px; right: -4px;'
			title='Red text under the header'
		>?</a>
	</div>
	<div style="float: right; width: 75%;">
		<input type="text" style="width: 100%;" value="<?=$conf['conf_alert']?>" name="alert">
	</div>
	<div class="spacer" style="clear: both;"></div>
	<div style="float: left; width: 25%; height: 26px; position: relative; top: 5px;">
		Favicon
		<a href='javascript:void(0);' style='font-size: 6pt; position: relative; top: -6px; right: -4px;'
			title='Do u even lift bro?'
		>?</a>
	</div>
	<div style="float: right; width: 75%;">
		<img src="/lib/media/ico/douevenlift.png" style="width: 32px; height: auto; position: relative; top: 10px;"> &nbsp;
		<input type="file">
	</div>
	
	<div class="spacer" style="clear: both;"><br></div>
	
	<div style="float: left; width: 25%; height: 26px; position: relative; top: 6px;">
		Admin Color
		<a href='javascript:void(0);' style='font-size: 6pt; position: relative; top: -6px; right: -4px;'
			title='Capcode color for admins'
		>?</a>
	</div>
	<div style="float: right; width: 75%;">
		<input type="text" value="<?=$conf['conf_admincolor']?>" name="a_cap">
	</div>
	<div class="spacer" style="clear: both;"></div>
	<div style="float: left; width: 25%; height: 26px; position: relative; top: 6px;">
		Mod Color
		<a href='javascript:void(0);' style='font-size: 6pt; position: relative; top: -6px; right: -4px;'
			title='Capcode color for board moderators'
		>?</a>
	</div>
	<div style="float: right; width: 75%;">
		<input type="text" value="<?=$conf['conf_modcolor']?>" name="m_cap">
	</div>
	<div class="spacer" style="clear: both;"></div>
	<div style="float: left; width: 25%; height: 26px; position: relative; top: 6px;">
		Anon Color
		<a href='javascript:void(0);' style='font-size: 6pt; position: relative; top: -6px; right: -4px;'
			title="Generic color for anonymous posters."
		>?</a>
	</div>
	<div style="float: right; width: 75%;">
		<input type="text" value="<?=$conf['conf_anoncolor']?>" name="a_color">
	</div>
	
	<div class="spacer" style="clear: both;"><br></div>
	
	<div style="float: left; width: 25%; height: 26px; position: relative; top: 6px;">
		Report Cap
		<a href='javascript:void(0);' style='font-size: 6pt; position: relative; top: -6px; right: -4px;'
			title='How many reports until a post is hidden?'
		>?</a>
	</div>
	<div style="float: right; width: 75%;">
		<input type="text" value="<?=$conf['conf_reportcap']?>" name="rcap">
	</div>
	<div class="spacer" style="clear: both;"></div>
	<div style="float: left; width: 25%; height: 26px; position: relative; top: 6px;">
		Bump Limit
		<a href='javascript:void(0);' style='font-size: 6pt; position: relative; top: -6px; right: -4px;'
			title='How many posts until autosage?'
		>?</a>
	</div>
	<div style="float: right; width: 75%;">
		<input type="text" value="<?=$conf['conf_bumplimit']?>" name="blimit">
	</div>
	<div class="spacer" style="clear: both;"></div>
	<div style="float: left; width: 25%; height: 26px; position: relative; top: 6px;">
		Thread Limit
		<a href='javascript:void(0);' style='font-size: 6pt; position: relative; top: -6px; right: -4px;'
			title='How many threads until we make a new page?'
		>?</a>
	</div>
	<div style="float: right; width: 75%;">
		<input type="text" value="<?=$conf['conf_threadlimit']?>" name="tlimit">
	</div>
	
	<div class="spacer" style="clear: both;"><br></div>
	
	Rules <br><br>
	<textarea style="width: 100%; height: 250px;" name="rules"><?=$conf['conf_rules']?></textarea>
	<br><br><br>
		
	FAQ <br><br>
	<textarea style="width: 100%; height: 250px;" name="faq"><?=parseText($conf['conf_faq'])?></textarea>
	<br><br><br>
	
	<div style="float: left; width: 25%; height: 26px; position: relative; top: 5px;">
		My Password
	</div>
	<div style="float: right; width: 75%;">
		<input type="text" style="width: 100%;">
	</div>
	
	<div class="spacer" style="clear: both;"><br></div>
	
	<div style="float: left; width: 25%; height: 26px; position: relative; top: 6px;">&nbsp;</div>
	<div style="float: right; width: 75%;">
		<input type='hidden' name='dash' value="dash">
		<button type='submit' class='btn btn-mini'>Update!</button> &nbsp;&nbsp;&nbsp;&nbsp;
		<button type='submit' class='btn btn-mini' name='offline' value='Go offline' title='Take the site offline'>Go offline</button>
	</div>
	
</div>
<div class="spacer" style="clear: both;"></div>
</form>