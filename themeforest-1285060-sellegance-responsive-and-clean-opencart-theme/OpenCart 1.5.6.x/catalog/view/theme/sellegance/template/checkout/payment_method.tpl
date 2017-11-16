<div class="row">

	<div class="col-md-12">

		<?php if ($error_warning) { ?>
			<div class="warning"><?php echo $error_warning; ?></div>
		<?php } ?>

		<?php if ($payment_methods) { ?>

			<p><?php echo $text_payment_method; ?></p>

			<div class="form-group">

				<?php foreach ($payment_methods as $payment_method) { ?>
					<div class="radio">
						<label>
							<?php if ($payment_method['code'] == $code || !$code) { ?>
								<?php $code = $payment_method['code']; ?>
								<input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" id="<?php echo $payment_method['code']; ?>" checked="checked" class="radio inline" />
							<?php } else { ?>
								<input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" id="<?php echo $payment_method['code']; ?>" class="radio inline" />
							<?php } ?>
							<?php echo $payment_method['title']; ?>
						</label>
					</div>
				<?php } ?>
			
			</div><br />

		<?php } ?>

		<label for="comment"><b><?php echo $text_comments; ?></b></label>
		<textarea name="comment" rows="8" class="form-control "><?php echo $comment; ?></textarea>

		<?php if ($text_agree) { ?>
			<div class="checkbox">
				<label><input type="checkbox" name="agree" value="1" <?php if ($agree) { ?> checked="checked" <?php } ?> /> <?php echo $text_agree; ?></label>
			</div>
		<?php } ?>
		
		<div class="buttons">
			<input type="button" value="<?php echo $button_continue; ?>" id="button-payment-method" class="button btn btn-default btn-inverse" />
		</div>
		
	</div>

</div>

<script type="text/javascript"><!--

	$('.colorbox').colorbox({
		overlayClose: true,
		opacity: 0.5,
		maxHeight: 560,
		maxWidth: 560,
		width:'100%'
	});
	
//--></script> 