<?php
include("php/stockadd.php");
?>
<!DOCTYPE HTML>
<html>
	<head> 	
	<link rel="stylesheet" type="text/css" href="cssfolder/operations.css">
	</head>

	<body>
	
		<img src="images/heart.jpg" width="100%" height="30%" class="header" style="margin-bottom: 10px; margin-left: 127px;">
	<div class="nav">
		<center><ul><li><a href="logout.php"> Logout </a></li>
		<li><a href="stockdisp.php">Display</a></li>
		<li><a href="stockup.php">Update</a></li>
		<li><a href="stockadd.php"> Add </a></li>
		<li><a href="adminlogin.php"> Home</a></li>
		</ul></center>
	</div>
	<div class="imglog" >
		<div class="stock"><center class="formtitle"><span>A</span>dd Stock<center><br>
		<form action=" " method="post">
			<table>
			<tr>
				<td>Type of Jewellery :</td><td>
				<input type="text" name="TOJ" id="TOJ" list="section"  autocomplete="off"  >
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
				<td>Quantity:</td><td><input type="numeric" name="SQuantity" id="SQuantity"  autocomplete="off" /></td>
			</tr>
			
			<tr>
				<td>Gold :</td><td><input type="text" name="Gold" id="Gold" list="sec" autocomplete="off" >
				<datalist id="sec">
    			<option value="G24">
   				<option value="G22">
   				<option value="S24">
   				<option value="S22">
				</datalist>
			</td>
    			

			</tr>
			<tr>
				<td>Making Cost:</td><td><input type="numeric" name="MakeCost" id="MakeCost"  autocomplete="off" /></td>
			</tr>
			<tr>
				<td>Grams :</td><td><input type="numeric" name="Grams" id="Grams"  autocomplete="off" ></td>
			</tr>
			<tr>
				<td>SID :</td><td><input type="numeric" name="SID"  list="sid" id="SID" autocomplete="off" />
				<datalist id="sid">
                                            <?php 

                                            $conn=mysqli_connect("localhost","root","");
                                             $db=mysqli_select_db($conn,"jewellery");

                                              $sql=mysqli_query($conn,"SELECT * FROM supplier");
                                              {
                                                while($row = mysqli_fetch_array($sql))
                                                {
                                                  echo "<option value='".$row['SID']."' >'".$row['SName']."'</option>";
                                                }
                                              }
                                                mysqli_close($conn);
                                                                                                                                                                    
                                             ?>

                </datalist>
                </td>
			</tr>
			</table><br>
			<input type="submit" name="Add" value="Add" id="Add" class="btn" style="width: 25%;">
			
			</form>
			
			
		</div>
		</div>
		</body>
</html>