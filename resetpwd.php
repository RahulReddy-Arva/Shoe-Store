<?php
	require('database_connection.php');

	$email = $_POST['email'];
    $password = $_POST['password'];

    $stmt = $pdo->prepare("UPDATE customer SET password = :pass WHERE emailId = :email");
	$stmt->bindParam(':email' , $email);
	$stmt->bindParam(':pass' , $password);
	$stmt->execute();

	header('location: index.php');
?>