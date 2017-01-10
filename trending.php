<?php
    include('main-header.html.php');

?>
           <div class="container">
  <div class="jumbotron">
    <h1><b>Trending</h1></b>
    
</div>

  <div class="row">
    
    <?php
    $query = "SELECT shoes.shoe_Id, shoes.brand_Id, brand_Name, SUM(quantity) AS TotalSold, shoes.shoe_Img
                FROM `alsohasorderhistory`,shoes, brand 
                WHERE alsohasorderhistory.shoe_Id = shoes.shoe_Id AND brand.brand_Id = shoes.brand_Id 
                GROUP BY shoes.shoe_Id HAVING SUM(quantity) > 2 
                ORDER BY SUM(quantity) DESC";

    $res=mysqli_query($db2, $query);
while($row = $res->fetch_assoc()) 
{
              $cost = $row['cost'];
              $shoeid = $row['shoe_Id'];
              $brand = $row['brand_Id'];
              $img = $row['shoe_Img'];
              echo "<div class='col-xs-3'>
                    <div class='thumbnail' style='height:350px;width:200px;margin:0 auto'>
                      <img src='images/$img' alt='Blue Jeans' style='height:150px; width:150px;'>
                      <div class='caption'>
                      <h4>$brand $shoeid</h4>
                      <h3>$cost</h3>
            <a href='insertcart.php?shoe=$shoeid' role='button' class='btn btn-danger btn-block btn-sm'>
                     <img src='/images/cart.png' width='50'> Add to Cart
                </a>
                      </div>
                    </div></div>
                    ";
          }


    ?>
  
</div></div>
         
          
      
</body></html>

