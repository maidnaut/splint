<!-- Boards -->
<div class="postbody" style="margin-left: 80px; padding-top: 12px;">
	
	<div style="float: left; width: 25%; height: 26px; position: relative; top: 5px;">
		<b>Boards</b>
	</div>
	<div style="float: right; width: 75%; position: relative; top: 8px;">
		<a href="javascript:void(0);" id="new_b" class="more">+ New Board</a>
		<div style="padding-top: 4px;" id="new_b" class="hidden">
			<form action="<?=$cfg['sitedir']?>/mod.php" method="post" enctype="multipart/form-data">
				<input type='text' style='width: 50px' placeholder='/addr/' name='b_addr'> &nbsp;
				<input type='text' style='width: 175px' placeholder='Board Name' name='b_name'> &nbsp;
				<select style="height: 24px; margin-bottom: 0px; width: 125px;" name="move_cat">
				<?php
					foreach($list_cats as $cats) {
						if ($cats == $cat['cat_name']) {
							$default = "selected";
						} else {
							$default = "";
						}
						echo '<option value="'.$cats.'" class="dropdown" '.$default.'>'.$cats.'</option>';
					}
				?>
				</select> &nbsp;

				<input type="hidden" name="edit_boards">
				
				<button type='submit' class='btn btn-mini' value='Create'>Create</button>
			</form>
		</div>
		<script type="text/javascript">
			$("#new_b.more").click(function() {
				$("#new_b.hidden").slideToggle(350);
			});
		</script>
	</div>
	
	<div class="spacer" style="clear: both;"><br></div>
	
	<div style="float: left; width: 25%; height: 26px; position: relative; top: 5px;">
		^v &nbsp;&nbsp;&nbsp; <b>Splint</b>
	</div>
	
	<div style="float: right; width: 75%;">
		^v &nbsp;&nbsp;&nbsp;
		/a/ &nbsp;&nbsp;&nbsp;
		<input type="text" value="Animal Crackers"> &nbsp;&nbsp;&nbsp;
		[<a>Delete</a>/<a>Retire</a>] <br>
		
		^v &nbsp;&nbsp;&nbsp;
		/b/ &nbsp;&nbsp;&nbsp;
		<input type="text" value="Banana">
		&nbsp;&nbsp;&nbsp; [<a>Delete</a>/<a>Retire</a>] <br>
	</div>
	
	<div class="spacer" style="clear: both;"><br></div>
	
	<div style="float: left; width: 25%; height: 26px; position: relative; top: 6px;">&nbsp;</div>
	<div style="float: right; width: 75%;">
		<input type='hidden' name='update'>
		<button type='submit' class='btn btn-mini'>Update!</button> &nbsp;&nbsp;&nbsp;&nbsp;
	</div>
	
</div>
<div class="spacer" style="clear: both;"></div>