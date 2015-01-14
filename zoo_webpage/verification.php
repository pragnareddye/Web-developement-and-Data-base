<html>
<body>

<?php
session_start(); 
// Create connection
$con=mysqli_connect("localhost","pragnae","","zoo_database");

// Check connection
if(!$con)
{
echo "fucked";
die('Could not connect: ' . mysql_error());
}
if (mysqli_connect_errno())
  {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
  }
  if(!IsSet($g))
{$g=($_POST['firstname']);
$h=($_POST['lastname']);
} 
$_SESSION['firstn']=$g;
$_SESSION['lastn']=$h; 
$re=mysqli_query($con,"SELECT pw FROM employee where emp_fname='$g' ;");
$des=mysqli_query($con,"SELECT desg FROM employee where emp_fname='$g' ;");
while($row1 = mysqli_fetch_array($re))
  {
  $res= $row1['pw']  ;
  echo "<br>";
  }
  while($row2 = mysqli_fetch_array($des))
  {
  $desg= $row2['desg']  ;
  echo "<br>";
  }
  
if($h!= $res)
  {
    die('invalid username or password ' . mysqli_error($con));
	}
	else if ($desg=='manager')
	{
	echo "<a href='mng_links.html'> proceed</a>" ;
	}
	else if ($desg=='worker')
	{
	echo "<a href='emp_login.php'> proceed</a>" ;
	}
	?>
	</body>
	</html>
	