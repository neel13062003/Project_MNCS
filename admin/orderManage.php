<!Dynamic banava mate ni procedure chhe badhhi simple to work karej chhe>
<!--P1)Code Fetch nathi thato-->
<!--P2)adminusername='dimplesoni' ni jagaye ek j var varible use karine kai rite kari sakay-->

<!------------------------------Coding Start------------------------------------------------->

<div class="container" style="margin-top:98px;background: aliceblue;min-width:96%;">
    <div class="table-wrapper">
        <div class="table-title" style="border-radius: 14px;background:black;">
            <div class="row">
                <div class="col-sm-4">
                    <h2>Order <b>Details</b></h2>
                </div>
                <div class="col-sm-8">	
                    <a href="#" onclick="window.print()" class="btn btn-info"><i class="material-icons">&#xE24D;</i> <span>Print</span></a>
                    <a href="" class="btn btn-primary"><i class="material-icons">&#xE863;</i> <span>Refresh List</span></a>        
				</div>
            </div>
        </div>
   
		
		
		    <!---Form For Month Wise Distribution OF Biling--->
			
			<style>
            .col-sm-3 input {
             background-color: white;
	         color:black;
			 font-weight:bold;
            }

             .col-sm-3 input:hover {
             background-color: red; 
			 color:black;
			 font-weight:bold;
            }
            </style>			
			
			<?php    
				$month = isset($_GET['month']) ? $_GET['month'] : date('Y-m');	
			?>
			
			<div class="row justify-content-center pt-4">
                <!label for="" class="mt-2"><!Month><!/label>
                <div class="col-sm-3">
                    <input type="month" name="month" id="month" value="<?php echo $month ?>" class="form-control">
                </div>
            </div>
			
			<script>
                $('#month').change(function(){
                location.replace('index.php?page=orderManage&month='+$(this).val())
                })
                
			</script>
			<!---Month wise coding simple logic instead of php onclick event with goto different with every admin--->
		
		
		
		
		
		
		
		
		
        <!-------Copy Code Start------->
		
<!------------------------------First Customer------------------------------------------------->
		
		

		
        <?php
		/*if($_SESSION['adminusername']=='dimplesoni') { ?>*/   //password=dimplenikunj
		if($_SESSION['adminusername']=='87389300') { ?>
		
		
		<!Below Table Apde DYnamic Change karsu pan atyre aa rite simple testing purpose mate karela chhe>
        <div id="" class="my-4 tableDiv" >   
		   <div style="overflow:auto;max-width:1500px;" class="mx-auto" >       
	            <table class="table table-striped table-hover text-center" id="NoOrder1" >
		        
            <thead style="background-color: rgb(111 202 203);">
                <tr>
				    <th>Serial No</th>
                    <th>Leader Name</th>
                    <th>Bill Name</th>
                    
                    <th>MCA</th>
					
					
                    <!th><!User Id><!/th>
                    
                    
                    <th>Amount</th>						
                    <th>Remain</th>						

                    <!th><!Payment Mode><!/th>
                    
                    <th>Pay Status</th>
                    <th>Gift Status</th>
                    <th>Delievery Status</th>						
                    <th>Items</th>
					
					
					<th>Loyalty</th>
					<th>Order Date</th>
					<th>User Id</th>
					<th>Order Id</th>
					<th>Code</th>
					<th>Phone No</th>
					<th>Address</th>
					
                </tr>
            </thead>
			
                    
                    <!--$sql = "SELECT * FROM `orders` where date_format(orderDate,'%Y-%m') = '$month' order by unix_timestamp(orderDate) asc" ;--------->
                    
					<tbody>
                <?php    
                    //$sql = "SELECT * FROM `orders`";
                    
					$sql="SELECT * FROM `orders` where date_format(orderDate,'%Y-%m') = '$month' 
					order by unix_timestamp(orderDate) asc" ;
                  
                    				  
					
					
                    $result = mysqli_query($conn, $sql);
                    $counter = 0;
					
                    $counter1 = 0;
                    $counter2 = 0;
					$total = 0;
					$totalremain = 0;
                    $remain=0;
					
					$sr=0;					
                    while($row = mysqli_fetch_assoc($result)){
                        $Id = $row['userId'];
                        
						$username1=$row['username1'];
                        $orderId = $row['orderId'];
						$userId= $row['userId'];
						
						$mysql = "SELECT * FROM `users` WHERE id = $userId";
						$myresult = mysqli_query($conn, $mysql);
                        $myrow = mysqli_fetch_assoc($myresult);
                        $firstName = $myrow['firstName'];
						
						
                        $code = $row['code'];
                        $mca = $row['mca'];
                         
                        
                        $address = $row['address'];
                        $zipCode = $row['zipCode'];
                        $phoneNo = $row['phoneNo'];
                        $amount = $row['amount'];
						
                        $naSql = "SELECT * FROM `paydetails` WHERE orderId= $orderId";
                        $naResult = mysqli_query($conn, $naSql);
                        //if( mysqli_fetch_assoc($naResult) > 0){
                            $naRow = mysqli_fetch_assoc($naResult);
                            $pay = $naRow['pay'];
                        //}else{
                            //$pay=0;
                        //}
                        
                        
                        $remain =$amount-$pay;
						
                        $orderDate = $row['orderDate'];
                        /*$paymentMode = $row['paymentMode'];*/
						
						/*AA loyalty nu coding chhe*/
						if($amount>2000){
							$loyalty='Yes';
						}
						else{
							$loyalty='No';
						}
					
					//Aa code thi thase e ke je Dim123 vada bill hase e code thi target thai jase
                    if($code=='bayad123'){					
                     	
                        $payStatus = $row['payStatus'];
                        $giftStatus = $row['giftStatus'];
                        $orderStatus = $row['orderStatus'];
                        $counter++;
                        $sr++;
						
						
		            	$total = $total + $amount;
                        $counter1++;
						
						$totalremain = $totalremain + $remain;
                        $counter2++;
						
						
						
		                
                            echo '<tr>
                                
								<td>' .$sr.'</td>
								<td>' . $firstName. '</td>
								<td>' . $username1. '</td>
                                
                                <td>' . $mca . '</td>
                               
                                <td>' . $amount . '</td>
                                <td>' . $remain . '</td>
									
                               
								
                                <td><a href="#" data-toggle="modal" data-target="#payStatus' . $orderId . '" class="view"><i class="material-icons">&#xE5C8;</i></a></td>
                                <td><a href="#" data-toggle="modal" data-target="#giftStatus' . $orderId . '" class="view"><i class="material-icons">&#xE5C8;</i></a></td>
                                <td><a href="#" data-toggle="modal" data-target="#orderStatus' . $orderId . '" class="view"><i class="material-icons">&#xE5C8;</i></a></td>
                                <td><a href="#" data-toggle="modal" data-target="#orderItem' . $orderId . '" class="view" title="View Details"><i class="material-icons">&#xE5C8;</i></a></td>
                                
								
								<td style="color:red;font-size: 30px;">' . $loyalty . '</td>
								<td>' . $orderDate . '</td>
								<td>' . $userId.' </td>
								<td>' . $orderId.' </td>
								<td>' . $code . '</td>
								<td>' . $phoneNo . '</td>
								<td data-toggle="tooltip" title="' .$address. '">' . substr($address, 0, 20) . '...</td>
                                
								
								
								</tr>';
							   
							
                                if($counter==0) {
                            ?><script> document.getElementById("NoOrder1").innerHTML = '<div class="alert alert-info alert-dismissible fade show" role="alert" style="width:100%"> You have not Recieve any Order!	</div>';</script> 
						      
						   <?php
                            }    								
					    }	
					}	
					
                ?>
				
				
            </tbody>
			<tr>
			<th>Total Billing</th>
			<th><?php if($totalremain>0){?>
				Total Payment Remaining
	        <?php } else{ ?>
			    Total Payment Advance	
			<?php	} ?></th>					
			</tr>
			<?php
			   echo '<td>'. $total .'</td> 
			         <td>'. $totalremain .'</td>';     
			?>
			
			<!----<td>'.  
					 if($totalremain<0){
						$totalremain * -1; 
				    } else {
						$totalremain ;
				    }.'</td>'; --->
        </table>
		
	   </div>   
	   </div>
		
		<?php } ?> 
		
		
		
<!--------------------------Customer=2----------------------------------------------------------------------->		
		         
				 
				
        <?php
		/*if($_SESSION['adminusername']=='purvipopat') { ?>*/   //password=dimplenikunj
		if($_SESSION['adminusername']=='87389301') { ?>
		
		
		<!Below Table Apde DYnamic Change karsu pan atyre aa rite simple testing purpose mate karela chhe>
        <div id="" class="my-4 tableDiv" >   
		   <div style="overflow:auto;max-width:1500px;" class="mx-auto" >       
	            <table class="table table-striped table-hover text-center" id="NoOrder1" >
		        
            <thead style="background-color: rgb(111 202 203);">
                <tr>
				    <th>Serial No</th>
                    <th>Leader Name</th>
                    <th>Bill Name</th>
                    
                    <th>MCA</th>
					
					
                    <!th><!User Id><!/th>
                    
                    
                    <th>Amount</th>						
                    <th>Remain</th>						

                    <!th><!Payment Mode><!/th>
                    
                    <th>Pay Status</th>
                    <th>Gift Status</th>
                    <th>Delievery Status</th>						
                    <th>Items</th>
					
					
					<th>Loyalty</th>
					<th>Order Date</th>
					<th>User Id</th>
					<th>Order Id</th>
					<th>Code</th>
					<th>Phone No</th>
					<th>Address</th>
					
                </tr>
            </thead>
			
                    
                    <!--$sql = "SELECT * FROM `orders` where date_format(orderDate,'%Y-%m') = '$month' order by unix_timestamp(orderDate) asc" ;--------->
                    
					<tbody>
                <?php    
                    //$sql = "SELECT * FROM `orders`";
                    
					$sql="SELECT * FROM `orders` where date_format(orderDate,'%Y-%m') = '$month' 
					order by unix_timestamp(orderDate) asc" ;
                  
                    				  
					
					
                    $result = mysqli_query($conn, $sql);
                    $counter = 0;
					
                    $counter1 = 0;
                    $counter2 = 0;
					$total = 0;
					$totalremain = 0;
                    $remain=0;
					
					$sr=0;					
                    while($row = mysqli_fetch_assoc($result)){
                        $Id = $row['userId'];
                        
						$username1=$row['username1'];
                        $orderId = $row['orderId'];
						$userId= $row['userId'];
						
						$mysql = "SELECT * FROM `users` WHERE id = $userId";
						$myresult = mysqli_query($conn, $mysql);
                        $myrow = mysqli_fetch_assoc($myresult);
                        $firstName = $myrow['firstName'];
						
						
                        $code = $row['code'];
                        $mca = $row['mca'];
                         
                        
                        $address = $row['address'];
                        $zipCode = $row['zipCode'];
                        $phoneNo = $row['phoneNo'];
                        $amount = $row['amount'];
						
						$naSql = "SELECT * FROM `paydetails` WHERE orderId= $orderId";
                        $naResult = mysqli_query($conn, $naSql);
                        $naRow = mysqli_fetch_assoc($naResult);
                        $pay = $naRow['pay'];
						
						$remain =$amount-$pay;
						
                        $orderDate = $row['orderDate'];
                        /*$paymentMode = $row['paymentMode'];*/
						
						/*AA loyalty nu coding chhe*/
						if($amount>2000){
							$loyalty='Yes';
						}
						else{
							$loyalty='No';
						}
					
					//Aa code thi thase e ke je Dim123 vada bill hase e code thi target thai jase
                    if($code=='rajkot123'){					
                     	
                        $payStatus = $row['payStatus'];
                        $giftStatus = $row['giftStatus'];
                        $orderStatus = $row['orderStatus'];
                        $counter++;
                        $sr++;
						
						
		            	$total = $total + $amount;
                        $counter1++;
						
						$totalremain = $totalremain + $remain;
                        $counter2++;
						
						
						
		                
                            echo '<tr>
                                
								<td>' .$sr.'</td>
								<td>' . $firstName. '</td>
								<td>' . $username1. '</td>
                                
                                <td>' . $mca . '</td>
                               
                                <td>' . $amount . '</td>
                                <td>' . $remain . '</td>
									
                               
								
                                <td><a href="#" data-toggle="modal" data-target="#payStatus' . $orderId . '" class="view"><i class="material-icons">&#xE5C8;</i></a></td>
                                <td><a href="#" data-toggle="modal" data-target="#giftStatus' . $orderId . '" class="view"><i class="material-icons">&#xE5C8;</i></a></td>
                                <td><a href="#" data-toggle="modal" data-target="#orderStatus' . $orderId . '" class="view"><i class="material-icons">&#xE5C8;</i></a></td>
                                <td><a href="#" data-toggle="modal" data-target="#orderItem' . $orderId . '" class="view" title="View Details"><i class="material-icons">&#xE5C8;</i></a></td>
                                
								
								<td style="color:red;font-size: 30px;">' . $loyalty . '</td>
								<td>' . $orderDate . '</td>
								<td>' . $userId.' </td>
								<td>' . $orderId.' </td>
								<td>' . $code . '</td>
								<td>' . $phoneNo . '</td>
								<td data-toggle="tooltip" title="' .$address. '">' . substr($address, 0, 20) . '...</td>
                                
								
								
								</tr>';
							   
							
                                if($counter==0) {
                            ?><script> document.getElementById("NoOrder1").innerHTML = '<div class="alert alert-info alert-dismissible fade show" role="alert" style="width:100%"> You have not Recieve any Order!	</div>';</script> 
						      
						   <?php
                            }    								
					    }	
					}	
					
                ?>
				
				
            </tbody>
			<tr>
			<th>Total Billing</th>
			<th><?php if($totalremain>0){?>
				Total Payment Remaining
	        <?php } else{ ?>
			    Total Payment Advance	
			<?php	} ?></th>					
			</tr>
			<?php
			   echo '<td>'. $total .'</td> 
			         <td>'. $totalremain .'</td>';     
			?>
			
			<!----<td>'.  
					 if($totalremain<0){
						$totalremain * -1; 
				    } else {
						$totalremain ;
				    }.'</td>'; --->
        </table>
		
	   </div>   
	   </div>
		
		<?php } ?> 
		
		 
				 
				 
		
<!--------------------------Customer=3------------------------------------------------------------------>
       
	   
	     
      
		
<!---------------------------End Of copy Paste Coding----------------------------------------------------------------------------------->

		
    </div>
</div> 


<!------------------------------End OF Coding----------------------------------------------------------------->

<?php 
    include 'partials/_orderItemModal.php';
    include 'partials/_orderStatusModal.php';
    include 'partials/_orderStatusModal1.php';
    include 'partials/_orderStatusModal2.php';
?>

<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<style>
    
    .tooltip.show {
        top: -62px !important;
    }
    
    .table-wrapper .btn {
        float: right;
        color: #333;
        background-color: #fff;
        border-radius: 3px;
        border: none;
        outline: none !important;
        margin-left: 10px;
    }
    .table-wrapper .btn:hover {
        color: #333;      <!---#333--->
        background: #fff; <!---#f2f2f2--->
    }
    .table-wrapper .btn.btn-primary {
        color: #fff;
        background: #03A9F4;      <!------>
    }
    .table-wrapper .btn.btn-primary:hover {
        background: #03a3e7;   <!----#03a3e7----->
    }
    .table-title .btn {		
        font-size: 13px;
        border: none;
    }
    .table-title .btn i {
        float: left;
        font-size: 21px;
        margin-right: 5px;
    }
    .table-title .btn span {
        float: left;
        margin-top: 2px;
    }
    .table-title {
        color: #fff;
        background: #4b5366;		
        padding: 16px 25px;
        margin: -20px -25px 10px;
        border-radius: 3px 3px 0 0;
    }
    .table-title h2 {
        margin: 5px 0 0;
        font-size: 24px;
    }
    table.table tr th, table.table tr td {
        border-color: #e9e9e9;
        padding: 12px 15px;
        vertical-align: middle;
    }
    table.table tr th:first-child {
        width: 60px;
    }
    table.table tr th:last-child {
        width: 80px;
    }
    table.table-striped tbody tr:nth-of-type(odd) {
        /* background-color: #fcfcfc; */
    }
    table.table-striped.table-hover tbody tr:hover {
         background: ; 
    }
    table.table th i {
        font-size: 13px;
        margin: 0 5px;
        cursor: pointer;
    }	
    table.table td a {
        font-weight: bold;
        color: #566787;     
        display: inline-block;
        text-decoration: none;
    }
    table.table td a:hover {
        color: #2196F3;
    }
    table.table td a.view {        
        width: 30px;
        height: 30px;
        color: #2196F3;    
        border: 2px solid;
        border-radius: 30px;
        text-align: center;
    }
    table.table td a.view i {
        font-size: 22px;
        margin: 2px 0 0 1px;
    }   
    table.table .avatar {
        border-radius: 50%;
        vertical-align: middle;
        margin-right: 10px;
    }
    table {
        counter-reset: section;
    }

    .count:before {
        counter-increment: section;
        content: counter(section);
    }
    

</style>


<!Inlcude cdn wali file pan>
<!Only One Jquery & it's before table>
<script>
      $(document).ready(function(){
      $('#NoOrder1').DataTable();
      });
</script>




<script>
$(document).ready(function(){
  $('[data-toggle="tooltip"]').tooltip();
});
</script>