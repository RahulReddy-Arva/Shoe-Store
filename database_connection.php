<?php
    session_start();
	//connect to mysql server
    @$conn = mysql_connect("localhost","shoestore","shoestore"); 

    if (!$conn) echo "Cannot connect to MySQL"; 
    
    //select shoestore database
    $db = mysql_select_db("shoestore", $conn);

    $db2 = new mysqli('localhost', 'shoestore', 'shoestore', 'shoestore');
    
    if (!$db) {
        die ('Can\'t use shoestore : ' . mysql_error());
    }

    // PDO Connection
    try {
        $pdo = new PDO("mysql:host=localhost;dbname=shoestore", 'shoestore', 'shoestore');
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    } catch(PDOException $e) {
        //echo 'ERROR: ' . $e->getMessage();
    }
