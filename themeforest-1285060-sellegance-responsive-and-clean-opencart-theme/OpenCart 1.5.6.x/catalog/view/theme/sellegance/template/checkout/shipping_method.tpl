<div class="row">

	<div class="col-md-12">

		<?php if ($error_warning) { ?>
			<div class="warning"><?php echo $error_warning; ?></div>
		<?php } ?>

		<?php if ($shipping_methods) { ?>
			
			<p><?php echo $text_shipping_method; ?></p>

			<div class="form-group">

				<?php foreach ($shipping_methods as $shipping_method) { ?>
					
					<div class="method-type">
						<p><?php echo $shipping_method['title']; ?></p>

					<?php if (!$shipping_method['error']) { ?>
						<?php foreach ($shipping_method['quote'] as $quote) { ?>
							<div class="radio">
								<label>
									<?php if ($quote['code'] == $code || !$code) { ?>
										<?php $code = $quote['code']; ?>
										<input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" id="<?php echo $quote['code']; ?>" checked="checked" class="radio inline" />
									<?php } else { ?>
										<input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" id="<?php echo $quote['code']; ?>" class="radio inline" />
									<?php } ?>
									<?php echo $quote['title']; ?> (<b><?php echo $quote['text']; ?></b>)
								</label>
							</div>
						<?php } ?>
					</div>
					
					<?php } else { ?>
						<div class="error"><?php echo $shipping_method['error']; ?></div>
					<?php } ?>

				<?php } ?>
			
			</div><br />

		<?php } ?>

		<label for="comment"><?php echo $text_comments; ?></label>
		<textarea name="comment" rows="8" class="form-control "><?php echo $comment; ?></textarea>

		<div class="buttons">
			<input type="button" value="<?php echo $button_continue; ?>" id="button-shipping-method" class="button btn btn-default btn-inverse" />
		</div>
	
	</div>

</div>