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
	
	 <script>
		$(function() {
			$( "#sortable" ).sortable({ handle: ".handle" });
		});
	</script>
	
	<hr><br>
	
	<form action="<?=$cfg['sitedir']?>/mod.php" method="post" enctype="multipart/form-data" id="boards">
	
		<div><b>Splint</b></div> <br>
		
		<div class="ui-splitselect ui-helper-clearfix ui-widget ui-widget-content">
		    <div class="ui-widget-content list-available" style="width: 100%;">
		        <ul id="sortable" class="list available" style=" ">
		        	
		            <li class="ui-state-default ui-state-focus" style="display: list-item; height: 32px; padding-left: 6px; padding-right: 8px;">
		            	<div style="position: relative; top: 6px; width: 100%;">
	    					<span class="handle ui-icon ui-icon-arrow-4" style="float: left; width: 16px; position: relative; top: 2px;"></span> &nbsp;
		            		/s/ &nbsp;
		            		
		            		<input value="Splint" name="name[]"> &nbsp;
		            		
		            		<input value="" style="width: 364px;" name="subtitle[]">
		            		
		            		&nbsp;&nbsp;&nbsp;
		            		
		            		<a href="javascript:void(0);" title="Delete"class="ui-icon ui-icon-trash" style="float: right;"></a>
		            		<a href="javascript:void(0);" title="Retire"class="ui-icon ui-icon-clock" style="float: right;"></a>
		            		
		            		
		            	</div>
		            </li>
		        	
		            <li class="ui-state-default ui-state-focus" style="display: list-item; height: 32px; padding-left: 6px; padding-right: 8px;">
		            	<div style="position: relative; top: 6px; width: 100%;">
	    					<span class="handle ui-icon ui-icon-arrow-4" style="float: left; width: 16px; position: relative; top: 2px;"></span> &nbsp;
		            		/a/ &nbsp;
		            		
		            		<input value="The Alphabet" name="name[]"> &nbsp;
		            		
		            		<input value="abcdefghijklmnopqrstuvwxyz" style="width: 364px;" name="subtitle[]">
		            		
		            		&nbsp;&nbsp;&nbsp;
		            		
		            		<a href="javascript:void(0);" title="Delete"class="ui-icon ui-icon-trash" style="float: right;"></a>
		            		<a href="javascript:void(0);" title="Retire"class="ui-icon ui-icon-clock" style="float: right;"></a>
		            		
		            		
		            	</div>
		            </li>
		            
		        </ul>
		    </div>
	    </div>
	
		<div class="spacer" style="clear: both;"><br></div>
		
		<div>
		<input type='hidden' name='boards' value="boards">
			<button type='submit' class='btn btn-mini' id="submit">Update!</button> &nbsp;&nbsp;&nbsp;&nbsp;
		</div>
	    
	</form>
	
</div>
<div class="spacer" style="clear: both;"></div>