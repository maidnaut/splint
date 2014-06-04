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
			$nope = array("home","news","rules","faq","polls","mod");
			if (in_array($addr,$nope)) {
				$title = $cfg['sitename'];
			} else {
				$query = "SELECT * FROM ".$cfg['prefix']."_boards WHERE board_addr='$addr'";
				$result = mysql_query($query) or die(mysql_error());
				$board = mysql_fetch_array($result);
				$title = "/".$addr."/ - ".$board['board_name'];
			}
			
			include("lib/tpl/global_header.tpl");
			include($model);
			include($view);
			include("lib/tpl/global_footer.tpl");
			
			$view = ob_get_contents();
			ob_end_clean();
			
			$view = preg_replace('/\s\s+/', ' ', $view);
			$view = str_replace(array("\n", "\r"), "", $view);
			
			return $view;
		 
		}
	
		public function getPage($addr) {
		
			global $cfg;
			$url = explode("/", $_SERVER['REQUEST_URI']);
			
			// Make boards array
			$query = "SELECT * FROM ".$cfg['prefix']."_boards";
			$result = mysql_query($query) or die(mysql_error());
			$boards = array();
			while ($row = mysql_fetch_array($result)) {
				array_push($boards, $row['board_addr']);
			}
			
			// Are we on a board?
			if (in_array($addr,$boards)) {
				if ($url[2] == "thread") { // Are we in a thread?
					$model = "lib/inc/model/thread.php";
					$view = "lib/tpl/thread.tpl";
				} else if ($url[2] == "catalog") { // Viewing catalog?
					$model = "lib/inc/model/catalog.php";
					$view = "lib/tpl/catalog.tpl";
				} else { // We're on the board!
					$model = "lib/inc/model/board.php";
					$view = "lib/tpl/board.tpl";
				}
			} else {
				// We're on a static page
				$model = "lib/inc/model/".$addr.".php";
				$view = "lib/tpl/".$addr.".tpl";
			}
			
			if (($addr == fnmatch("global_*", $addr)) || (!file_exists($model)) || (!file_exists($view))) {
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