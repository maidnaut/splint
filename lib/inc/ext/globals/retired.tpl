<div class="threadcontainer">
	<div style="margin-left:auto; margin-right:auto; width:800px; text-align: center;">
		<?php
		
			$query = "SELECT * FROM bbs_boards WHERE board_addr='$addr'";
			$result = mysql_query($query) or die(mysql_error());
			$board = mysql_fetch_array($result);
		
		?>
		<img src="http://i.imgur.com/MiJztRz.jpg"> <br><br>
		
		/<?=$addr?>/ was retired <?=fuzzyTime($board['board_rdate'])?> with a total of <?=$board['board_posts']?> posts <br><br>
		
		thankfully, nothing of value was lost <br><br>
		
		<a href="javascript:history.go-back(-1);">Click here to go return to back to where ever it was you came from</a>
		
	</div>
</div>