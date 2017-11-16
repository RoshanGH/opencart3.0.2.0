<div class="row">

	<div class="col-sm-12">

		<?php if ($addresses) { ?>
			<div class="radio">
				<label><input type="radio" name="payment_address" value="existing" id="payment-address-existing" checked="checked" z/><?php echo $text_address_existing; ?></label>
			</div>

			<div id="payment-existing">

				<select name="address_id" class="form-control" size="5">

					<?php foreach ($addresses as $address) { ?>
						<?php if ($address['address_id'] == $address_id) { ?>
							<option value="<?php echo $address['address_id']; ?>" selected="selected">
							<?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?>
							</option>
						<?php } else { ?>
							<option value="<?php echo $address['address_id']; ?>">
							<?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?>
							</option>
						<?php } ?>
					<?php } ?>

				</select>

			</div>
			
		<div class="radio">
			<label><input type="radio" name="payment_address" value="new" id="payment-address-new" /><?php echo $text_address_new; ?></label>
		</div>
		
		<?php } ?>

		<div id="payment-new" style="display: <?php echo ($addresses ? 'none' : 'block'); ?>;" >
			<div class="row">
				<div class="form-group col-sm-6">
					<label for="firstname">
						<span class="required">*</span> <?php echo $entry_firstname; ?>
					</label>
					<input type="text" name="firstname" value="" class="form-control" />
				</div>
				<div class="form-group col-sm-6">
					<label for="lastname">
						<span class="required">*</span> <?php echo $entry_lastname; ?>
					</label>
					<input type="text" name="lastname" value="" class="form-control" />
				</div>
			</div>
			<div class="form-group">
				<label for="company">
					<?php echo $entry_company; ?>
				</label>
				<input type="text" name="company" value="" class="form-control" />
			</div>
			<?php if ($company_id_display) { ?>
			<div class="form-group">
				<label for="company_id">
					<?php if ($company_id_required) { ?><span class="required">*</span><?php } ?> <?php echo $entry_company_id; ?>
				</label>
				<input type="text" name="company_id" value="" class="form-control" />
			</div>
			<?php } ?>
			<?php if ($tax_id_display) { ?>
			<div class="form-group">
				<label for="tax_id">
					<?php if ($tax_id_required) { ?><span class="required">*</span><?php } ?> <?php echo $entry_tax_id; ?>
				</label>
				<input type="text" name="tax_id" value="" class="form-control" />
			</div>
			<?php } ?>
			<div class="form-group">
				<label for="address_1">
					<span class="required">*</span> <?php echo $entry_address_1; ?>
				</label>
				<input type="text" name="address_1" value="" class="form-control" />
			</div>
			<div class="form-group">
				<label for="address_2">
					<?php echo $entry_address_2; ?>
				</label>
				<input type="text" name="address_2" value="" class="form-control" />
			</div>
			<div class="row">
				<div class="form-group col-sm-6">
					<label for="city">
						<span class="required">*</span> <?php echo $entry_city; ?>
					</label>
					<input type="text" name="city" value="" class="form-control" />
				</div>
				<div class="form-group col-sm-6">
					<label for="postcode">
						<span id="payment-postcode-required" class="required">*</span> <?php echo $entry_postcode; ?>
					</label>
					<input type="text" name="postcode" value="" class="form-control" />
				</div>
			</div>
			<div class="row">
				<div class="form-group col-sm-6">
					<label for="country_id">
						<span class="required">*</span> <?php echo $entry_country; ?>
					</label>
					<select name="country_id" class="form-control" >
						<option value=""><?php echo $text_select; ?></option>
						<?php foreach ($countries as $country) { ?>
						<?php if ($country['country_id'] == $country_id) { ?>
						<option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
						<?php } else { ?>
						<option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
						<?php } ?>
					<?php } ?>
					</select>
				</div>
				<div class="form-group col-sm-6">
					<label for="zone_id">
						<span class="required">*</span> <?php echo $entry_zone; ?>
					</label>
					<select name="zone_id" class="form-control"></select>
				</div>
			</div>
		</div>

		<div class="buttons">
			<input type="button" value="<?php echo $button_continue; ?>" id="button-payment-address" class="button btn btn-default btn-inverse" />
		</div>

	</div>

</div>

<script type="text/javascript"><!--
	$('#payment-address input[name=\'payment_address\']').live('change', function() {
		if (this.value == 'new') {
			$('#payment-existing').hide();
			$('#payment-new').show();
		} else {
			$('#payment-existing').show();
			$('#payment-new').hide();
		}
	});
//--></script> 
<script type="text/javascript"><!--
	$('#payment-address select[name=\'country_id\']').bind('change', function() {
		if (this.value == '') return;
		$.ajax({
			url: 'index.php?route=checkout/checkout/country&country_id=' + this.value,
			dataType: 'json',
			beforeSend: function() {
				$('#payment-address select[name=\'country_id\']').after('<span class="wait">&nbsp;<img src="catalog/view/theme/sellegance/images/loading.gif" alt="" /></span>');
			},
			complete: function() {
				$('.wait').remove();
			},			
			success: function(json) {
				if (json['postcode_required'] == '1') {
					$('#payment-postcode-required').show();
				} else {
					$('#payment-postcode-required').hide();
				}
				
				html = '<option value=""><?php echo $text_select; ?></option>';
				
				if (json['zone'] != '') {
					for (i = 0; i < json['zone'].length; i++) {
	        			html += '<option value="' + json['zone'][i]['zone_id'] + '"';
		    			
						if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
		      				html += ' selected="selected"';
		    			}
		
		    			html += '>' + json['zone'][i]['name'] + '</option>';
					}
				} else {
					html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
				}
				
				$('#payment-address select[name=\'zone_id\']').html(html);
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	});

	$('#payment-address select[name=\'country_id\']').trigger('change');
//--></script>