<?php

	class Model {
	
		public $addr;
		public $model;
		public $view;
		public $cfg;
		
		public function minify($model,$view,$addr) {

			ob_start();
			extract($GLOBALS, EXTR_REFS | EXTR_SKIP); // gg globals
			
			// Page title?
			$nope = array("home","rules","faq","polls","mod");
			if ($addr == "home") {
				$title = $cfg['sitename'];
			} else {
				$query = "SELECT * FROM ".$cfg['prefix']."_boards WHERE board_addr='$addr'";
				$result = mysql_query($query) or die(mysql_error());
				$board = mysql_fetch_array($result);
				$title = "/".$addr."/";
				if ($board['board_name'] != null) {
					$title .="- ".$board['board_name'];
				}
			}
			
			include("lib/inc/ext/globals/header.tpl");
			
			if (!empty($model)) { include($model); }
			if (!empty($view)) { include($view); }
			
			include("lib/inc/ext/globals/footer.tpl");
		
			$view = ob_get_contents();
			ob_end_clean();
		
			$view = preg_replace('/\s\s+/', ' ', $view);
			$view = str_replace(array("\n", "\r"), "", $view);
		
			return $view;
		 
		}
	
		public function getPage($addr) {
		
			global $cfg;
			$url = explode("/", $_SERVER['REQUEST_URI']);
			
			// Check to see if we're banned
			$banned = false;
			$query = "SELECT * FROM bbs_bans";
			$result = mysql_query($query) or die(mysql_error());
			while($bans = mysql_fetch_array($result)) {
				if ($cfg['user_ip'] == $bans['bans_ip']) {
					include("lib/inc/ext/globals/banned.tpl");
					die();
				}
			}
			
			// Are we offline?
			if (($cfg['offline'] == 1) && (!$auth) && ($addr != "mod")) {
				include("lib/inc/ext/globals/offline.tpl");
				die();
			}
			
			###
			
			// Let's make the boards array
			$query = "SELECT * FROM ".$cfg['prefix']."_boards";
			$result = mysql_query($query) or die(mysql_error());
			$boards = array();
			while ($row = mysql_fetch_array($result)) {
				array_push($boards, $row['board_addr']);
			}
			
			// Are we on a board?
			if (in_array($addr,$boards)) {
			
				// Is the board retired?				
				$query = "SELECT * FROM ".$cfg['prefix']."_boards WHERE board_addr='".$addr."'";
				$result = mysql_query($query) or die(mysql_error());
				$row = mysql_fetch_array($result);
			
				if ($row['board_retired'] == 1) {
					echo "retired";
					$model = "lib/inc/ext/globals/retired.tpl";
				} else {
					if ($url[2] == "thread") { // Are we in a thread?
						$model = "lib/inc/ext/thread/thread.php";
					} else if ($url[2] == "catalog") { // Viewing catalog?
						$model = "lib/inc/ext/catalog/catalog.php";
						$view = "lib/inc/ext/catalog/catalog.tpl";
					} else { // We're on the board!
						$model = "lib/inc/ext/board/board.php";
					}
				}
			} else {
				// We're on a static page
				$model = "lib/inc/ext/".$addr."/".$addr.".php";
				$view = "lib/inc/ext/".$addr."/".$addr.".tpl";
			}
				
			if (($addr == fnmatch("global_*", $addr)) || (!file_exists($model))) {
				if ($addr != "404") {
					// file not exist pls go 404
					header("Location: /404/");
				}
			} else {
				return $this->minify($model,$view,$addr);
			}
			
		}
		
	}
	
?>