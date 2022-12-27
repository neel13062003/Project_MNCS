<style>
    /* .modal-body {
        background-color: #eeeeee;
        font-family: 'Open Sans', serif
    } */

    .card {
        position: relative;
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-orient: vertical;
        -webkit-box-direction: normal;
        -ms-flex-direction: column;
        flex-direction: column;
        min-width: 0;
        word-wrap: break-word;
        background-color: #fff;
        background-clip: border-box;
        border: 1px solid rgba(0, 0, 0, 0.1);
        border-radius: 0.10rem
    }

    .card-header:first-child {
        border-radius: calc(0.37rem - 1px) calc(0.37rem - 1px) 0 0
    }

    .card-header {
        padding: 0.75rem 1.25rem;
        margin-bottom: 0;
        background-color: #fff;
        border-bottom: 1px solid rgba(0, 0, 0, 0.1)
    }

    .track {
        position: relative;
        background-color: #ddd;
        height: 7px;
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        margin-bottom: 60px;
        margin-top: 50px
    }

    .track .step {
        -webkit-box-flex: 1;
        -ms-flex-positive: 1;
        flex-grow: 1;
        width: 25%;
        margin-top: -18px;
        text-align: center;
        position: relative
    }

    .track .step.active:before {
        background: #FF5722
    }

    .track .step::before {
        height: 7px;
        position: absolute;
        content: "";
        width: 100%;
        left: 0;
        top: 18px
    }

    .track .step.active .icon {
        background: #ee5435;
        color: #fff
    }

    .track .step.deactive:before {
        background: #030303;
    }

    .track .step.deactive .icon {
        background: #030303;
        color: #fff
    }

    .track .icon {
        display: inline-block;
        width: 40px;
        height: 40px;
        line-height: 40px;
        position: relative;
        border-radius: 100%;
        background: #ddd
    }

    .track .step.active .text {
        font-weight: 400;
        color: #000
    }

    .track .text {
        display: block;
        margin-top: 7px
    }

    .btn-warning {
        color: #ffffff;
        background-color: #ee5435;
        border-color: #ee5435;
        border-radius: 1px
    }

    .btn-warning:hover {
        color: #ffffff;
        background-color: #ff2b00;
        border-color: #ff2b00;
        border-radius: 1px
    }
    
</style>
<?php 
    $statusmodalsql = "SELECT * FROM `orders` WHERE `userId`= $userId";
    $statusmodalresult = mysqli_query($conn, $statusmodalsql);
    
    while($statusmodalrow = mysqli_fetch_assoc($statusmodalresult)){
		
        $orderid = $statusmodalrow['orderId'];
        $status = $statusmodalrow['payStatus'];
		$amount = $statusmodalrow['amount'];
        if ($status == 0) 
            $tstatus = "Incompleted";
        elseif ($status == 1) 
            $tstatus = "Online";
        elseif ($status == 2)
            $tstatus = "Cash";
        else
            $tstatus = "Payment Nor Reached";

        if($status >= 1 && $status <= 2) {
            $payDetailSql = "SELECT * FROM `paydetails` WHERE `orderId`= $orderid";	
            $payDetailResult = mysqli_query($conn, $payDetailSql);

            //if(mysqli_fetch_assoc($payDetailResult) > 0){
                $payDetailRow = mysqli_fetch_assoc($payDetailResult);
                $trackId = $payDetailRow['id'];
                $pay = $payDetailRow['pay'];
            //}else{
               /* $trackId = 0;
                $pay = 0;*/
            //}


	        // Jo apde $total bahar muksu to $pay work nahi kare destroy thai gayu hase beca local var
	        $total=$amount-$pay;
            if($status == 0)
                $pay = '0';
			
        }
        else {
            $trackId = 'xxxxx';
            $pay = '0';
			$total=$amount;
        }
	      
?>
<!-- Modal -->
<div class="modal fade" id="payStatus<?php echo $orderid; ?>" tabindex="-1" role="dialog" aria-labelledby="payStatus<?php echo $orderid; ?>" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="payStatus<?php echo $orderid; ?>">Payment Status</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="printThis">
                <div class="container" style="padding-right: 0px;padding-left: 0px;">
                    <article class="card">
                        <div class="card-body">
						    
							<?php 
							if($total!=0){ ?>
						    <span><h5><strong><i class="fas fa-exclamation-triangle" style="font-size:35px;color:red"></i> &nbsp;Pls Paid Your Remaining Money As Soon As possible  => <b style="color:red; font-size:30px;"><?php  echo $total; ?></b> </strong></h5></span>
						    <?php }
							?>
							
							<?php 
							if($total==0){ ?>
						    <span><h5><strong><i class="far fa-grin" style="font-size:35px;color:Blue"></i> &nbsp; Thank You </strong></h5></span>
						    <?php }
							?>
							
						   
						   
						   <h6><strong>Order ID:</strong> #<?php echo $orderid; ?></h6>
                            <article class="card">
                                <div class="card-body row">
                                    <!div class="col"> <!strong><!Estimated Delivery time:><!/strong> <!br><!?php echo $deliveryTime; ?> <!Hour> <!/div>
                                    <div class="col"> <strong>Total</strong> <br> <?php echo $amount; ?> </div>
                            
									<div class="col"> <strong>Paid</strong> <br> <?php echo $pay; ?> </div>
                              
									<!div class="col"> <!strong ><!Remaining><!/strong> <!br> <!span style="color:white;font-size:30px;color:red;"><!--?php  echo $total; ?></span> </div-->
                                    <div class="col"> <strong>Status:</strong> <br> <?php echo $tstatus; ?> </div>
                                    <div class="col"> <strong>Tracking #:</strong> <br> <?php echo $trackId; ?> </div>
                                </div>
                            </article>
                            
                            
                           
						   <a href="contact.php" class="btn btn-warning" data-abc="true">Help <i class="fa fa-chevron-right"></i></a>
                        </div>
                    </article>
                </div>
            </div>
        </div>
    </div>
</div>
<?php
    }
?>

