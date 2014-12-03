<?php
	include_once("lib/inc/config.php");
	include_once("lib/inc/functions.php");
	
	if (!$_COOKIE['splint_auth']) {
		if (($_POST['username'] != '') && ($_POST['password'] != '')) {
			$username = $_POST['username'];
			$password = md5($cfg['salt'].$_POST['password']);
		
			$query = "SELECT * FROM ".$cfg['prefix']."_staff";
			$result = mysql_query($query) or die(mysql_error());
			while($userdata = mysql_fetch_array($result)) {
				if ($username == $userdata['staff_username']) {
					if ($password == $userdata['staff_password']) {
						setcookie("splint_auth", $username."-".$password, time()+(10*365*24*60*60), '/');
					}
				}
			}
		}
	} else {
		include("/lib/inc/auth.php");
	}

	redirect("/mod/");

?>