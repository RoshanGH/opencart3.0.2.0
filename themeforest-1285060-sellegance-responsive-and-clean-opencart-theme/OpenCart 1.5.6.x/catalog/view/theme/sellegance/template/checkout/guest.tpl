<div class="row">

	<div class="col-sm-6">

	<fieldset class="subheading">
		
		<legend><?php echo $text_your_details; ?></legend>
		
		<div class="row">
			
			<div class="form-group col-md-6">
				<label for="firstname">
					<span class="required">*</span> <?php echo $entry_firstname; ?>
				</label>
					<input type="text" name="firstname" value="" class="form-control" />
			</div>
			<div class="form-group col-md-6">
				<label for="lastname">
					<span class="required">*</span> <?php echo $entry_lastname; ?>
				</label>
					<input type="text" name="lastname" value="" class="form-control" />
			</div>
			
		</div>

		<div class="form-group">
			<label for="email">
				<span class="required">*</span> <?php echo $entry_email; ?>
			</label>
				<input type="text" name="email" value="<?php echo $email; ?>" class="form-control" />
		</div>

		<div class="form-group">
			<label for="telephone">
				<span class="required">*</span> <?php echo $entry_telephone; ?>
			</label>
				<input type="text" name="telephone" value="<?php echo $telephone; ?>" class="form-control" />
		</div>

		<div class="form-group">
			<label for="fax">
				<?php echo $entry_fax; ?>
			</label>
				<input type="text" name="fax" value="<?php echo $fax; ?>" class="form-control" />
		</div>

	</fieldset>

	</div>

	<div class="col-sm-6">
		
		<fieldset class="subheading">

			<legend><?php echo $text_your_address; ?></legend>
			
			<div class="form-group">
				<label for="company">
					<?php echo $entry_company; ?>
				</label>
					<input type="text" name="company" value="<?php echo $company; ?>" class="form-control" />
			</div>
			<div class="form-group" style="display: <?php echo (count($customer_groups) > 1 ? 'block' : 'none'); ?>;">
				<label>
					<?php echo $entry_customer_group; ?>
				</label>
				<div class="controls">
					<?php foreach ($customer_groups as $customer_group) { ?>
					<?php if ($customer_group['customer_group_id'] == $customer_group_id) { ?>
					
					<label class="radio"><input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" id="customer_group_id<?php echo $customer_group['customer_group_id']; ?>" checked="checked" /> <?php echo $customer_group['name']; ?></label>
					<?php } else { ?>
					<label class="radio"><input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" id="customer_group_id<?php echo $customer_group['customer_group_id']; ?>" /> <?php echo $customer_group['name']; ?></label>
					<?php } ?>
					<?php } ?>
				</div>
			</div>
			<div id="company-id-display" class="form-group">
				<label for="company_id">
					<span id="company-id-required" class="required">*</span> <?php echo $entry_company_id; ?>
				</label>
					<input type="text" name="company_id" value="<?php echo $company_id; ?>" class="form-control" />
			</div>
			<div id="tax-id-display" class="form-group">
				<label for="tax_id">
					<span id="tax-id-required" class="required">*</span> <?php echo $entry_tax_id; ?>
				</label>
					<input type="text" name="tax_id" value="<?php echo $tax_id; ?>" class="form-control" />
			</div>
			<div class="form-group">
				<label for="address_1">
					<span class="required">*</span> <?php echo $entry_address_1; ?>
				</label>
					<input type="text" name="address_1" value="<?php echo $address_1; ?>" class="form-control" />
			</div>
			<div class="form-group">
				<label for="address_2">
					<?php echo $entry_address_2; ?>
				</label>
					<input type="text" name="address_2" value="<?php echo $address_2; ?>" class="form-control" />
			</div>
	
			<div class="row">
				<div class="form-group col-md-6">
					<label for="city">
						<span class="required">*</span> <?php echo $entry_city; ?>
					</label>
						<input type="text" name="city" value="" class="form-control" />
				</div>
				<div class="form-group col-md-6">
					<label for="postcode">
						<span id="payment-postcode-required" class="required">*</span> <?php echo $entry_postcode; ?>
					</label>
						<input type="text" name="postcode" value="<?php echo $postcode; ?>" class="form-control" />
				</div>
			</div>

			<div class="row">
				<div class="form-group col-md-6">
					<label for="country_id">
						<span class="required">*</span> <?php echo $entry_country; ?>
					</label>
						<select name="country_id" class="form-control">
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
				<div class="form-group col-md-6">
					<label for="zone_id">
						<span class="required">*</span> <?php echo $entry_zone; ?>
					</label>
						<select name="zone_id" class="form-control"></select>
				</div>
			</div>

		</fieldset>
		
		<?php if ($shipping_required) { ?>

		<div class="checkbox">
			<label for="shipping">
				<input type="checkbox" name="shipping_address" value="1" id="shipping" <?php if ($shipping_address) { ?> checked="checked" <?php } ?> class="checkbox inline" />
				<?php echo $entry_shipping; ?>
			</label>
		</div>
		
		<?php } ?>

	</div>

</div>

<div class="buttons">
	<input type="button" value="<?php echo $button_continue; ?>" id="button-guest" class="button btn btn-default btn-inverse" />
</div>

<script type="text/javascript"><!--

	$('#payment-address input[name=\'customer_group_id\']:checked').live('change', function() {
		var customer_group = [];
		
		<?php foreach ($customer_groups as $customer_group) { ?>
			customer_group[<?php echo $customer_group['customer_group_id']; ?>] = [];
			customer_group[<?php echo $customer_group['customer_group_id']; ?>]['company_id_display'] = '<?php echo $customer_group['company_id_display']; ?>';
			customer_group[<?php echo $customer_group['customer_group_id']; ?>]['company_id_required'] = '<?php echo $customer_group['company_id_required']; ?>';
			customer_group[<?php echo $customer_group['customer_group_id']; ?>]['tax_id_display'] = '<?php echo $customer_group['tax_id_display']; ?>';
			customer_group[<?php echo $customer_group['customer_group_id']; ?>]['tax_id_required'] = '<?php echo $customer_group['tax_id_required']; ?>';
		<?php } ?>	

		if (customer_group[this.value]) {
			if (customer_group[this.value]['company_id_display'] == '1') {
				$('#company-id-display').show();
			} else {
				$('#company-id-display').hide();
			}
			
			if (customer_group[this.value]['company_id_required'] == '1') {
				$('#company-id-required').show();
			} else {
				$('#company-id-required').hide();
			}
			
			if (customer_group[this.value]['tax_id_display'] == '1') {
				$('#tax-id-display').show();
			} else {
				$('#tax-id-display').hide();
			}
			
			if (customer_group[this.value]['tax_id_required'] == '1') {
				$('#tax-id-required').show();
			} else {
				$('#tax-id-required').hide();
			}	
		}
	});

	$('#payment-address input[name=\'customer_group_id\']:checked').trigger('change');

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