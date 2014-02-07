<?php require_once("includes/connection.php");


if(isset($_POST['movieId']))
{
	$movieId = $_POST['movieId'];
	$userId = $_POST['userId'];
	$note = !empty($_POST['note']) ? "'$note'" : "NULL";
	$rating = !empty($_POST['rating']) ? "'$rating'" : "NULL";
	$isFavorite = !empty($_POST['isFavorite']) ? 1 : 0;
	$hasWatched = !empty($_POST['hasWatched']) ? 1 : 0;
	$wantToWatch = !empty($_POST['wantToWatch']) ? 1 : 0;

	$query =  "SELECT * FROM `movie` WHERE `movieId` = '$movieId'";
	$checkquery = mysqli_query($conn,$query);
	$check = mysqli_fetch_assoc($checkquery);
	$MovieID = $check['ID'];

$mquery = "SELECT * FROM `user_movies` WHERE `MovieID` = $MovieID and `UserID` = $userId";
$movieQuery = mysqli_query($conn, $mquery);
	
	if(!$movieQuery || mysqli_num_rows($movieQuery) == 0){

		$sql = "INSERT INTO user_movies(UserID, MovieID) 
		VALUES ('{$userId}', '{$MovieID}')";

		$executeSql = mysqli_query($conn, $sql);
		if($executeSql){
			echo $MovieID . " : " . $userId . " added!";
		}
		else{
			die(mysqli_error($conn) + " anddd movie:" + $movieId + " : " + $userId);
		}

	}

	if($wantToWatch == 1){
		$sql = "UPDATE `user_movies` SET `wantToWatch`=$wantToWatch 
		WHERE `UserID` = $userId and `MovieID` = $MovieID";
		$executeSql = mysqli_query($conn, $sql);
		if($executeSql){
			echo "MovieID:" . $MovieID . " WANT to WATCH set true!";
		}
		else{
			echo "sql error at WANT to WATCH";
		}
	}

	if($hasWatched == 1){
		$sql = "UPDATE `user_movies` SET `hasWatched`=$hasWatched 
		WHERE `UserID` = $userId and `MovieID` = $MovieID";
		$executeSql = mysqli_query($conn, $sql);
		if($executeSql){
			echo "MovieID: " . $MovieID . " HAS WATCHED set true!";
		}
		else{
			echo "sql error at HAS WATCHED";
		}
	}

	echo $MovieID;


}
else{
	echo "movieId is null";
}
mysqli_close($conn);
?>