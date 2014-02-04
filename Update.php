<?php require_once("includes/connection.php"); 

$username = mysql_real_escape_string($_GET['username']);
$fname = mysql_real_escape_string($_GET['fname']);
$lname = mysql_real_escape_string($_GET['lname']);
$password = mysql_real_escape_string($_GET['password']);

$query = "UPDATE users SET username='$username',fname='$fname', lname='$lname', password='$password'  
	WHERE username=$username";
	
	$result = mysql_query($query, $connection);
	
	if($result){
		$message = "user updated";
	} else {
		$message = "error: ";
		$message .= "<br />" . mysql_error();
	}
	echo $message;
	
	if (isset($connection)){
		mysql_close($connection);
}
?>