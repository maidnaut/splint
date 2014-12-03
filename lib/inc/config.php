<?php

	error_reporting(0);

	//////////////////////////////////////////////////////////////////////////////////////////
	// Database config
	//////////////////////////////////////////////////////////////////////////////////////////
	
	$dbhost = 'localhost';
	$dbuser = 'root';
	$dbpass = '';
	$dbname = 'splint';
	$cfg['prefix'] = "bbs";
	
	mysql_connect($dbhost, $dbuser, $dbpass) or die('Could not connect to database server.');
	mysql_select_db($dbname) or die('Could not select database.');
	$query = mysql_query("SET NAMES utf8");
	$query = "SELECT * FROM ".$cfg['prefix']."_config";
	$result = mysql_query($query) or die(mysql_error());
	$row = mysql_fetch_array($result);
	
	//////////////////////////////////////////////////////////////////////////////////////////
	// tpl array
	//////////////////////////////////////////////////////////////////////////////////////////
	
	$tpl = array();
	
	$cfg['sitename'] 		= 		$row['conf_sitename'];

	$cfg['offline']			= 		$row['conf_offline'];
	$cfg['faq'] 			= 		$row['conf_faq'];
	$cfg['alert'] 			= 		$row['conf_alert'];
	$cfg['version'] 		= 		"Splint v0.3a";
	$cfg['support'] 		= 		"support@ka-ch.org";
	$cfg['admin'] 			= 		$row['conf_admincolor'];
	$cfg['mod'] 			= 		$row['conf_modcolor'];
	$cfg['anon'] 			=	 	$row['conf_anoncolor'];
	$cfg['rcap'] 			=	 	$row['conf_reportcap'];
	$cfg['threadlimit'] 	=	 	$row['conf_threadlimit'];
	$cfg['user_ip']			=		$_SERVER['REMOTE_ADDR'];
	
	$cfg['salt'] 			= 		"splint";	// shit nigger what the fuck are you doing get this out of here
	
	$cfg['pmax']			=		5; // max votes on a poll

?>