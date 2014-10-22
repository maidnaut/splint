<div style="margin-bottom: 4px; margin-top: -12px; opacity:0.6; font-size: 7pt;">
	<br>
	<?=$threaddata['threads_replies']?> Replies, last updated <?=$threaddata['threads_bump']?> - Thread started <?=fuzzyTime($postdata['post_date'])?> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	<a href="/<?=$addr?>/thread/<?=$thread_id?>/#<?=$thread_id?>">Click here</a> to reply
</div>
<div id="'.$postdata['post_uid'].'" style="float: left; position: relative; margin: -32px;">&nbsp;</div>
<div class="postcontainer">
	<div class="postbody postop" style='float: left; background: none; border: none; box-shadow: none; -moz-box-shadow: none; -webkit-box-shadow: none;'>
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
		<div style="min-width: 1000px !important;">
			<?=parseText($postdata['post_content'])?>
		</div>
	</div>	
</div>
<br>