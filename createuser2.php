<?php require_once("includes/connection.php");


if(isset($_POST['username']))
{
	$username = $_POST['username'];
	$password = $_POST['password'];
	$fname = $_POST['fname'];
	$lname = $_POST['lname'];

	$query =  "SELECT * FROM `user` WHERE `username` = '$username'";
	$checkquery = mysqli_query($conn,$query);
	if(!$checkquery || mysqli_num_rows($checkquery) == 0){
		$sql = "INSERT INTO user(username, fname, lname, password)
		VALUES ( 
			'{$username}', '{$fname}', '{$lname}', '{$password}'
			)";

		$check = mysqli_query($conn, $sql);
		if($check){
		echo $username . " , " . $password . " : " . $fname . " : " . $lname;
		}
		else{
		echo "connection error";
		}
	}
	else{
		echo "Username already exists." . mysqli_num_rows($checkquery);
	}
}
else{
	echo "username is null";
}
mysqli_close($conn);
?>