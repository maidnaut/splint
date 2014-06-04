<?php
	if ($_COOKIE['splint_backuppost'] != '') {
		$backup = $_COOKIE['splint_backuppost'];
		setcookie("splint_backuppost", $content, time()-100);
	}
?>
<div class="threadcontainer">
	<div class="reply" id="reply">
		<?php
			$url = explode("/", $_SERVER['REQUEST_URI']);
			if ($url[2] == "thread") {
				echo "<div style='text-align: center; margin-bottom: 16px;'>Posting new <b>reply</b></div>";
			}
		?>
		<form action="<?=$cfg['sitedir']?>/post.php" method="post" enctype="multipart/form-data">
			<table class="tablebg" width="500px" cellspacing="1" style="display: block; margin-left: 40px; margin-right: auto;">
				<tr> 
					<td class="row1" width="25%" style="padding-bottom: 10px; vertical-align: top;">
						<b>Name</b>
					</td>
					<td class="row2">
						<input type="text" style="width: 300px" name="name" value="<?=$_COOKIE['splint_remember-me']?>"<?php if (($mode != "board") && ($threaddata['threads_locked'] == 1)) { echo " disabled"; } ?>> <br><br>
					</td>
				</tr>
				<tr> 
					<td class="row1" style="padding-bottom: 10px; vertical-align: top;">
						<b>Email</b>
					</td>
					<td class="row2">
						<input type="text" style="width: 300px" name="email"<?php if (($mode != "board") && ($threaddata['threads_locked'] == 1)) { echo " disabled"; } ?>> <br><br>
					</td>
				</tr>
				<tr> 
					<td class="row1" style="padding-bottom: 10px; vertical-align: top;">
						<b>Subject</b>
					</td>
					<td class="row2">
						<input type="text" style="width: 300px" name="subject"<?php if (($mode != "board") && ($threaddata['threads_locked'] == 1)) { echo " disabled"; } ?>> <br><br>
					</td>
				</tr>
				<tr> 
					<td class="row1" style="padding-bottom: 10px; vertical-align: top;">
						<b>Comment</b>
					</td>
					<td class="row2">
						<textarea style="width: 300px" name="text" id="text"<?php if (($mode != "board") && ($threaddata['threads_locked'] == 1)) { echo " disabled"; } ?>><?=$backup?></textarea> <br><br>
					</td>
				</tr>
				<tr> 
					<td class="row1" style="padding-bottom: 10px; vertical-align: top;">
						<b>File</b>
					</td>
					<td class="row2">
						<input type="text" type="input" name="url" placeholder="Upload from url" style="width: 279px"<?php if (($mode != "board") && ($threaddata['threads_locked'] == 1)) { echo " disabled"; } ?>>
						<input type="checkbox" name="spoiler" value="1" title="Spoiler image?" style="position: relative; top: -2px;"<?php if (($mode != "board") && ($threaddata['threads_locked'] == 1)) { echo " disabled"; } ?>>
					</td>
				</tr>
				<tr> 
					<td class="row1" style="padding-bottom: 10px; vertical-align: top;">
						&nbsp;
					</td>
					<td class="row2">
						<br>
						<input type="file" accept="image" name="file" style="width: 80%"<?php if (($mode != "board") && ($threaddata['threads_locked'] == 1)) { echo " disabled"; } ?>> <br><br>
					</td>
				</tr>
				<tr> 
					<td class="row1">
					</td>
					<td class="row2">
						<button type="submit" name="submit" value="Submit" class="btn btn-mini"<?php if (($mode != "board") && ($threaddata['threads_locked'] == 1)) { echo " disabled"; } ?>>Submit</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>