<?php
    
	include_once("model.php");

	class Controller {
	
		public $url;
		public $addr;
		public $page;

		public function __construct() {
			$this->model = new Model();
		}

		public function output() {
			
			// Gather header data
			$url = explode("/", $_SERVER['REQUEST_URI']);
			$addr = $url[1];
		
			if (!isset($addr)) {
				$addr = "home";
			}
			
			$page = $this->model->getPage($addr);
			
			print $page;
			
		}

	}

?>