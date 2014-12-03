<!-- News -->
<div class="postbody" style="margin-left: 80px; padding-top: 12px;">
	
	<div style="float: left; width: 25%; height: 26px; position: relative; top: 5px;">
		<b>News</b>
	</div>
	
	<div class="spacer" style="clear: both;"><br></div>
	
	<div class="reply">
		Posting new <b>update</b> <br><br>
		
		<form action="<?=$cfg['sitedir']?>/mod.php" method="post" enctype="multipart/form-data">
		<table class="tablebg" width="500px" cellspacing="1" style="display: block; margin-left: 20px; margin-right: auto; text-align: left;">
			<tr> 
				<td class="row1" width="35%" style="padding-bottom: 10px; vertical-align: top;">
					<b>Name</b>
				</td>
				<td class="row2">
					<input type='text' style="width: 300px" name="name" value="<?=$user?>" disabled> <br><br>
				</td>
			</tr>
			<tr> 
				<td class="row1" width="35%" style="padding-bottom: 10px; vertical-align: top;">
					<b>Title</b>
				</td>
				<td class="row2">
					<input type='text' style="width: 300px" name="title"> <br><br>
				</td>
			</tr>
			<tr> 
				<td class="row1" width="35%" style="padding-bottom: 10px; vertical-align: top;">
					<b>Comment</b>
				</td>
				<td class="row2">
					<textarea style="width: 300px" name="text" id="text"><?=$backup?></textarea> <br><br>
				</td>
			</tr>
			<tr> 
				<td class="row1" width="35%" style="padding-bottom: 10px; vertical-align: top;">
					<b>File</b>
				</td>
				<td class="row2">
					<input type="file" accept="image/gif" name="file" style="width: 80%"> <br><br>
				</td>
			</tr>
			<tr> 
				<td class="row1" width="35%">
				</td>
				<td class="row2">
					<input type="hidden" name="post">
					<button type='submit' name='submit' class='btn btn-mini'>Submit</button>
				</td>
			</tr>
		</table>
		</form>
	</div>
	
	<div class="spacer" style="clear: both;"></div>
</div>