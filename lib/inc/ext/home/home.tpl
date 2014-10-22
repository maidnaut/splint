<div class="threadcontainer">
    <div class="frontpage">
		<div style='padding: 6px; font-weight: bold; font-size: 12pt;'>Boards</div>
		<div class="container">
			<?=fnav()?>
		</div>
		
		<div  class="threadcontainer recent" width="100%">
			<div class="clearfix">
				<div class="recent_images">
					<b>Recent Images</b> <br><br>
					<?=recent_images()?>
				</div>
				<div class="recent_posts"> <!-- limit: 9 -->
					<b>Recent Posts</b> <br><br>
					<div style="padding-left: 8px;"><?=recent_posts()?></div>
				</div>
			</div>
		</div>
	</div>
</div>
		
		
<!-- Move this into a function later -->
<div class="frontpage-news" style="background: none; border: none; box-shadow: none;">
	<?php
		$query = "SELECT * FROM bbs_news ORDER BY news_id DESC";
		$result = mysql_query($query) or die(mysql_error());
		while ($postdata = mysql_fetch_array($result)) {
			if (is_null($postdata['news_content'])) { echo "No posts to display!"; } else {
	?>
				<div class="postbody" style="padding-bottom: 4px; font-size: 10pt; font-weight: bold; margin-bottom: 8px;">
					<div class="postinfol">
						<a href="<?=$cfg['sitedir']?>/news/#<?=$postdata['news_id']?>" style="color: inherit !important;">#<?=$postdata['news_id']?></a> &nbsp;
						<?=parseText($postdata['news_title'])?>
					</div>
					<div class="postinfor" style="position: relative; top: -2px; margin-bottom: -8px;"><a href="<?=$cfg['sitedir']?>/news/#<?=$postdata['news_id']?>" style="color: inherit !important;"><?=fuzzyTime($postdata['news_date'])?></a></div>
				</div>
				<div class="postbody" style="background: none; border: none; box-shadow: none;">
					<?php
						if ($postdata['news_image'] != '') {
							echo '<div class="postimage">
								<a href="'.$cfg['sitedir'].'/src/'.$postdata["news_image"].'" target="_blank">';
									echo '<img src="'.$cfg['sitedir'].'/src/'.$postdata["news_image"].'" class="preview">';
								echo '</a>
							</div>';
						}
						echo parseText($postdata['news_content']);
					?>
					<br><br>
					<div style="float: right;">
						by <a href="mailto:<?=$cfg['support']?>"><?=$postdata['news_author']?></a>
					</div>
				</div>
	<?php
			}
		}
	?>
</div>