<?php require_once("includes/connection.php");

if(isset($_POST['userId']))
{
$userId = $_POST['userId'];
$moviesToReturn = array();
$variables ="";
$data = array();

$mquery = "SELECT * FROM `user_movies` LEFT JOIN `movie`" .
"ON `user_movies`.`MovieID` = `movie`.`ID`". 
"WHERE `UserID` = $userId and `wantToWatch` = 1";

$movieQuery = mysqli_query($conn, $mquery);


if(!$movieQuery){
	die("Database query failed: ".mysqli_error($conn));
}
else{
	//$num_fields = mysqli_num_fields($movieQuery);	
	$fields = mysqli_fetch_fields($movieQuery);
	$head = array();
	foreach($fields as $field){
		$head[] = $field->name;
	}


	$fp = fopen('file.csv', 'w');

	if($fp && $movieQuery){
    header('Content-Type: text/csv');
    header('Content-Disposition: attachment; filename="export.csv"');
    header('Pragma: no-cache');
    header('Expires: 0');
    fputcsv($fp, $head); 
    while ($row = $movieQuery->fetch_array(MYSQLI_NUM)) {
        fputcsv($fp, array_values($row), '|');
    }
    die;
	}
	fclose($fp);
}
}
else{
	echo "User Id is null";
}
mysqli_close($conn);
?>