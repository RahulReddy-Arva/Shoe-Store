 <?php
	
	include 'database_connection.php';
	
								if(isset($_POST['btn-rating']))
									$orid = mysqli_real_escape_string($conn,$_POST['oid']);
									$rateu = mysqli_real_escape_string($conn,$_POST['rate']);
									if(mysqli_query($conn,"UPDATE alsohasorderhistory set Review = '$rateu' where order_Id = '$orid' "))
									{
										?>
										<script>alert('successfully added ');</script>
										<?php
									}
								else
								{
										?>
										<script>alert('not successfully added ');</script>
										<?php
								}


						

?>