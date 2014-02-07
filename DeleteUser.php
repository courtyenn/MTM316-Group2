<?php require_once("includes/connection.php"); 

if(isset($_GET['id'])) 
{ 
$id = mysqli_real_escape_string($conn, $_GET['id']);

 //$id = $conn->real_escape_string($_GET['id']);

 $query = "DELETE FROM `user` WHERE `ID`=$id LIMIT 1";   

	$result = mysqli_query($conn, $query);
  
  if(!$result){
	  die("Database query failed: ".mysqli_error($conn));
  }else{
	echo "Record deleted.";  
  }
  
  if (isset($conn)){
		mysqli_close($conn);
}
} 
else 
{ 
	echo "User not found! WHich is crazy...";
}
  
?>