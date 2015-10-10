<?php

	echo $IP;

	// Include objects
	include_once("lib/inc/config.php");
	include_once("lib/inc/functions.php");
	include_once("lib/inc/auth.php");
	include_once("lib/inc/controller.php");
	
	$controller = new Controller();
	$controller->output();
?>