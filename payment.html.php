<?php


session_start();

if(!isset($_SESSION['is_auth'])) 
{
	header("Location: index.php");
}


?>
<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  
  <title>Payment method</title>
  
  
  
      <style>
      /* NOTE: The styles were added inline because Prefixfree needs access to your styles and they must be inlined if they are on local disk! */
      @import url(http://fonts.googleapis.com/css?family=Exo:100,200,400);
@import url(http://fonts.googleapis.com/css?family=Source+Sans+Pro:700,400,300);

body{
	margin: 0;
	padding: 0;
	background: #fff;

	color: #fff;
	font-family: 'Exo', sans-serif;
	font-size: 12px;
}
h2 { 
    display: block;
    font-size: 3em;
    margin-top: -2em;
    margin-bottom: 0.67em;
    margin-left: 0;
    margin-right: 0;
    font-weight: bold;
	font-family: 'Exo', sans-serif;
	text-shadow: 2px 2px 5px black;
	
    
}

img
{
	border-radius: 8px;
	position: absolute;
	top: calc(50% - 85px);
	left: calc(20% - 80px);
	z-index: 2;
	
}


.body{
	position: absolute;
	top: -20px;
	left: -5px;
	right: -30px;
	bottom: -40px;
	width: auto;
	height: auto;
	background-image: url(http://media.istockphoto.com/vectors/abstract-credit-card-blueprint-online-banking-shopping-investment-vector-id533243176?s=235x235);
	background-size: 500px;
	-webkit-filter: blur(2px);
	z-index: 0;
}

.grad{
	position: absolute;
	top: -20px;
	left: -20px;
	right: -40px;
	bottom: -40px;
	width: auto;
	height: auto;
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(0,0,0,0)), color-stop(100%,rgba(0,0,0,0.65))); /* Chrome,Safari4+ */
	z-index: 1;
	opacity: 0.7;
}

.header{
	position: absolute;
	top: calc(50% - 85px);
	left: calc(70% - 50px);
	z-index: 2;
}

.header div{
	float: left;
	color: #fff;
	font-family: 'Exo', sans-serif;
	font-size: 35px;
	font-weight: 200;
}

.header div span{
	color: #5379fa !important;
}

.add{
	position: absolute;
	top: calc(50% - 75px);
	left: calc(70% - 80px);
	height: 150px;
	width: 350px;
	padding: 10px;
	z-index: 2;
	text-shadow: 2px 2px 5px black;
	-webkit-transition: width 2s; 
    transition: width 2s;
	

}
.rcorners {
    border-radius: 15px 50px;
    background: #73AD21;
    padding: 20px; 
    width: 200px;
    height: 150px; 
}

.add input[type=text]{
	width: 300px;
	height: 50px;
	background: transparent;
	border: 1px solid rgba(255,255,255,0.6);
	border-radius: 2px;
	color: #fff;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 4px;
}

.add input[type=number]{
	width: 300px;
	height: 50px;
	background: transparent;
	border: 1px solid rgba(255,255,255,0.6);
	border-radius: 2px;
	color: #fff;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 4px;
	margin-top: 10px;
}

.add button[type=submit]{
	width: 150px;
	height: 50px;
	background: #fff;
	border: 1px solid #fff;
	border-radius: 15px 50px 30px;
	cursor: pointer;
	
	color: #a18d6c;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 4px;
	margin-top: 10px;
	
	
}

.add input[type=button]:hover{
	opacity: 0.8;
}

.add input[type=button]:active{
	opacity: 0.6;
}

.add input[type=text]:focus{
	outline: none;
	border: 1px solid rgba(255,255,255,0.9);
}

.add input[type=password]:focus{
	outline: none;
	border: 1px solid rgba(255,255,255,0.9);
}

.add input[type=button]:focus{
	outline: none;
	
}

::-webkit-input-placeholder{
   color: rgba(255,255,255,0.6);
}

::-moz-input-placeholder{
   color: rgba(255,255,255,0.6);
}
    </style>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>

</head>

<body>
		<div class="container">
		
		<div class="body"></div>
		
		<div class="grad"></div>
			
		<div class="header">
			<h2 class="h2" align: left> Payment Card Details </h2>
			
		</div>
		
		
		<img src="https://rectified.net/images/payment-option/credit-cards.png" alt="Card Image" height="200" width="400" blur(2px) >
		
		
		<br>
		
		<div class="add">
			
					<form action="payment.php" method="POST">
				<input type="text" placeholder="Name on Card" name="NameOnCard">
				<input type="text" placeholder="Enter Card Number" name="CardNumber">
				<input type="text" placeholder="Expiry Date YYYY-MM-DD" name="ExpiryDate">
				
						<button type="submit" name="btn-add">ADD</button>
						<button type="submit" name="btn-cancel">Clear</button>
				
						<button type="submit"  name ="btn-GoBack" >Go Back To Home</button>
						
				
				</form>
			
		
		</div>
		
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
</div>
</body>
</html>
