<div id="<?=$postdata['post_uid']?>" style="float: left; position: relative; margin: -32px;">&nbsp;</div>
<div class="postcontainer">
	<div class="postbody">
		<div style="text-align: top;">
			<div class="postinfol">
				<?=$postdata['post_author']?> &nbsp;
				<a href='/<?=$addr?>/thread/<?=$postdata['post_thread']?>/#<?=$postdata['post_uid']?>'>No.</a><a class='<?=$postdata['post_uid']?>' href="/<?=$addr?>/thread/<?=$postdata['post_thread']?>/#<?=$postdata['post_uid']?>"><?=$postdata['post_uid']?></a> &nbsp;
				<span class="posttitle"><?=$postdata['post_subject']?></span> &nbsp;&nbsp;
				
			</div>
			<div class="postinfor"><a href="<?=$cfg['sitedir']?>/<?=$addr?>/thread/<?=$postdata['post_thread']?>/#<?=$postdata['post_uid']?>"><?=fuzzyTime($postdata['post_date'])?></a></div>
			<script type="text/javascript">
				$(".<?=$postdata['post_uid']?>").click(function () {
					$("#text").append(">><?=$postdata['post_uid']?>\n");
				});
			</script>
		</div>
		<?=$postdata['post_image']?>
		<?=parseText($postdata['post_content'])?>
	</div>	
</div>
<br>