<?php require_once("includes/connection.php");

if(isset($_POST['username']))
{
$username = $_POST['username'];
$password = $_POST['password'];

$sql = mysqli_query($conn,"SELECT * FROM `user` WHERE `username` = '$username' and `password` = '$password' LIMIT 1");
$check = mysqli_fetch_array($sql);
if(!is_null($check)){
	echo "success=true&userId=".$check['ID'];
}else{
	echo "success=false&userId=".$check;
}
}
else{
	echo "<body>";
}
?>