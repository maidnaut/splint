<?php
	echo '<div class="postoptions" style="position: relative; left: -12px;">';
	if (($postdata['post_reports'] < $cfg['rcap']) && ($postdata['post_isexempt'] == 0) && (!$auth)) {
		echo '
			<form action="/report.php" method="post">
				<input type="image" src="/lib/media/ico/flag.png" alt="!" title="Report!">
				<input type="hidden" name="board" value="'.$postdata['post_board'].'">
				<input type="hidden" name="thread" value="'.$postdata['post_thread'].'">
				<input type="hidden" name="post" value="'.$postdata['post_id'].'">
			</form>
		';
	}
	
	if ($auth == true) {
		echo '
			<a href="'.$cfg['sitedir'].'/mod.php?delete&board='.$postdata['post_board'].'&mode=post&id='.$postdata['post_id'].'"><img src="'.$cfg['sitedir'].'/lib/media/ico/delete.png" title="Delete this post"></a> <br>
			<a href="'.$cfg['sitedir'].'/mod.php?bans&ip='.$postdata['post_ip'].'&id='.$postdata['post_id'].'"><img src="'.$cfg['sitedir'].'/lib/media/ico/ban.png" title="Ban this IP ('.$postdata["post_ip"].')"></a><br>
		';
		if (($postdata['post_reports'] >= $cfg['rcap']) && ($postdata['post_isexempt'] == 0)) {
			echo '<a href="'.$cfg['sitedir'].'/mod.php?unflag&board='.$postdata['post_board'].'&mode=thread&id='.$postdata['post_id'].'"><img src="'.$cfg['sitedir'].'/lib/media/ico/flag.png" style="width: auto; height: 16px;" title="Unflag this comment"></a>';
		}
	}
	echo '</div>';
?>