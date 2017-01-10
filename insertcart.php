<?php


		
include_once 'database_connection.php';	
$useri = $_SESSION['user_id'];
$shoeid = $_GET['shoe'];	
$query = "INSERT INTO cart(`shoe_Id`, `cust_Id`) VALUES ('$shoeid','$useri')";	
if (mysqli_query($db2,$query));
{
	
	header("Location: ShoppingCart.html.php");
}

	

?>