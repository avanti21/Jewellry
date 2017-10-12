<?php
include("php/supadd.php");
?>

<!DOCTYPE HTML>
<html>
	<head> 	
	<link rel="stylesheet" type="text/css" href="cssfolder/operations.css">
	<script src="bower_components/sweetalert/dist/sweetalert.min.js"></script>
  	<link rel="stylesheet" type="text/css" href="cssfolder/sweetalert2.css">
	</head>

	<body>
	<div class="header">
		<img src="images/heart.jpg" width="100%" height="30%">
	</div>		
	<div class="nav">
		<center><ul><li><a href="logout.php"> Logout </a></li>
		<li><a href="supdisp.php">Display</a></li>
		<li><a href="supdel.php">Delete</a></li>
		<li><a href="supadd.php"> Add </a></li>
		<li><a href="adminlogin.php"> Home</a></li>
		</ul></center>
	</div>
	<div class="custdiv">
		<div class="supp"><center class="formtitle"><span>A</span>dd Supplier Details<center><br>
		<form action="" method="post">
		<table class='fitted'> 
		
		<tr>
			<td>Name:</td><td><input type="text" name="SName" autocomplete="off" ></td>
		</tr>
		<tr>	
			<td>Company Name:</td><td><input type="text" name="cname" autocomplete="off" ></td>
		</tr>
		<tr>	
			<td>Company Code:</td><td><input type="text" name="code" autocomplete="off" ></td>
		</tr>
		<tr>
			<td>Contact No:</td><td><input type="text" name="cno" autocomplete="off" ></td>
		</tr>
		<tr>
			<td>Address:</td><td><textarea rows="3" cols="22" name="addr" autocomplete="off" placeholder="Enter Address"></textarea></td>
		</tr>
		<tr>
		<td colspan="2"><center><input type="submit" name="add" value="Add" class="btn"></center></td>
		</tr>
		</table>		
		</form>
	</div>
	</div>
	
	</body>
</html>

<script
  src="https://code.jquery.com/jquery-2.2.4.js"
  integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
  crossorigin="anonymous">
</script>

<script type="text/javascript" src="js/sweetalert2.js"></script>


	</body>
</html>