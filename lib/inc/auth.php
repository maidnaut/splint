<?php
	$auth = 0;
	if ($_COOKIE['splint_auth']) {
		$cookiedata = explode("-", $_COOKIE['splint_auth']);
		$query = "SELECT * FROM ".$cfg['prefix']."_staff";
		$result = mysql_query($query) or die(mysql_error());
		while($userdata = mysql_fetch_array($result)) {
			if ($cookiedata[0] == $userdata['staff_username']) {
				if ($cookiedata[1] == $userdata['staff_password']) {
					$user = $userdata['staff_username'];
					$auth = $userdata['staff_level'];
				}
			}
		}
	}
?>