<?php

    if ($url['3']) {
        $ip = $url['3'];
        $ip = explode("?ip=",$ip);
        $ip = $ip[1];
    }
    
?>


<!-- Search -->
<div class="postbody" style="margin-left: 80px; padding-top: 12px;">
	
	<div style="height: 26px; position: relative; top: 5px; padding-bottom: 4px;">
	    
	    <div style="float: right; position: relative; top: -4px;">
		<form action="/mod/search/">
	            <input placeholder="0.0.0.0" name="ip" style="text-align: right;">
	        </form>
	    </div>
	    
		<b><?=$ip?></b> <br>
		
	<?php
	
			$query = "SELECT * FROM ".$cfg['prefix']."_posts WHERE post_ip='".$ip."' ORDER BY post_id DESC";
			$result = mysql_query($query) or die(mysql_error());
			
			while($row = mysql_fetch_array($result)) {
				
				$postdata = postdata($row); ?>
				
				<div class="postbody" style="margin-top: 8px; text-align: left; width: 548px; float: left; margin-bottom: 12px;">
					<div class="postinfol">
						<a href="javascript:void(0);" id="q-<?=$postdata['post_uid']?>">#<?=$row['report_id']?></a> &nbsp;
						<?php if ($postdata['post_email'] != '') {
							echo "<a href='mailto:".$postdata['post_email']."'>".$postdata['post_author']."</a>";
						} else {
							echo $postdata['post_author'];
						} ?>
					</div>
					<div class="postinfor"><a href="#<?=$postdata['post_uid']?>"><?=fuzzyTime($postdata['post_date'])?></a></div>
					
					<?php if ($postdata['post_image'] != '') {
						echo '<div class="postimage">
							'.$postdata["post_image"].'
						</div>';
					}
					echo parseText($postdata['post_content']);
					
					echo "<br><div class='threadcontainer' style='padding: 0px; padding-top: 8px; padding-left: 12px; margin-bottom: -4px;'>";
						echo "<span style='float: right;'>".$postdata['post_ip']."</span>";
						echo $postdata['post_reports']." reports";
					echo "</div>";
					
				echo "</div>";
					
				echo "<div style='float: right; margin-top: 8px;'>
					<a href='".$cfg['sitedir']."/".$row['post_board']."/thread/".$row['post_thread']."/#".$postdata['post_uid']."' target='_blank'>View Source</a> <br>
					<a href='".$cfg['sitedir']."/mod.php?delete&board=".$postdata['post_board']."&mode=post&id=".$postdata['post_id']."'>Delete post</a> <br>
					<a href='".$cfg['sitedir'].'/mod.php?bans&ip='.$postdata['post_ip']."&id=".$postdata['post_id']."'>Ban this IP</a> <br>
				</div>";
					
			}
			
		?>
		
		
		
	</div>
	
</div>
<div class="spacer" style="clear: both;"></div>