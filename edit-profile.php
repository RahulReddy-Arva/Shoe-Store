<?php
require('database_connection.php');

$id = $_POST['id'];
$fName = $_POST['first_name'];
$mName = $_POST['middle_name'];
$lName = $_POST['last_name'];
$email = $_POST['email'];
$dob = $_POST['birthDate'];
$phoneNumber = $_POST['phonenumber'];
$billingAddress = $_POST['billingAddress'];
$shippingAddress = $_POST['shippingAddress'];

// general customer information
$stmt = $pdo->prepare("UPDATE customer SET dob = :dob, first_name = :firstName, middle_name = :middleName, last_name = :lastName, emailId = :email WHERE id = :id");
$stmt->bindParam(':dob' , $dob);
$stmt->bindParam(':firstName' , $fName);
$stmt->bindParam(':middleName' , $mName);
$stmt->bindParam(':lastName' , $lName);
$stmt->bindParam(':email' , $email);
$stmt->bindParam(':id' , $id);
$stmt->execute();

// phone number
$stmt = $pdo->prepare("UPDATE phonenumber SET ph_no = :phone WHERE cust_Id = :id");
$stmt->bindParam(':phone' , $phoneNumber);
$stmt->bindParam(':id' , $id);
$stmt->execute();

// billing address
$stmt = $pdo->prepare("UPDATE address SET address = :billingAddress WHERE cust_Id = :id AND type = 'billing'");
$stmt->bindParam(':billingAddress' , $billingAddress);
$stmt->bindParam(':id' , $id);
$stmt->execute();

// shipping address
$stmt = $pdo->prepare("UPDATE address SET address = :shippingAddress WHERE cust_Id = :id AND type = 'shipping'");
$stmt->bindParam(':shippingAddress' , $shippingAddress);
$stmt->bindParam(':id' , $id);
$stmt->execute();


header('location: edit-profile.html.php');

