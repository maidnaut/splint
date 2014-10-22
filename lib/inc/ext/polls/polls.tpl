<div class="threadcontainer">
    <div class="frontpage" style="padding-top: 16px;">
	
		<div class="container">
			<div style='padding: 6px; font-weight: bold; font-size: 12pt;'>Create a poll</div>
			<div class="container">
			
				<div class="span10 polls">
					<input type="text" style="width: calc(100% - 12px);" placeholder="What should we add to splint?">
				</div>
				<div class="span10">
					<select style="height: 24px; margin-bottom: 0px;">
						<option value="" class="dropdown">Which board?</option>
						<?php foreach ($poll_boards as $board) { ?>
							<option value="<?=$board[1]?>" class="dropdown"><?=$board[2]?></option>
						<?php } ?>
					</select> 
					<button class="btn btn-mini">Submit</button>
				</div>
			</div>
		</div>
	
	
	
		<div class="threadcontainer">
			<div style='padding: 6px; font-weight: bold; font-size: 12pt;'>Active Polls</div>
			
			<div class="container" style="position: relative; left: -8px;">
			
				<div class="polls" style="float: left; width: 50%">
					Title
				</div>
				<div class="polls" style="float: left; width: 15%;">
					Board
				</div>
				<div class="polls" style="float: left; width: 25%;">
					Date
				</div>
				<div class="spacer" style="clear: both;"><br></div>
		
				<div class="container" style="margin-bottom: 6px; margin-left: 12px;">
					<div style="float: left; width: 53%">
						Lorem ipsum dolor sit amet, consectetur adipiscing elit. <br>
						5 Votes &nbsp;
						<progress id="progressbar" value="45" max="100"></progress> <br><br>
						<button class="btn btn-mini">yes</button>
						<button class="btn btn-mini">no</button>
						<br><br>
					</div>
					<div style="float: left; width: 18%;">
						/s/
					</div>
					<div style="float: left; width: 20%;">
						5 minutes ago
					</div>
				</div>
				<div class="spacer" style="clear: both;"><br></div>
		
				<div class="container" style="margin-bottom: 6px; margin-left: 12px;">
					<div style="float: left; width: 53%">
						Lorem ipsum dolor sit amet, consectetur adipiscing elit. <br>
						2 Votes &nbsp;
						<progress id="progressbar" value="20" max="100"></progress> <br><br>
						<button class="btn btn-mini">yes</button>
						<button class="btn btn-mini">no</button>
						<br><br>
					</div>
					<div style="float: left; width: 18%;">
						/s/
					</div>
					<div style="float: left; width: 20%;">
						5 minutes ago
					</div>
				</div>
				<div class="spacer" style="clear: both;"><br></div>
					
			</div>
		</div>
		
	</div>
</div>