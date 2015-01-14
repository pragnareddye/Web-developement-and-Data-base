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
 



  
$result=mysqli_query($con,"select dept_no from employee where pw='$la' and emp_fname='$fi';");
if (!$result) {
    echo "not valid result";
}

 $row= mysqli_fetch_array($result);
 if (!$result) {
    echo "not valid result";
}


$hi=$row['dept_no'];
  $result = mysqli_query($con,"select * from animal where dno ='$hi';");
  if (!$result) {
    echo "not valid result";
}

  echo "<br>";
    echo"<center>";echo "<br>";
  echo "<h1>Animal Details In Your Department are</h1>";echo "<br>";echo "<br>";

  echo "<table border='0' cellpadding='10'  CELLSPACING='0'  bgcolor='#99FF66'>";
 
  while($row = mysqli_fetch_array($result))
  {  echo "<tr>";
  echo "<td><b>name:</b>" . $row['ani_name'] . "<td>";
  echo "<td><b>Scientific name:</b>". $row['sci_name']."<td>";
echo "<td><b>DOB:</b>" . $row['ani_dob'] ."<td>";

  echo "</tr>";
 
  }
  echo "</table>";
  echo"</center>"; ?>