<?php require_once("includes/connection.php");

if(isset($_POST['userId']))
{
$userId = $_POST['userId'];
$moviesToReturn = array();
$variables ="";
$data = array();

$mquery = "SELECT * FROM `user_movies` WHERE `UserID` = $userId and `wantToWatch` = 1";
$movieQuery = mysqli_query($conn, $mquery);


if(!$movieQuery){
	die("Database query failed: ".mysqli_error($conn));
}
else{
if($movieQuery || mysqli_num_rows($movieQuery) != 0){
	while($row = mysqli_fetch_array($movieQuery)){
		$variables .= $row['MovieID'];
	}
	echo var_dump($movieQuery);
	echo $variables . " helllooo?";
	}
	else{
	echo "Nothing";
}
}


// for($counter = 0; $counter < sizeof($data); $counter++){

// 	$mquery = "SELECT * from `movie` WHERE `MovieID` = '{$data[$counter]}'";
// 	$movieQuery = mysqli_query($conn, $mquery);
// 	$row = mysqli_fetch_array($movieQuery);
// 	$variables .= 'movieId='.urlencode($row['title']).'&';
	
// }
echo $variables;
}
else{
	echo "User Id is null";
}
  
  

// $count=1;

// while($row = mysql_fetch_array($result)){
// 	$variables .= 'id'.$count.'='.urlencode($row['id']).'&';
// 	$variables .= 'fname'.$count.'='.urlencode($row['fname']).'&';
// 	$variables .= 'lname'.$count.'='.urlencode($row['lname']).'&';
// 	$variables .= 'password'.$count.'='.urlencode($row['password']).'&';
// 	$variables .= 'email'.$count.'='.urlencode($row['email']).'&';
// 	$count++;	
// }	
// $variables .= 'end=1&now=1';

// echo $variables;

// if (isset($connection)){
// 		mysql_close($connection);
// }
mysqli_close($conn);
?>