<div class="threadcontainer">
    <div class="frontpage">
		<div style='padding: 6px; font-weight: bold; font-size: 12pt;'>Boards</div>
			<div class="container">
				<?=fnav()?>
			</div>
		<?php
			if ($cfg['faq'] != '') {
				echo '<div class="threadcontainer" style="font-size: 8pt; padding: 12px; padding-top: 24px;">'.$cfg['faq'].'</div>';
			}
		?>
		<div  class="threadcontainer">
			<table width="100%" colspan="0" cellspacing="0" cellpadding="0" valign="top">
				<tr>
					<td width="50%" style="padding-right: 8px;" valign="top">
						<b>Recent Images</b> <br><br>
						<?=recent_images()?>
					</td>
					<td width="50%" valign="top"> <!-- limit: 9 -->
						<b>Recent Posts</b> <br><br>
						<?=recent_posts()?>
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>