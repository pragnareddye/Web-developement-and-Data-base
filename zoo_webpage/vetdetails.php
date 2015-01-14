<html>
<body>
<a href="mng_links.html" >back</a>
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
 
$result1=mysqli_query($con,"select dept_no from employee where pw='$la' and emp_fname='$fi';");
if (!$result1) {
    echo "not valid result";
}

 $row= mysqli_fetch_array($result1);



$hi=$row['dept_no'];

  $result = mysqli_query($con,"select avrt.vet_id, vet.vet_name,vet.v_pno,v_address,avrt.treatment_type,avrt.date,animal.ani_id,animal.ani_name from avrt,animal,vet where animal.ani_id=avrt.a_id and vet.vet_id=avrt.vet_id and dno ='$hi';");
  if (!$result) {
    echo "not valid result";
}

echo"<center>";echo "<br>";
  echo "<h1>Treatment information</h1>";echo "<br>";echo "<br>";

  echo "<table border='0' cellpadding='10'  CELLSPACING='0'  bgcolor='#99FF66'>";
while($row = mysqli_fetch_array($result))
  {
  echo "<tr>";
 
   echo "<td><b>Treated by:</b>". $row['vet_name'] ."<td>";
  echo "<td><b>Phone:</b>" . $row['v_pno']."<td>"; 
    echo "<td><b>Address</b>" . $row['v_address']."<td>"; 
	 
		echo "<td><b>Treated on:</b>" . $row['ani_name']."<td>"; 
	echo "<td><b>Treatment_type:</b>" . $row['treatment_type']."<td>"; 
	echo "<td><b>Date</b>" . $row['date']."<td>"; 
	

  echo "</tr>";
  }
  echo "</table>";
  ?>
  