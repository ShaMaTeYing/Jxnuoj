<?php
	function encode(){
		return 1;
	}
	function viewAdd($a,$b){
		echo(intval($a)+intval($b)); 
	}
	function getRatio($a,$b){
		if($b==0) echo(0);
		else {
		
			echo(sprintf("%.2f", doubleval($a)/doubleval($b)*100));
		}
	}
?>
