<?php require_once("includes/connection.php");


if(isset($_POST['movieId']))
{
	$movieId = $_POST['movieId'];
	$userId = $_POST['userId'];
	$note = !empty($_POST['note']) ? "'$note'" : "NULL";
	$rating = !empty($_POST['rating']) ? "'$rating'" : "NULL";
	$isFavorite = !empty($_POST['isFavorite']) ? "'$isFavorite'" : "NULL";
	$hasWatched = !empty($_POST['hasWatched']) ? "'$hasWatched'" : "NULL";
	$wantToWatch = !empty($_POST['wantToWatch']) ? "'$wantToWatch'" : "NULL";

	$query =  "SELECT * FROM `movie` WHERE `movieId` = '$movieId'";
	$checkquery = mysqli_query($conn,$query);

	$check = mysqli_fetch_array($checkquery);
	$MovieID = $check['ID'];

		$sql = "INSERT INTO user_movies(UserID, MovieID, Note, Rating, isFavorite, hasWatched ,wantToWatch)
		VALUES ( 
			'$userId, $MovieID', '$note', '$rating', '$isFavorite', '$hasWatched', '$wantToWatch'
			)";

		$executeSql = mysqli_query($conn, $sql);
		if($executeSql){
			echo $MovieID . " : " . $userId;
		}
		else{
			echo "sql error";
		}

	
}
else{
	echo "movieId is null";
}
mysqli_close($conn);
?>