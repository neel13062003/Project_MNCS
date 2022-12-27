<!-- Checkout Modal -->
<div class="modal fade" id="checkoutModal" tabindex="-1" role="dialog" aria-labelledby="checkoutModal" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title" id="checkoutModal">Enter Your Details:</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="modal-body">
            <form action="partials/_manageCart.php" method="post">
			     <div class="form-group">
                    <b><label for="address">Enter Your Name: (This Name is Save On Your Billing)</label></b>
                    <input class="form-control" id="username1" name="username1" placeholder="Your Name..." type="text" required minlength="3" maxlength="500" autocomplete="off">
                </div>
				<div class="form-group">
				    <!div class="mb-3">
                        <!div class="pt-4">
                            <a class="dark-grey-text d-flex justify-content-between" style="text-decoration: none; color: #050607;">
                            <strong>Add Your Billing Code Of DP Owner<br>(Most Important=If Forget Go To-><a href="dp.php">DP Code</a>)</strong>
                            
							<span><i class="fas fa-chevron-down pt-1"></i></span>
                            </a>
                            <div class="">
                                <div class="mt-3">
                                    <div class="md-form md-outline mb-0">
                                      <input type="text" id="code" name="code" class="form-control font-weight-light"
                                      placeholder="Enter Your DP Code" autocomplete="off" required>
                                    </div>
                                </div>
                            </div>
                            							
                        <!/div>
                    <!/div>
				</div>
				
                <div class="form-group">
                    <b><label for="address">Address:</label></b>
                    <input class="form-control" id="address" name="address" placeholder="Street/City/State..." type="text" required minlength="3" maxlength="500" autocomplete="off">
                </div>
                <!div class="form-group">
                    <!b><!label for="address1"><!Address Line 2:><!/label><!/b>
                    <!input class="form-control" id="address1" name="address1" placeholder="near st, Surat, Gujarat" type="text">
                <!/div>
                <div class="form-row">
                    <div class="form-group col-md-6 mb-0">
                        <b><label for="phone">Phone No:</label></b>
                        <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon">+91</span>
                        </div>
                        <input type="tel" class="form-control" id="phone" name="phone" placeholder="xxxxxxxxxx" required pattern="[0-9]{10}" maxlength="10" autocomplete="off">
                        </div>
                    </div>
                    <!div class="form-group col-md-6 mb-0">
                        <!b><!label for="zipcode"><!Zip Code:><!/label><!/b>
                        <!input type="text" class="form-control" id="zipcode" name="zipcode" placeholder="xxxxxx" required pattern="[0-9]{6}" maxlength="6">                    
                    <!/div>
					<div class="form-group col-md-6 mb-0">
                        <b><label for="mca">Enter Your MCA No:</label></b>
                        <input type="number" class="form-control" id="mca" name="mca" placeholder="Enter Your MCA no." required pattern="[0-9]{8}" maxlength="8" autocomplete="off">                      
                    </div>
				</div>	
                <div class="form-group">
                    <b><label for="password">Password:</label></b>    
                    <input class="form-control" id="password" name="password" placeholder="Enter Password" type="password" required minlength="4" maxlength="21" data-toggle="password" autocomplete="off">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <input type="hidden" name="amount" value="<?php echo $totalPrice ?>">
                    <button type="submit" name="checkout" class="btn btn-success">Order</button>
                </div>
            </form>
        </div>
        </div>
    </div>
</div>