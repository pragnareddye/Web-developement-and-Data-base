<?php
$con=mysqli_connect("localhost","pragnae","","zoo_database");

// Check connection
if (mysqli_connect_errno())
  {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
  }

if (isset($_POST['email']))    
{    
          // Instructions if $_POST['value'] exist    
   

 $fi =$_POST['gname']; 
$la =($_POST['email']);

$phe=$_POST['phone_number'];
$da=$_POST['no_ppl'];
$di=$_POST['visit'];





if(!mysqli_query($con,"insert into visit(g_name,phe_no,no_ppl,email,date_v) values('$fi','$phe','$da','$la','$di');"))

{die('Error: ' . mysqli_error($con));
}

echo "<h1>Resgistration sucesfull!</h1>" ;
}
else
{
die('Errorl: ' . mysqli_error($con));
}
?>

