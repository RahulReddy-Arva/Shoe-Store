
<?php


session_start();

if(!isset($_SESSION['is_auth']))
{
	?>
        <script>alert('Please Login view your cart ');</script>
        <?php
	header("Location: index.php");
}

include_once 'insertorders.php';

?>


<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  
  <title>Cart</title>
  
  
  
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


.cbody{
	position: absolute;
	top: -20px;
	left: -5px;
	right: -30px;
	bottom: -40px;
	width: auto;
	height: auto;
	background-image: url(https://www.417marketing.com/wp-content/uploads/2014/01/shopping-cart.jpg);
	background-size: 4000px;
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
	top: calc(35% - 85px);
	left: 44%;
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
	top: calc(40% - 75px);
	width: 95%;
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
	font-size: 30px;
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
          table, td, th {
    border: 0px solid black;
}

table {
    border-collapse: collapse;
    width: 100%;
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
	<form method="post">
		<div class="container">
		
		<div class="cbody"></div>
		
		<div class="grad"></div>
			
		<div class="header">
			<h2 class="h2" align='right'> Shopping Cart </h2>
			
		</div>
		<br>
		
		<div class="add">
				<table align="left">
				<table align="right">
				<tr>
				
                    <td width=300px align='Center' id="Order_ID">Shoe</td>

                    <td width=300px align='Center' id="Order_ID">ShoeName</td>

                    <td width=300px align='Center' id="Order_ID">Price</td>

					<td width=300px align='Center' id="Price">Discount</td>

                    <td width=300px align='Center' id="Rating">Cost after Discount</td>

                    <td width=300px align='Center' id="Shoe_ID">Shoe Size</td>

                    <td width=300px align='Center' id="Order_date">Shoe Color</td>

                    <td width=300px align='Center' id="Quantity">Quantity</td>
                   
                    </tr>
				
				

<?php

include_once 'ShoppingCart.php';

?>
<tr><td><br></td><br><td><br></td><td>
						<button type="submit" name="btn-GoBack" >Go Back To Home</button>
						
				</td>
				</tr>
				</table>
		</div>
		
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
</div>
 </form> 
</body>
</html>
