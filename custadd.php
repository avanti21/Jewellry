<?php
include("php/custadd.php");
?>



<!DOCTYPE HTML>
<html>
	<head> 	
	<link rel="stylesheet" type="text/css" href="cssfolder/operations.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"> </script>
	<script type="text/javascript">
		 function idForm(){
  		 var selectvalue = $('input[name=choice]:checked', '#idForm').val();


		if(selectvalue == "pc"){
		window.open('custadd.php','_self');
		return true;
		}
		else if(selectvalue == "ps2"){
		window.open('custinfo.php','_self');
		return true;
		}
		return false;
		};


	</script>
	</head>

	<body>
	<div class="header">
		<img src="images/heart.jpg" width="100%" height="30%">
	</div>		
	<div class="nav">
		<center><ul><li><a href="logout.php"> Logout </a></li>
		<li><a href="custadd.php"> Home</a></li>
		</ul></center>
	</div>
	<div class="custdiv">
		<div class="radio">
		<form action="" method="post" id="idForm">
		<h4><input type="radio" onclick="idForm()"  name="choice" value="pc"/>New Customer &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="radio"  onclick="idForm()" name="choice" value="ps2"/>Existing Customer &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h4> 
		
		</form>
		</div>
		<div class="customer"><center class="formtitle"><span>A</span>dd Customer Details<center><br>
		
		<form action="" method="post">
		<table class='fitted'> 
		<tr>
			<td>Name:</td><td><input type="text" name="cname" id="cname" autocomplete="off"></td>
		</tr>
		<tr>
			<td>Contact:</td><td><input type="numeric" name="cno" id="cno" autocomplete="off"></td>
		</tr>
		<tr>
			<td>Address:</td><td><textarea rows="3" cols="22" name="caddr" id="caddr" placeholder="Enter Address"  autocomplete="off" ></textarea></td>
		</tr>
		<tr>
			<td>Govt. ID:</td><td><input type="numeric" name="gcid" id="gcid" autocomplete="off"></td>
		</tr>
		<tr>
		<td colspan="2"><center><input type="submit" name="add" id="add" value="Select Items" class="btn"></center></td>
		</tr>
		</table>		
		</form>
	</div>
	</div>
	
	</body>
</html>
