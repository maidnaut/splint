<div class='threadcontainer' style='margin-bottom: 8px;'>
	<a href='/<?=$url[1]?>/'><< Return</a>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	[ <a href='javascript:window.scrollTo(0,document.body.scrollHeight);'>Bottom</a> ] &nbsp;
	[ <a href='javascript:location.reload();'>Update</a> ]
</div>

<div class="threadcontainer">
	<div class="clearfix">
		<div class="recent_images" style="width: 100%; text-align: center;">
			<div style="width: 80%; display: inline-block;">
				<?php foreach ($catalog as $catalog) { ?>
					<div style="min-width: 150px; height: 178px; display: inline-block; padding-left: 16px; padding-right: 16px; vertical-align: top; margin-bottom: 12px;">
						<div class="postimage" style="width: auto; margin: 0; float: none; box-shadow: none; padding: 0px;">
							<a href="/<?=$catalog['thread']?>">
								<img src="/src/<?=$catalog['images']?>" style="max-width: 150px; max-height: 150px; width: auto; height: auto;">
							</a>
							<br>
							<div style="width: 150px; display: inline-block; margin-top: 4px;">
								<span style="font-size: 11px; opacity: 0.7;"><?=$catalog['replies']?> replies</span> <br>
								<span style="font-weight: bold;" class="posttitle"><?=$catalog['subject']?></span> <?=parseText($catalog['content'])?>
							</div>
						</div>
					</div>
				<?php } ?>
			</div>
		</div>
	</div>
</div>

<div class='threadcontainer' style='margin-bottom: 8px;'>
	<a href='/<?=$url[1]?>/'><< Return</a>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	[ <a href='javascript:window.scrollTo(0,top);'>Top</a> ] &nbsp;
	[ <a href='javascript:location.reload();'>Update</a> ]
</div>