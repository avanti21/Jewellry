<?php
include("php/empadd.php");
?>
<!DOCTYPE HTML>
<html>
	<head> 	
	<link rel="stylesheet" type="text/css" href="cssfolder/operations.css">
	

	<script src="bower_components/sweetalert/dist/sweetalert.min.js"></script>
  	<link rel="stylesheet" type="text/css" href="cssfolder/sweetalert2.css">

	</head>

	<body>
		<img src="images/heart.jpg" width="100%" height="30%" class="header" style="margin-bottom: 10px; margin-left: 127px;">
	<div class="nav">
		<center><ul><li><a href="logout.php"> Logout </a></li>
		<li><a href="emdisplay.php">Display</a></li>
		<li><a href="emdelete.php">Delete</a></li>
		<li><a href="empadd.php"> Add </a></li>
		<li><a href="adminlogin.php"> Home</a></li>
		</ul></center>
	</div>
	<div class="imglog">
		<div class="employee"><center class="formtitle"><span>A</span>dd Employee Details<center><br>
		<form action=" " method="post">
		<table class='fitted'> 
		<tr>
		<td>Name:</td><td><input type="text" name="EName" id="EName"  autocomplete="off" ></td>
		</tr>
		<tr>
			<td>Password:</td><td><input type="password" id="Pass" name="Pass"  autocomplete="off" ><p style="font-size: 12px; color: red;"><?php echo $perror; ?></p></td>
		</tr>
		<tr>
			<td>Govt.ID:</td><td><input type="text" id="GID" name="GID"  autocomplete="off" ></td>
		</tr>
		<tr>
			<td>Section:</td><td>
			<input type="text" name="section" list="section"  autocomplete="off"  >
				<datalist id="section">
    			<option value="Bangles">
   				<option value="Ring">
   				<option value="Mangalsutra">
   				<option value="Necklace">
   				<option value="Antic Jewellery">
   				 <?php 

                        $conn=mysqli_connect("localhost","root","");
                        $db=mysqli_select_db($conn,"jewellery");

                        $sql=mysqli_query($conn,"SELECT DISTINCT TOJ FROM jewel");
                        {
                            while($row = mysqli_fetch_array($sql))
                                {
                                	if($row['TOJ']=="Bangles"||$row['TOJ']=="Ring"||$row['TOJ']=="Necklace"||$row['TOJ']=="Antic Jewellery"||$row['TOJ']=="Mangalsutra")
                                	{}else
                                 	echo "<option value='".$row['TOJ']."' ></option>";
                                }
                        }
                mysqli_close($conn);
                                                                                                                                                                    
                ?>
				</datalist></td>
		</tr>
		<tr>
			<td>Shift:</td><td><input type="numeric"  name="shift" list="shift" autocomplete="off" >
			<datalist id="shift">
    			<option value="1">"First Shift"</option>
   				<option value="2">"Second Shift"</option>
   			</datalist>
		</td>
		</tr>
		<tr>	
			<td>Salary:</td><td><input type="numeric" id="salary" name="salary"  autocomplete="off" ></td>
		</tr>
		<tr>
			<td>Contact No:</td><td><input type="numeric" id="cno" name="cno"  autocomplete="off" ></td>
		</tr>
		<tr>
			<td>Address:</td><td><textarea rows="3" cols="22" name="addr" id="addr" placeholder="Enter Address"  autocomplete="off" ></textarea></td>
		</tr>
		<tr>
		<td colspan="2"><center><input type="submit" id="add" name="add" value="Add" class="btn"></center></td>
		</tr>
		</table>		
		</form>
	</div>
	</div>
	


<script
  src="https://code.jquery.com/jquery-2.2.4.js"
  integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
  crossorigin="anonymous">
</script>

<script type="text/javascript" src="js/sweetalert2.js"></script>


	</body>
</html>