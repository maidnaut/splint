<div class="postcontainer" style='width: calc(100% - 24px); position: relative; left: -16px; margin-bottom: 8px;'>
	<div class="postbody" style='float: left; background: none; border: none; box-shadow: none;'>
		<div style="text-align: top;">
			<div class="postinfol">
				<?=$postdata['post_author']?> &nbsp;
				<a href='/<?=$addr?>/thread/<?=$postdata['post_thread']?>/#<?=$postdata['post_uid']?>'>No.</a><a class='<?=$postdata['post_uid']?>' href="/<?=$addr?>/thread/<?=$postdata['post_thread']?>/#<?=$postdata['post_uid']?>"><?=$postdata['post_uid']?></a> &nbsp;
				<span class="posttitle"><?=$postdata['post_subject']?></span> &nbsp;&nbsp;
				
			</div>
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