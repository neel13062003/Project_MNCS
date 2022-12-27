<!doctype html>
<html lang="en" >
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
    <title>Cart</title>
    <link rel = "icon" href ="img/logoneel.jpeg" type = "image/x-icon">
    <style>
    #cont{
        min-height : 626px;
    }
    </style>
	
</head>
<body >

    <?php include 'partials/_dbconnect.php';?>
    <?php require 'partials/_nav.php' ?>
    <?php 
    if($loggedin){
    ?>
	
	<!style="overflow:auto;max-width:100%;position:fixed;">
	
    <div class="container" id="cont" >
        <div class="row" id="neel"  style="overflow:auto;">
            <div class="alert alert-info mb-0" style="width: -webkit-fill-available;">
              <strong>Info!</strong> online payment are currently disabled so please choose cash on delivery.
            </div>
            <div class="col-lg-12 text-center border rounded bg-light my-3" style="position:static;" id="abc">
			    <h1 style="margin-left:60px;">Bill</h1>    
                <!p style="margin-top:0px;font-size:40px;font-weight:bold;"><!My Cart><!/p>   
				    <!button id="button" type="button" onclick="window.print()" style="position:left;margin-top:17px;width:100px;height:35px;color:white;background-color:black;">
				       <!Save Bill><!/button> 
				    <a href="#" onclick="window.print()" class="btn btn-info" style="margin-right:1000px;margin-top:-80px;width:100px;height:35px;
					   color:white;background-color:black;"><i class="material-icons"><!&#xE24D;></i> <span>
				       Take Bill</span></a>   	
            </div>
			
			<div class="col-lg-12 text-center border rounded bg-light my-3">
			      
			</div>
			
            <div class="col-lg-8" >	    
				<!div id="" class="my-4 tableDiv" >   
		        <!div style="overflow:auto;min-width:100%;" class="mx-auto" >   
                <div class="card wish-list mb-3" style="overflow:auto;max-width:100%;">
                    
					<?php
					   $neelsql = "SELECT * FROM `orders` WHERE `userId`= $userId";
                       $neelresult = mysqli_query($conn, $neelsql);
					   $neelrow = mysqli_fetch_assoc($neelresult);
					   
					   //WHERE `username`= $username"
					   $kalpsql = "SELECT * FROM `users` WHERE `username`='$username';";
                       $kalpresult = mysqli_query($conn, $kalpsql);
					   $kalprow = mysqli_fetch_assoc($kalpresult);
					   
					   $username=$kalprow['username'];
					   $mca=$kalprow['mca'];
					   $firstName=$kalprow['firstName'];
					   $lastName=$kalprow['lastName'];
					   $phone=$kalprow['phone'];
					   
					   //$orderDate=$neelrow['orderDate'];
					  
					  
					   /*$code=$neelrow['code'];
					  if($code==NUll){
						$code='';
						$admin='';
					   }
					  else{
					   
					   if($code=='dim123'){
						   $admin='Dr Dimple Soni';
					   }
					   else if($code=='pur123'){
						   $admin='Purvi Popat';
					   }
					   else{
						   $admin='';
					   }
					  } */
					  
					   /*<td>UsernameName = '.$username.'</td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					      */
					   ?>
					   <div style="font-size:20px;font-weight:bold;margin:5px 5px 5px 5px;">
					    <?php
                        echo '<tr>
					      <td>Full Name = '.$firstName.' '.$lastName.'</td> <br>
					      <td>MCA No = '.$username.'</td> <br>
						  <td>Mobile No = '.$phone.'</td><br>
					   </tr>';
					    ?>
						</div>
						<!----<td>DP Owner = '.$admin.' ( '.$code.' ) </td---->
						
						
					<table class="table text-center" >
                        <thead class="thead-light">
		
                            <tr>
                                <th scope="col">No.</th>
                                <th scope="col">Item Name</th>
                                <th scope="col">DP Price</th>
                                <th scope="col">BV</th>
                                <th scope="col">PV</th>
                                <th scope="col">Quantity</th>
                                <th scope="col">Total Price</th>
                                <th scope="col">
                                    <form action="partials/_manageCart.php" method="POST">
                                        <button name="removeAllItem" class="btn btn-sm btn-outline-danger">Remove All</button>
                                        <input type="hidden" name="userId" value="<?php $userId = $_SESSION['userId']; echo $userId ?>">
                                    </form>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                                $sql = "SELECT * FROM `viewcart` WHERE `userId`= $userId";
                                $result = mysqli_query($conn, $sql);
                                $counter = 0;
                                $counter1 = 0;
                                $counter2 = 0;
                                $totalPrice = 0;
                                $totalPrice1 = 0;
                                $totalPrice2 = 0;
                                while($row = mysqli_fetch_assoc($result)){
                                    $pizzaId = $row['pizzaId'];
                                    $Quantity = $row['itemQuantity'];
                                    $mysql = "SELECT * FROM `pizza` WHERE pizzaId = $pizzaId";
                                    $myresult = mysqli_query($conn, $mysql);
                                    $myrow = mysqli_fetch_assoc($myresult);
                                    $pizzaName = $myrow['pizzaName'];
									
                                    $pizzaPrice = $myrow['pizzaPrice'];
                                    $pizzaPrice1 = $myrow['pizzaPrice1'];
                                    $pizzaPrice2 = $myrow['pizzaPrice2'];
									
                                    $total = $pizzaPrice * $Quantity;
                                    $counter++;
									$total1 = $pizzaPrice1 * $Quantity;
                                    $counter1++;
									$total2 = $pizzaPrice2 * $Quantity;
                                    $counter2++;
									
                                    $totalPrice = $totalPrice + $total;
                                    $totalPrice1 = $totalPrice1 + $total1;
                                    $totalPrice2 = $totalPrice2 + $total2;

                                    echo '<tr>
                                            <td>' . $counter . '</td>
                                            <td>' . $pizzaName . '</td>
                                            <td>' . $pizzaPrice . '</td>
                                            <td>' . $pizzaPrice1 . '</td>
                                            <td>' . $pizzaPrice2 . '</td>
                                            <td>
                                                <form id="frm' . $pizzaId . '">
                                                    <input type="hidden" name="pizzaId" value="' . $pizzaId . '">
                                                    <input type="number" name="quantity" value="' . $Quantity . '" class="text-center" 
													   onchange="updateCart(' . $pizzaId . ')" onkeyup="return false" style="width:60px" min=0
													   oninput="check(this)" onClick="this.select();">
												</form>
                                            </td>
                                            <td>' . $total . '</td>    
                                            <td>
                                                <form action="partials/_manageCart.php" method="POST">
                                                    <button name="removeItem" class="btn btn-sm btn-outline-danger">Remove</button>
                                                    <input type="hidden" name="itemId" value="'.$pizzaId. '">
                                                </form>
                                            </td>
                                        </tr>';
                                }
                                if($counter==0) {
                                    ?><script> document.getElementById("cont").innerHTML = '<div class="col-md-12 my-5"><div class="card"><div class="card-body cart"><div class="col-sm-12 empty-cart-cls text-center"> <img src="https://i.imgur.com/dCdflKN.png" width="130" height="130" class="img-fluid mb-4 mr-3"><h3><strong>Your Cart is Empty</strong></h3><h4>Add something to make me happy :)</h4> <a href="index.php" class="btn btn-primary cart-btn-transform m-3" data-abc="true">continue shopping</a> </div></div></div></div>';</script> <?php
                                }
                            ?>
							<?php
							if($totalPrice>=2000){
								$loyalty=true;
							}
							else{
								$loyalty=false;
							}
						    ?>
		                    <!---Alert--For-Loylaty-->
	                        <?php
	                        if ($loyalty) {
                                echo '<div class="alert alert-s alert-dismissible my-2" style="text-align: center;background-color:green; font-size:20px; color:white;">   
                                <strong>☑</strong> Loyalty <strong> successfully !</strong> 
                                </div>';
                            }
							
	                        else{
		                        echo '<div class="alert alert-s alert-dismissible my-2" style="text-align:center;background-color: red; font-size:20px;color:white;">
                                <button type="button" class="btn-c btn-close" data-bs-dismiss="alert">✘</button>
                                Bill Not Reached Till <strong> Loyalty</strong>
                                </div>';
	                        }
	                        ?>
	                    </div>
							
                        </tbody>
                    </table>
					
					
                </div>
				
            </div>
            <div class="col-lg-4" >
                <div class="card wish-list mb-3">
                    <div class="pt-4 border bg-light rounded p-3">
                        <h5 class="mb-3 text-uppercase font-weight-bold text-center">Order summary</h5>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0 bg-light">Total Price<span>Rs. <?php echo $totalPrice ?></span></li>
                            <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0 bg-light">Total BV<span> <?php echo $totalPrice1 ?></span></li>
                            <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0 bg-light">Total PV<span> <?php echo $totalPrice2 ?></span></li>
                            <li class="list-group-item d-flex justify-content-between align-items-center px-0 bg-light">Shipping<span>Rs. 0</span></li>
                            <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3 bg-light">
                                <div>
                                    <strong>The total amount of</strong>
                                    <strong><p class="mb-0">(including Tax & Charge)</p></strong>
                                </div>
                                <span><strong>Rs. <?php echo $totalPrice ?></strong></span>
                            </li>
                        </ul>
						
					<!---button onclick="window.open('whatsapp://send?text= Total Price=')">Share WhatsApp</button---->    
	                <!a href="https://wa.me/7874866543?text=Hi%20There!" class="float"
                      style="position: fixed;width: 50px;  height: 50px;  bottom: 70px; right: 120px;color: #fff;border-radius: 50px;text-align: center;cursor: pointer;box-shadow: 2px 2px 3px #999;">
                      <!img src="https://trickuweb.com/whatsapp.png" alt="" height="60px" width="60px" />
					<!/a>
						
					
                    <!Coupen Concept Kari sakay>					
					<!div class="mb-3">
                        <!div class="pt-4">
                            <!a class="dark-grey-text d-flex justify-content-between" style="text-decoration: none; color: #050607;">
                            <!strong><!Add Your Billing Code> <!/br><!(Most Important)><!/strong><!br>
                            <!span><!i class="fas fa-chevron-down pt-1"></!i><!/span>
                            <!/a>
                            <!div class="">
                                <!div class="mt-3">
                                    <!div class="md-form md-outline mb-0">
                                      <!input type="text" id="discount-code" class="form-control font-weight-light"
                                      placeholder="Enter discount code">
                                    <!/div>
                                <!/div>
                            <!/div>
							
                        <!/div>
                    <!/div>
						
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" checked>
                            <label class="form-check-label" for="flexRadioDefault1">
                                Cash On Delivery 
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="flexRadioDefault1" id="flexRadioDefault1" disabled>
                            <label class="form-check-label" for="flexRadioDefault1">
                                Online Payment 
                            </label>
                        </div><br>
						
                        <button type="button" class="btn btn-primary btn-block" data-toggle="modal" data-target="#checkoutModal">go to checkout</button>
                    </div>
                </div>
              
			   
            </div>
        </div>
    </div>
                                
    <?php 
    }
    else {
        echo '<div class="container" style="min-height : 610px;">
        <div class="alert alert-info my-3">
            <font style="font-size:22px"><center>Before checkout you need to <strong><a class="alert-link" data-toggle="modal" data-target="#loginModal">Login</a></strong></center></font>
        </div></div>';
    }
    ?>
    <?php require 'partials/_checkoutModal.php'; ?>
    <!--?php require 'partials/_footer.php' ?-->
	
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>         
    <script src="https://unpkg.com/bootstrap-show-password@1.2.1/dist/bootstrap-show-password.min.js"></script>
    <script>
        function check(input) {
            /*if (input.value <= 0) {
                input.value = 0;
            }*/
        }
        function updateCart(id) {
            $.ajax({
                url: 'partials/_manageCart.php',
                type: 'POST',
                data:$("#frm"+id).serialize(),
                success:function(res) {
                    location.reload();
                } 
            })
        }
    </script>

</body>
</html>