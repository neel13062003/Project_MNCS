<?php 
    $itemModalSql = "SELECT * FROM `orders`";
    $itemModalResult = mysqli_query($conn, $itemModalSql);
    while($itemModalRow = mysqli_fetch_assoc($itemModalResult)){
        $orderid = $itemModalRow['orderId'];
        $userid = $itemModalRow['userId'];
        //$orderStatus = $itemModalRow['orderStatus'];
        $giftStatus = $itemModalRow['giftStatus'];
    
?>

<!-- Modal -->
<div class="modal fade" id="giftStatus<?php echo $orderid; ?>" tabindex="-1" role="dialog" aria-labelledby="giftStatus<?php echo $orderid; ?>" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header" style="background-color: rgb(111 202 203);">
        <h5 class="modal-title" id="giftStatus<?php echo $orderid; ?>">Gift Status</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="partials/_orderManage2.php" method="post" style="border-bottom: 2px solid #dee2e6;">
            <div class="text-left my-2">    
                <b><label for="name">Gift Status</label></b>
                <div class="row mx-2">
                <input class="form-control col-md-3" id="status" name="status" value="<?php echo $giftStatus; ?>" type="number" min="0" max="1" required>    
                <button type="button" class="btn btn-secondary ml-1" data-container="body" data-toggle="popover" title="User Types" data-placement="bottom" data-html="true" data-content="0=No Gift > 1=Gift Taken<br>">
                    <i class="fas fa-info"></i>
                </button>
                </div>
            </div>
            <input type="hidden" id="orderId" name="orderId" value="<?php echo $orderid; ?>">
            <button type="submit" class="btn btn-success mb-2" name="updateStatus">Update</button>
        </form>
        <?php 
            $giftDetailSql = "SELECT * FROM `giftdetails` WHERE `orderId`= $orderid";
            $giftDetailResult = mysqli_query($conn, $giftDetailSql);
            $giftDetailRow = mysqli_fetch_assoc($giftDetailResult);
            $trackId = $giftDetailRow['id'];
			$gift = $giftDetailRow['gift'];
			
	
            if($giftStatus>0 && $giftStatus<3) { 
        ?>
            <form action="partials/_orderManage2.php" method="post">
                
                
                    <div class="form-group col-md-6">
                        <b><label for="gift">Gift</label></b>
                        <input class="form-control" id="gift" name="gift" value="<?php echo $gift; ?>" type="text" required>
                    </div>
                    
					
                
                <input type="hidden" id="trackId" name="trackId" value="<?php echo $trackId; ?>">
                <input type="hidden" id="orderId" name="orderId" value="<?php echo $orderid; ?>">
                <button type="submit" class="btn btn-success" name="updategiftDetails">Update</button>
            </form>
        <?php } ?>
      </div>
    </div>
  </div>
</div>

<?php
    }
?>

<style>
    .popover {
        top: -77px !important;
    }
</style>

<script>
    $(function () {
        $('[data-toggle="popover"]').popover();
    });
</script>