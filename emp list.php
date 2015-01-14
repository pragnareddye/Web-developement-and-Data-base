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
 



  
$result=mysqli_query($con,"select dept_no from employee where pw='$la' and emp_fname='$fi';");
if (!$result) {
    echo "not valid result";
}

 $row= mysqli_fetch_array($result);
 if (!$result) {
    echo "not valid result";
}


$hi=$row['dept_no'];
  $result = mysqli_query($con,"select * from employee where dept_no ='$hi';");
  echo"<center>";echo "<br>";
  echo "<h1>Employee Details In Your Department are</h1>";echo "<br>";echo "<br>";

  echo "<table border='0' cellpadding='10'  CELLSPACING='0'  bgcolor='#99FF66'>";
 
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
  