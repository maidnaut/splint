<?php	

	echo '<img src="http://i.imgur.com/Ea4aGjG.png" style="width: 100%; height: 100%">';
		
	require("lib/inc/config.php");
	include("lib/inc/functions.php");
	include("lib/inc/auth.php");
		
	if ($auth != 1) {
	    
		alert("woah hey what the fuck are you doing");
		redirect("/home/");
		die();
		
	} else {
		
		##################################################################################
		// Mod updates!
		
		if ($_POST['dash']) { // Dashboard
			$sitename 	= $_POST['sitename'];
			$alert		= $_POST['alert'];
			$a_cap		= $_POST['a_cap'];
			$m_cap		= $_POST['m_cap'];
			$a_color	= $_POST['a_color'];
			$rcap		= $_POST['rcap'];
			$blimit		= $_POST['blimit'];
			$tlimit		= $_POST['tlimit'];
			$rules		= $_POST['rules'];
			$faq		= $_POST['faq'];
		
			mysql_query("
				UPDATE ".$cfg['prefix']."_config SET
					conf_sitename='$sitename',
					conf_alert='$alert',
					conf_admincolor='$a_cap',
					conf_modcolor='$m_cap',
					conf_anoncolor='$a_color',
					conf_reportcap='$rcap',
					conf_bumplimit='$blimit',
					conf_threadlimit='$tlimit',
					conf_rules='$rules',
					conf_faq='$faq'
			")or die(mysql_error());
		} else if ($_POST['disc']) {
            // Discussion
            
		} else if ($_POST['news']) {
		    // News
		    
		} else if ($_POST['boards']) {
		    //Boards
		    
		    print_r($_POST);
		    
		    //alert($_POST['a_name']);
		    
		    //error("hi");
		    
		    die();
		 
		} else if ($_POST['reports']) {
		    // Reports
		    
		} else if ($_POST['bans']) {
		    // Bans
		    
		} else if ($_POST['log']) {
		    // Logs
		    
		} else if ($_POST['users']) {
		    // Users
		    
		} else if ($_POST['banners']) {
		    // Banners
		    
		} else if (isset($_GET['unflag'])) {
			//Unflag

			global $cfg;
		
			$id = $_GET['id'];
			$board = $_GET['board'];
			$thread = $_GET['thread'];
			
			mysql_query("
				UPDATE ".$cfg['prefix']."_posts
				SET
					post_isexempt = 1
				WHERE
					post_id = '$id'
			");
			
			mysql_query("
				DELETE FROM ".$cfg['prefix']."_reports
				WHERE report_post = '$id'
			");
			
			//modLog($user, $board, 'made post #'.$id.' exempt from flagging', date("Y/m/d H:i:s"));
			redirect($_SERVER['HTTP_REFERER']);
		
		} else if (isset($_GET['delete'])) {
			$board;
			$mode;
			$post;
			$id;
		}
		
		redirect("/mod/");
		
	}
	
?>