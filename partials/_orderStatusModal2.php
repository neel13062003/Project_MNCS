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
        $status = $statusmodalrow['giftStatus'];
        if ($status == 0) 
            $tstatus = "No Gift";
        elseif ($status == 1) 
            $tstatus = "Gift Taken";
        
        else
            $tstatus = "No Gift";

        if($status > 0 && $status < 2) {
            $giftDetailSql = "SELECT * FROM `giftdetails` WHERE `orderId`= $orderid";
            $giftDetailResult = mysqli_query($conn, $giftDetailSql);
            $giftDetailRow = mysqli_fetch_assoc($giftDetailResult);
            $trackId = $giftDetailRow['id'];
            $gift = $giftDetailRow['gift'];
            if($status == 0)
                $gift = 'No';
        }
        else {
            $trackId = 'xxxxx';
            $gift = 'xxxxxx';
        }

?>
<!-- Modal -->
<div class="modal fade" id="giftStatus<?php echo $orderid; ?>" tabindex="-1" role="dialog" aria-labelledby="giftStatus<?php echo $orderid; ?>" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="giftStatus<?php echo $orderid; ?>">Gift Status</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="printThis">
                <div class="container" style="padding-right: 0px;padding-left: 0px;">
                    <article class="card">
                        <div class="card-body">
                            <h6><strong>Order ID:</strong> #<?php echo $orderid; ?></h6>
                            <article class="card">
                                <div class="card-body row">
                                    <!div class="col"> <!strong><!Estimated Delivery time:><!/strong> <!br><!?php echo $deliveryTime; ?> <!Hour> <!/div>
                                    <div class="col"> <strong>Gift</strong> <br> <?php echo $gift; ?> </div>
                                    <div class="col"> <strong>Status:</strong> <br> <?php echo $tstatus; ?> </div>
                                    <!div class="col"> <!strong><!Tracking #:><!/strong> <!br> <!--?php echo $trackId; ?--> <!/div>
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

