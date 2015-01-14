<html>
<br/><br/>
<center><h1>Welcome! U Logged In As a Worker</h1>
<?php 
session_start(); 
// Create connection
$con=mysqli_connect("localhost","pragnae","","zoo_database");

// Check connection
if (mysqli_connect_errno())
  {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
  }
  
 global $fi,$la;
  $fi =($_SESSION['firstn']);
  $la =($_SESSION['lastn']);
 echo "<br/>";
$result=mysqli_query($con,"SELECT * FROM employee where emp_fname='$fi' ;");
  echo "<br>";echo "<br>";echo "<br>";echo "<table border='0' cellpadding='10'  CELLSPACING='0'  bgcolor='#99FF66'>";
 
  while($row = mysqli_fetch_array($result))
  {  echo "<tr>";
   echo "<td><b>Id:</b>" . $row['emp_id'] . "<td>";
  echo "<td><b>Name:</b>" . $row['emp_fname'] . "<td>";
  echo "<td><b>Sex:</b>". $row['sex']."<td>";
echo "<td><b>DOB:</b>" . $row['dob'] ."<td>";
 echo "<td><b>address:</b>" . $row['address'] . "<td>";
  echo "<td><b>salary:</b>" . $row['salary'] . "<td>";

  echo "</tr>";
 
  }
  echo "</table>";
  echo"</center>"; ?>
  </body>
  </html>