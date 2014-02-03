<?php require_once("includes/connection.php");


if(isset($_POST['movieId']))
{
	$movieId = $_POST['movieId'];

	$query =  "SELECT * FROM `movie` WHERE `movieId` = '$movieId'";
	$checkquery = mysqli_query($conn,$query);

	if(!$checkquery || mysqli_num_rows($checkquery) == 0){

	$mpaaRating = $_POST['mpaaRating'];
	$movieTitle = $_POST['movieTitle'];
	$criticScore = $_POST['criticScore'];
	$audienceScore = $_POST['audienceScore'];
	$runtime = $_POST['runtime'];
	$releaseDate = $_POST['releaseDate'];
	$smallMovieCover = $_POST['smallMovieCover'];
	$largeMovieCover = $_POST['largeMovieCover'];

		$sql = "INSERT INTO movie(movieID, title, release_date, mpaa_rating,profile_pic,detail_pic,rottentomato_rating,audience_rating)
		VALUES ( 
			'{$movieId}', '{$movieTitle}', '{$releaseDate}', '{$mpaaRating}', '{$smallMovieCover}', '{$largeMovieCover}','{$criticScore}' ,'{$audienceScore}'
			)";

		$check = mysqli_query($conn, $sql);
		if($check){
		echo $movieId . " , " . $movieTitle;
		}
		else{
		echo "connection error";
		}
	}
	else{
		echo "movie already exists." . mysqli_num_rows($checkquery);
	}
}
else{
	echo "movieId is null";
}
mysqli_close($conn);
?>