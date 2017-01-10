<?php
error_reporting(E_ALL);

ini_set('display_errors', '1');
require('database_connection.php');

$fName = $_POST['first_name'];
$mName = $_POST['middle_name'];
$lName = $_POST['last_name'];
$email = $_POST['email'];
$pass = $_POST['password'];
$dob = $_POST['birthDate'];
$billingAddress = $_POST['billingAddress'];
$shippingAddress = $_POST['shippingAddress'];
$phoneNumber = $_POST['phonenumber'];

if(isset($_POST['female'])){
    $gender = 'Female';
}elseif(isset($_POST['male'])){
    $gender = 'Male';
}


// general customer information
$stmt = $pdo->prepare("INSERT INTO customer (dob, first_name, middle_name, last_name, gender, password, emailId, registeredDate) 
            VALUES (:dob, :firstName, :middleName, :lastName, :gender, :pass, :email, curdate() )");
$stmt->bindParam(':dob' , $dob);
$stmt->bindParam(':firstName' , $fName); 
$stmt->bindParam(':middleName' , $mName);
$stmt->bindParam(':lastName' , $lName);
$stmt->bindParam(':gender' , $gender);
$stmt->bindParam(':pass' , $pass);
$stmt->bindParam(':email' , $email);
$stmt->execute();

$newCustomerID = $pdo->lastInsertId();

// phone number
$stmt = $pdo->prepare("INSERT INTO phonenumber (ph_no, cust_Id) 
            VALUES (:phone, :id)");
$stmt->bindParam(':phone' , $phoneNumber);
$stmt->bindParam(':id' , $newCustomerID);
$stmt->execute();

// billing address
$stmt = $pdo->prepare("INSERT INTO address (address, cust_Id, type) 
            VALUES (:billingAddress, :id, 'billing')");
$stmt->bindParam(':billingAddress' , $billingAddress);
$stmt->bindParam(':id' , $newCustomerID);
$stmt->execute();

// shipping address
$stmt = $pdo->prepare("INSERT INTO address (address, cust_Id, type) 
            VALUES (:shippingAddress, :id, 'shipping')");
$stmt->bindParam(':shippingAddress' , $shippingAddress);
$stmt->bindParam(':id' , $newCustomerID);
$stmt->execute();


header('location: index.php');

