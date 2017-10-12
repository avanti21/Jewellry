
<!DOCTYPE HTML>
<html>
	<head> 	
	<link rel="stylesheet" type="text/css" href="cssfolder/operations.css">


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
		<div class="emp"><center class="formtitle"><span>E</span>mployee Details<center><br>
		
	

		<table class="fitted" style="font-size:14px; font-family: Verdana; border: 1px solid black; padding: 3px; margin-top: 15px; margin-left: auto; margin-right: auto;">

		<?php

			
				$conn=mysqli_connect("localhost","root","");
				$db=mysqli_select_db($conn,"jewellery");


				$sql="SELECT * FROM employee";

				$rec=mysqli_query($conn,$sql);

			if(mysqli_num_rows($rec) > 0)
			{

				echo "<tr>";
				echo "<th>EID</th>";
				echo "<th>Name</th>";
				echo "<th>Address</th>";
				echo "<th>Contact</th>";
				echo "<th>Section</th>";
				echo "<th>Shift</th>";
				echo "<th>Govt. ID</th>";
				echo "<th>Salary</th>";
				echo "</tr>";

				while($stk = mysqli_fetch_array($rec))
				{

						echo "<tr>";

							echo "<td>".$stk['EID']."</td>";

							echo "<td>".$stk['EName']."</td>";

							echo "<td>".$stk['EAddr']."</td>";

							echo "<td>".$stk['ECont']."</td>";

							echo "<td>".$stk['Section']."</td>";

							echo "<td>".$stk['Shift']."</td>";

							echo "<td>".$stk['EGID']."</td>";

							echo "<td>".$stk['Salary']."</td>";

						echo "</tr>";
				}
			}
			else
			{
				echo "<h3>No Employee Present!!!</h3>";
			}
		

		?>
		</table>
		</div>
		</div>


	</body>
</html>