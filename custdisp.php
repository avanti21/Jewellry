
<!DOCTYPE HTML>
<html>
	<head> 	
	<link rel="stylesheet" type="text/css" href="cssfolder/operations.css">


	</head>

	<body>
		<img src="images/heart.jpg" width="100%" height="30%" class="header" style="margin-bottom: 10px; margin-left: 127px;">
	<div class="nav">
		<center><ul><li><a href="logout.php"> Logout </a></li>
		<li><a href="transactions.php"> Transaction</a></li>
		<li><a href="custdisp.php"> Customer</a></li>
		<li><a href="report.php"> Report</a></li>
		<li><a href="adminlogin.php"> Home</a></li>
		</ul></center>
	</div>
	<div class="imglog">
		<div class="emp"><center class="formtitle"><span>C</span>ustomer Details<center><br>
		
	

		<table class="fitted" style="font-size:14px; font-family: Verdana; border: 1px solid black; padding: 3px; margin-top: 15px; margin-left: auto; margin-right: auto;">

		<?php
			session_start();
if($_SESSION["user"]==true)
{
$aid=$_SESSION["user"]; //echo $aid;
}
else
{
  header('location:firstpage.php');
}
			
				$conn=mysqli_connect("localhost","root","");
				$db=mysqli_select_db($conn,"jewellery");


				$sql="SELECT * FROM customer";

				$rec=mysqli_query($conn,$sql);

			if(mysqli_num_rows($rec) > 0)
			{

				echo "<tr>";
				echo "<th>Govt. ID</th>";
				echo "<th>Name</th>";
				echo "<th>Address</th>";
				echo "<th>Contact</th>";
				echo "</tr>";

				while($stk = mysqli_fetch_array($rec))
				{

						echo "<tr>";

							echo "<td>".$stk['CGID']."</td>";

							echo "<td>".$stk['CName']."</td>";

							echo "<td>".$stk['CAddr']."</td>";

							echo "<td>".$stk['CCont']."</td>";

						echo "</tr>";
				}
			}
			else
			{
				echo "<h3>No Customer Present!!!</h3>";
			}
		

		?>
		</table>
		</div>
		</div>


	</body>
</html>