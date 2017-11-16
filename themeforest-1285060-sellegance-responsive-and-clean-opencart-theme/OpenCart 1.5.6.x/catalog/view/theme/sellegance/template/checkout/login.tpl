<div class="row">
	
	<div class="col-sm-6 register">

		<div class="inner">
	
			<div class="contentset center">
				<h4 class="inner"><span><?php echo $text_new_customer; ?></span></h4>
			</div>
		
			<div class="form-group">
		
				<label><?php echo $text_checkout; ?></label>
		
				<div class="radio">
					<label>
						<?php if ($account == 'register') { ?>
						<input type="radio" name="account" value="register" id="register" checked="checked" />
						<?php } else { ?>
						<input type="radio" name="account" value="register" id="register" />
						<?php } ?>
						<?php echo $text_register; ?>
					</label>
				</div>
				
				<?php if ($guest_checkout) { ?>
				<div class="radio">
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
		
		</div>
		
		<p><?php echo $text_register_account; ?></p>
	
		<div class="buttons">
			<a id="button-account" class="button btn btn-default btn-inverse"><span><?php echo $button_continue; ?></span></a>
		</div>
	
	</div>
	
	<div id="login" class="col-sm-6 login">

		<div class="inner">
	
			<div class="contentset center">
				<h4 class="inner"><span><?php echo $text_returning_customer; ?></span></h4>
			</div>
				
			<p><?php echo $text_i_am_returning_customer; ?></p>
		
			<div class="form-group">
				<label for="email"><?php echo $entry_email; ?></label>
				<input type="email" name="email" id="email" class="form-control required" required />
			</div>
			
			<div class="form-group">
				<label for="password"><?php echo $entry_password; ?></label>
				<input type="password" name="password" id="password" class="form-control required" required />
			</div>
			
			<div class="buttons">
				<input type="button" value="<?php echo $button_login; ?>" id="button-login" class="button btn btn-default btn-inverse" />
				<span class="forgotten"><a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a></span>
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