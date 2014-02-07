<?php require_once("includes/connection.php"); 

if(isset($_POST['movieid'])) 
{ 
$MovieID = $_POST['movieid'];
$hasWatched = !empty($_POST['hasWatched']) ? 1 : 0;
$wantToWatch = !empty($_POST['wantToWatch']) ? 1 : 0;

 $query = "SELECT FROM `user_movies`
			WHERE id=$id
			";   

	$result = mysql_query($query, $connection);
  
  if(!$result){
	  die("Database query failed: ".mysql_error());
  }else{
	if($wantToWatch == 1){
		$sql = "UPDATE `user_movies` SET `wantToWatch`= 0
		WHERE `UserID` = $userId and `MovieID` = $MovieID";
		$executeSql = mysqli_query($conn, $sql);
		if($executeSql){
			echo "MovieID:" . $MovieID . " now FALSE!";
		}
		else{
			echo "sql error at WANT to WATCH";
		}
	}

	if($hasWatched == 1){
		$sql = "UPDATE `user_movies` SET `hasWatched`= 0 
		WHERE `UserID` = $userId and `MovieID` = $MovieID";
		$executeSql = mysqli_query($conn, $sql);
		if($executeSql){
			echo "MovieID: " . $MovieID . " now FALSE!";
		}
		else{
			echo "sql error at HAS WATCHED";
		}
	} 
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