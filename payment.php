<?php

include_once 'database_connection.php';


if(isset($_POST['btn-GoBack']))
{
header("Location: index.php");

}else{

	
	$NameOnCard = $_POST['NameOnCard'];
	$CardNumber = $_POST['CardNumber'];
	$ExpiryDate = $_POST['ExpiryDate'];
	
	
	$useri = $_SESSION['user_id'];

	    $stmt = $pdo->prepare("INSERT INTO hascarddetails(cust_Id,card_no,nameoncard,exp_date) 
	    	VALUES(:id, :CardNumber, :NameOnCard,:ExpiryDate)");
		$stmt->bindParam(':id' , $useri);
		$stmt->bindParam(':CardNumber' , $CardNumber); 
		$stmt->bindParam(':NameOnCard' , $NameOnCard);
		$stmt->bindParam(':ExpiryDate' , $ExpiryDate);
		$stmt->execute();

	header("Location: edit-profile.html.php");
}
?>