<?php
include('main-header.html.php');

$id = $_SESSION['user_id'];

$stmt = $pdo->prepare("SELECT customer.id, first_name, middle_name, last_name, gender, dob, emailid, ph_no
            FROM customer
            JOIN phonenumber ON phonenumber.cust_id = customer.id
            WHERE customer.id = :customer_id");
$stmt->bindParam(':customer_id' , $id);
$stmt->execute();
$results = $stmt->fetch(PDO::FETCH_OBJ);

$fName = $results->first_name;
$mName = $results->middle_name;
$lName = $results->last_name;
$gender = $results->gender;
$dob = $results->dob;
$email = $results->emailid;
$phone = $results->ph_no;

$stmt = $pdo->prepare("SELECT * FROM address WHERE cust_id = :customer_id AND type = 'billing'");
$stmt->bindParam(':customer_id' , $id);
$stmt->execute();
$results = $stmt->fetch(PDO::FETCH_OBJ);
$billing = $results->address;

$stmt = $pdo->prepare("SELECT * FROM address WHERE cust_id = :customer_id AND type = 'shipping'");
$stmt->bindParam(':customer_id' , $id);
$stmt->execute();
$results = $stmt->fetch(PDO::FETCH_OBJ);
$shipping = $results->address;
?>

<div class="container">
    <form class="form-horizontal" action="edit-profile.php" method="post" role="form">
        <tab><h2>Edit Profile</h2></tab>
        <input type="hidden" name="id" value="<?php echo $id;?>" >
        <div class="form-group">
            <label for="first_name" class="col-sm-3 control-label">First Name</label>
            <div class="col-sm-9">
                <input type="text" id="first_name" name="first_name" placeholder="first name" class="form-control" value="<?php echo $fName;?>" autofocus required>
            </div>
        </div>
        <div class="form-group">
            <label for="middle_name" class="col-sm-3 control-label">Middle Name</label>
            <div class="col-sm-9">
                <input type="text" id="middle_name" name="middle_name" placeholder="middle Name" value="<?php echo $mName;?>" class="form-control" autofocus required>
            </div>
        </div>
        <div class="form-group">
            <label for="last_name" class="col-sm-3 control-label">Last Name</label>
            <div class="col-sm-9">
                <input type="text" id="last_name" name="last_name" placeholder="last Name" value="<?php echo $lName;?>" class="form-control" autofocus required>
            </div>
        </div>
        <div class="form-group">
            <label for="email" class="col-sm-3 control-label">Email</label>
            <div class="col-sm-9">
                <input type="email" id="email" name="email" placeholder="Email" value="<?php echo $email;?>" class="form-control" required>
            </div>
        </div>
        <div class="form-group">
            <label for="birthDate" class="col-sm-3 control-label">Date of Birth</label>
            <div class="col-sm-9">
                <input type="text" id="birthDate" name="birthDate" value="<?php echo $dob;?>" class="form-control">
            </div>
        </div>
        <div class="form-group">
            <label for="phonenumber" class="col-sm-3 control-label">Phone Number</label>
            <div class="col-sm-9">
                <input type="text" id="phonenumber" name="phonenumber" placeholder="PhoneNumber" value="<?php echo $phone;?>" class="form-control" autofocus>
            </div>
        </div>
        <div class="form-group">
            <label for="billingAddress" class="col-sm-3 control-label">Billing Address</label required>
            <div class="col-sm-9">
                <input type="text" id="billingAddress" name="billingAddress" placeholder="Apartment, Street Address,City,State,Zip Code" value="<?php echo $billing;?>" class="form-control" autofocus>
            </div>
        </div>

        <div class="form-group">
            <label for="shippingAddress" class="col-sm-3 control-label">Shipping Address</label>
            <div class="col-sm-9">
                <input type="text" id="shippingAddress" name="shippingAddress" placeholder="Apartment, Street Address,City,State,Zip Code" value="<?php echo $shipping;?>" class="form-control" autofocus>
            </div>
        </div>
        <div class="form-group">

            <div class="col-sm-6 col-sm-offset-3">
                <button type="submit" class="btn btn-primary">Save</button>
                    <a href="payment.html.php" role="button" class="btn btn-primary">Edit Payment Details</a>

            </div>
        </div>
    </form> <!-- /form -->

    <form method="post" action="delete-profile.php" style="margin:0 auto;">
        <input type="hidden" name="id" value="<?php echo $_SESSION['user_id'];?>" >
        <button type="submit" class="btn btn-primary btn-block">DELETE PROFILE</button>
    </form>

</div> <!-- ./container -->


<!-- footer -->
<div class="container">
    <footer class="site-footer">
        <div class="row">
            <div calss="col-md-5">
                <h4>Contact address</h4>
                <address>9509 F University Terrace Dr,<br>
                    Charlotte,<br>
                    NC 28262.</address>

            </div></div>
        <!--  <a class="footer-right" href="#"><img src="images/logo.jpg"></a>-->
        <div class="col-md-6">© Copyright ShoeStop 2016.
        </div>
        <div class="col-md-6">
            <ul class="footer-nav">
                <li><a href="bhome.html">Home</a></li>
                <li><a href="contact.html">Contact</a></li>
                <li><a href="Faq.html">FAQs</a></li>
            </ul>

        </div>
    </footer>
</div>

</body>
</html>