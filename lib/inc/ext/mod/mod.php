<?php
	
	$url = explode("/", $_SERVER['REQUEST_URI']);
	$addr = $url[2];
	
	if ($addr == 'logout') {
		setcookie("splint_auth", $username."-".$password, time()-(10*365*24*60*60), '/');
		redirect("/mod/");
	}
	
	##############
	
	if ($auth == 0) {
		include("lib/inc/ext/mod/login.tpl");
	} else {
	
		echo '<div class="threadcontainer">
			<div class="frontpage" style="padding-top: 12px; background: none; border: none; box-shadow: none;">';
	
		include ("lib/inc/ext/mod/sidebar.tpl");
	
		if ($addr == '') {
			include("lib/inc/ext/mod/dashboard.tpl");
		} else if ($addr == 'boards') {
			include("lib/inc/ext/mod/boards.tpl");
		} else if ($addr == 'news') {
			include("lib/inc/ext/mod/news.tpl");
		} else if ($addr == 'discussion') {
			include("lib/inc/ext/mod/discussion.tpl");
		} else if ($addr == 'reports') {
			include("lib/inc/ext/mod/reports.tpl");
		} else if ($addr == 'bans') {
			include("lib/inc/ext/mod/bans.tpl");
		} else if ($addr == 'modlog') {
			include("lib/inc/ext/mod/modlog.tpl");
		} else if ($addr == 'users') {
			include("lib/inc/ext/mod/users.tpl");
		} else if ($addr == 'banners') {
			include("lib/inc/ext/mod/banners.tpl");
		} else if ($addr == 'search') {
			include("lib/inc/ext/mod/search.tpl");
		}
		
		echo '</div>
			</div>
		</div> <br>';
	
	
		if (isset($_POST['ban'])) {
		
			ban($_POST['ip'],$_POST['reason']);
			
		} else if (isset($_GET['unban'])) {
		
			unban($_GET['unban']);
			
		} else if (isset($_POST['edit_staff'])) {
		
			edit_user();
		
		} else if (isset($_POST['new_user'])) {
		
			edit_user();
			
		} else if (isset($_POST['update'])) {
			
			update_cfg();
		
		} else if (isset($_POST['disc'])) {
			
			disc();

		} else if (isset($_POST['post'])) {
		
			news();

		} else if (isset($_GET['unflag'])) {
		
			unflag();
			
		}
		if (isset($_GET['lock'])) {
			
			lock();
	
		} else if (isset($_GET['stick'])) {
			
			sticky();
	
		} else if (isset($_GET['delete'])) {
			
			if (!isset($_GET['confirmed'])) { ?>
			
				<script type="text/javascript">
					var r=confirm("Delete this <?=$_GET['mode']?>?");
					if (r==true) {
						x="Deleting <?=$_GET['mode']?>";
						window.location.replace('mod.php?delete&board=<?=$_GET['board']?>&mode=<?=$_GET['mode']?>&id=<?=$_GET['id']?>&confirmed');
					} else {
						x="Not deleting <?=$_GET['mode']?>";
						window.history.go(-1);
					}
				</script>

				
<?php
			} else {
			
				delete();
				
			}
		} else if (isset($_POST['edit_boards'])) {
		
			if ((isset($_POST['update'])) || (isset($_POST['rename_board']))) {
			
				edit_board();
				
			} else if (isset($_POST['retire'])) {
			
				retire_board();
				
			} else {
			
				new_board();
				
			}
		
		}
	}
?>