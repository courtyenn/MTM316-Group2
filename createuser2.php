<?php require_once("includes/connection.php");

$sql = 'INSERT INTO user '.
       '(username, fname, lname, password) '.
       'VALUES ( "thawkins", "Trevor", "Hawkins", "12345")';

if(!mysqli_query($conn, $sql)){
	die('Error: ' . mysqli_error($conn));
}
echo "Entered data successfully\n";
mysqli_close($conn);
?>