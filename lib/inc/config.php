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
	$query = "SELECT * FROM ".$cfg['prefix']."_config";
	$result = mysql_query($query) or die(mysql_error());
	$row = mysql_fetch_array($result);
	
	//////////////////////////////////////////////////////////////////////////////////////////
	// tpl array
	//////////////////////////////////////////////////////////////////////////////////////////
	
	$tpl = array();
	
	$cfg['sitename'] 		= 		$row['conf_sitename'];
	$cfg['sitedir'] 		= 		"";
	$cfg['rootdir'] 		= 		$_SERVER['DOCUMENT_ROOT'];

	$cfg['offline']			= 		$row['conf_offline'];
	$cfg['faq'] 			= 		$row['conf_faq'];
	$cfg['alert'] 			= 		$row['conf_alert'];
	$cfg['version'] 		= 		"Splint v0.3a";
	$cfg['support'] 		= 		"support@ka-ch.org";
	$cfg['staff'] 			= 		$row['conf_staffcolor'];
	$cfg['anon'] 			=	 	$row['conf_anoncolor'];
	$cfg['rcap'] 			=	 	$row['conf_reportcap'];
	$cfg['threadlimit'] 	=	 	$row['conf_threadlimit'];
	$cfg['user_ip']			=		$_SERVER['REMOTE_ADDR'];
	
	$cfg['pmax']			=		5; // max votes on a poll

?>