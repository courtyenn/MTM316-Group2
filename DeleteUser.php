<?php require_once("includes/connection.php"); 

if(isset($_GET['id'])) 
{ 
 $password = mysql_real_escape_string($_GET['password']);

 $query = "DELETE FROM user
			WHERE id=$id
			LIMIT 1
			";   

	$result = mysql_query($query, $connection);
  
  if(!$result){
	  die("Database query failed: ".mysql_error());
  }else{
	echo "Record deleted.";  
  }
  
  if (isset($connection)){
		mysql_close($connection);
}
} 
else 
{ 
	echo "User not found! WHich is crazy...";
}

  

  
?>