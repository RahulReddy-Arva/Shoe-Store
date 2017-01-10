 <?php
 


include 'database_connection.php';


	
$useri = $_SESSION['user_id'];

$res=mysqli_query($db2,"SELECT s.shoe_Img image, s.brand_Id brand, a.order_Id orderid, s.shoe_Id shoeid, a.orderdate orderdate, a.quantity quantity, a.totalcost totalcost, a.Review rating FROM alsohasorderhistory a , shoes s where a.shoe_ID = s.shoe_Id and  cust_Id = '$useri'");

$num_rows = mysqli_num_rows($res);
if($num_rows!=0)
{
while($row = $res->fetch_assoc()) 
							{
								
								echo "<tr>";
								echo '<td width=115px align="center" id="Shoe_img "><input type="image" img src="data:image/jpeg;base64,'.base64_encode( $row['image'] ).'" alt="shoe_img" height="110" width="110"><br></td>';
								 
								echo "<td width='200px' align='center' id='Order_ID'><p><font size=4>".$row["brand"]."</font> <br></td>"; 
								echo '<td align="center"><input type="text"  name="oid" readonly placeholder='.$row['orderid'].'> <br></td>'; 								
								echo "<td width=200px align='center' id='Shoe_ID'>".$row["shoeid"]."</font> <br></td>";  
							    echo "<td width=200px align='center' id='Order_date'>".$row["orderdate"]."</font></p> <br<th>  </th></td>";  
								echo "<td width=100px align='center' id='Quantity'>".$row["quantity"]."</font></p> <br<th>  </th></td>";  
								echo "<td width=100px align='center' id='Price'>".$row["totalcost"]."</font></td>";    
								echo '<td> 
								
									<table>
										
										<tr>
											<input type="text"  name="rate" placeholder='.$row['rating'].'><br>
											

										</tr>
										<tr>
											<button type="submit" name="btn-rating">Rate your Experience</button>
										</tr>
									</table>
							
									</td>';
								echo "</tr>";
								
							
							}

}
else
{
	 echo "<tr>"; echo "<td>"; echo "<br>"; echo "</td>"; echo "</tr>";
					 echo "<tr>"; echo "<td>"; echo "<br>"; echo "</td>"; echo "</tr>";
					  echo "<tr>"; echo "<td>"; echo "<br>"; echo "</td>"; echo "</tr>";
					echo "<tr>";
					echo "<td>";
					echo "</td>";
					echo "<td width=300px align='Center' id='Order_ID'>"; echo "<font size='100'>";
					echo "Sorry!! ";  echo "</font>";
					echo "</td>";
					echo "<td width=300px align='Center' id='Order_ID'>"; echo "<font size='100'>";
					echo "your ";  echo "</font>";
					echo "</td>";
					echo "<td width=300px align='Center' id='Order_ID'>"; echo "<font size='100'>";
					echo "cart";  echo "</font>";
					echo "</td>";
					echo "<td width=300px align='Center' id='Order_ID'>"; echo "<font size='100'>";
					echo "is empty <br>";  echo "</font>";
					echo "</td>";
					echo "</tr>";
}


?>