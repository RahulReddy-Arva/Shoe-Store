<?php
require('database_connection.php');
?>
    <!doctype html>
    <html>
        <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width,initial-scale=1.0">
            <title>ShoeStop!</title>
            <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
            <link href="css/bootstrap.min.css" rel="stylesheet">
            <link href="css/app.css" rel="stylesheet">
            <link href="css/bcss.css" rel="stylesheet">
            <link href="css/gendercss.css" rel="stylesheet">
            <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
            <script type="text/javascript" src="js/bootstrap.min.js"></script>
        </head>

        <style>
            .carousel-inner > .item > img,
            .carousel-inner > .item > a > img {

                margin: auto;

            }
        </style>

        <body>

    <?php
        if(isset($_SESSION['is_auth'])){
            include('login-nav.html.php');
        }else{
            include('nav.html.php');
        }
    ?>