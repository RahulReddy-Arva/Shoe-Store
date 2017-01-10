<?php
    include('main-header.html.php');
?>
         
         
         <div class="container">
  <div class="jumbotron">
    <h1><b>Kids</h1></b>
    
</div>
         
         
      <div class="row">
     <!-- Start of an item-->
    <!--?php
    $arr = array(1, 2, 3, 4, 5,6,7, 2, 3, 4, 5, 2, 3, 4, 5, 2, 3, 4, 5);
    foreach ($arr as &$value) {
        ?-->
   
          <div class="container">


          <?php
          
          //kids color = 110-113
          

              $query = "SELECT * FROM shoes where shoe_id >= 111 && shoe_id <=114";

          $results = mysql_query($query);
                    echo "<div class='row'>";
          while ($shoe = mysql_fetch_assoc($results)){
              //var_dump($shoe);
              $shoeid = $shoe['shoe_Id'];
              $brand = $shoe['brand_Id']; 
              $cost = $shoe['cost'];
              $img = $shoe['shoe_Img'];
              echo "<div class='col-xs-3'>
                    <div class='thumbnail' style='height:350px;width:200px;margin:0 auto'>
                      <img src='images/$img' alt='Blue Jeans' style='height:150px; width:150px;'>
                      <div class='caption'>
                      <h4>$brand $shoeid</h4>
                      <h3>$cost</h3>
						<a href='ShoppingCart.html.php?shoe=$shoeid&price=$cost' role='button' class='btn btn-danger btn-block btn-sm'>
                     <img src='/images/cart.png' width='50'> Add to Cart
                </a>
                      </div>
                    </div></div>
                    ";
          }
          
                    //kids brand
          /*
          if (isset($_POST['bfilter']) && $_POST['bfilter'] == '21') {
              $query2 = "select * from shoes where shoe_id = 111"; //adidas
          } else if (isset($_POST['bfilter']) && $_POST['bfilter'] == '20') {
              $query2 = "select * from shoes where shoe_id = 110";   //prada
          } else if (isset($_POST['bfilter']) && $_POST['bfilter'] == '19') {
              $query2 = "select * from shoes where shoe_id = 112";   //catwalk
          } else { 
          	
              $query2 = "SELECT * FROM shoes where shoe_id >= 111 && shoe_id <=114"; */

          
/*
          $results = mysql_query($query2);
          while ($shoe = mysql_fetch_assoc($results)){
              //var_dump($shoe);
              $cost = $shoe['cost'];
              $img = $shoe['shoe_Img'];
              echo "<div class='col-xs-3'>
                    <div class='thumbnail' style='height:270px;width:200px;margin:0 auto'>
                      <img src='images/$img' alt='Blue Jeans' style='height:150px; width:150px;'>
                      <div class='caption'>
                        <h3>$cost</h3>
                          <a href='ShoppingCart.html.php?shoe=$shoeid&price=$cost' role='button' class='btn btn-danger btn-block btn-sm'>
                     <img src='images/cart%20icon.png' width='20'> Add to Cart
                </a>
                      </div>
                    </div></div>
                    ";
          }echo '</div>';

          */
          ?>
          
          
         
          
          
                      </div>
    </div>

              </div>
             </div></div>
          
              
              


          
          </div>
    
    <!-- End of an item-->
 
</div>   
         </div>     
               
         
    
</body>
</html>
