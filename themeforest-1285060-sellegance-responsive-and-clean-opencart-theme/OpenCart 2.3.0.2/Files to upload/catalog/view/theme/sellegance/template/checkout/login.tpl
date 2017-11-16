<div class="row">
	
	<div id="login" class="col-md-6 col-md-push-3 login">

		<div class="inner">

			<div class="form-group">
			  <label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
			  <input type="text" name="email" value="" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
			</div>

			<div class="form-group">
			  <label class="control-label" for="input-password"><?php echo $entry_password; ?></label>
			  <input type="password" name="password" value="" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
			</div>

			<div class="forgotten"><a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a></div>

			<div class="buttons clearfix">
				<input type="button" value="<?php echo $button_login; ?>" id="button-login" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary btn-block" />
			
				<div class="contentset center">
					<h4 class="inner"><span>or</span></h4>
				</div>

				<div class="checkout-options">
				
					<div class="radio-inline">
						<label>
							<?php if ($account == 'register') { ?>
							<input type="radio" name="account" value="register" id="register" checked="checked" />
							<?php } else { ?>
							<input type="radio" name="account" value="register" id="register" />
							<?php } ?>
							<?php echo $text_register; ?>
						</label>
					</div>
					
					<?php if ($checkout_guest) { ?>
					<div class="radio-inline">
						<label>
							<?php if ($account == 'guest') { ?>
							<input type="radio" name="account" value="guest" id="guest" checked="checked" />
							<?php } else { ?>
							<input type="radio" name="account" value="guest" id="guest" />
							<?php } ?>
							<?php echo $text_guest; ?>
						</label>
					</div>
					<?php } ?>
				
				</div>
			
				<input type="button" value="<?php echo $text_new_customer; ?>" id="button-account" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-cart btn-block" />

				<div class="register-notes"><?php echo $text_register_account; ?></div>
			
			</div>
			

		</div>
	
	</div>

</div>

<script type="text/javascript">

	$('#login input').keydown(function(e) {
		if (e.keyCode == 13) {
			$('#button-login').trigger('click');
		}
	});

</script>