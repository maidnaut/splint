<?php
	echo "<div class='threadcontainer'>";
		echo "<span class='pagination'>";
		
		$last -= 1;
		$page -= 1;
		
		if ($page != 0) {
			$previous = $page-1;
			
			echo '<a href="'.$cfg['sitedir'].'/'.$addr.'/'.$previous.'/"><button class="btn btn-mini" type="submit">Back</button></a>';
			echo " ";
		}
		
		if ($page == 0) {
			echo "[<a href='".$cfg['sitedir']."/$addr/' style='font-weight: bold;'>0</a>] ";
		} else {
			echo "[<a href='".$cfg['sitedir']."/$addr/'>0</a>] ";
		}
		
		for ($i = 1; $i <= $last; $i++) {
			if ($page == $i) { 
				echo "[<a href='".$cfg['sitedir']."/$addr/$i/' style='font-weight: bold;'>$i</a>] ";
			} else {
				echo "[<a href='".$cfg['sitedir']."/$addr/$i/'>$i</a>] ";
			}
		}

		if ($page != $last) {
			echo " ";
			$next = $page+1;
			echo '<a href="'.$cfg['sitedir'].'/'.$addr.'/'.$next.'/"><button class="btn btn-mini" type="submit">Next</button></a>';
		}
								
		echo "</span>";
		
		echo "
			[ <a href='/$addr/catalog/'>Catalog</a> ] &nbsp;
			[ <a href='javascript:window.scrollTo(0,top);'>Top</a> ] &nbsp;
		";
		
	echo "</div>";
?>