<?php
	require('database_connection.php');

	$id = $_POST['id'];

    $stmt = $pdo->prepare("DELETE FROM customer WHERE id = :id");
	$stmt->bindParam(':id' , $id);
	$stmt->execute();

	//header('location: index.php');
?>