<?php require_once("includes/connection.php");

if(isset($_POST['username']))
{
$username = $_POST['username'];
$password = $_POST['password'];

$sql = mysqli_query($conn,"SELECT COUNT(*) FROM `user` WHERE `username` = '$username' and `password` = '$password'");

$row = mysqli_fetch_row($sql);
if($row[0]){
	echo "success=true";
}else{
	echo "success=false";
}
}
else{
	echo "<body>";
}
?>