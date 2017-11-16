<div class="row">

	<div class="col-sm-6 leftcol">
	  
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
				<input type="text" name="email" value="" class="form-control" />
			</div>
			<div class="form-group">
				<label for="telephone">
					<span class="required">*</span> <?php echo $entry_telephone; ?>
				</label>
				<input type="text" name="telephone" value="" class="form-control" />
			</div>
			<div class="form-group">
				<label for="fax">
					<?php echo $entry_fax; ?>
				</label>
				<input type="text" name="fax" value="" class="form-control" />
			</div>
		</fieldset>

		<fieldset class="subheading">
			<legend><?php echo $text_your_password; ?></legend>

			<div class="row">
				<div class="col-md-6">
					<label for="password">
						<span class="required">*</span> <?php echo $entry_password; ?>
					</label>
					<input type="password" name="password" value="" class="form-control"/>
				</div>
				<div class="col-md-6">
					<label for="confirm">
						<span class="required">*</span> <?php echo $entry_confirm; ?>
					</label>
					<input type="password" name="confirm" value="" class="form-control"/>
				</div>
			</div>
		
		</fieldset>

	</div>

	<div class="col-sm-6 rightcol">

		<fieldset class="subheading">
			<legend><?php echo $text_your_address; ?></legend>

			<div class="form-group">
				<label for="company">
					<?php echo $entry_company; ?>
				</label>
				<input type="text" name="company" value="" class="form-control" />
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
				<input type="text" name="company_id" value="" class="form-control" />
			</div>
			<div id="tax-id-display" class="form-group">
				<label for="tax_id">
					<span id="tax-id-required" class="required">*</span> <?php echo $entry_tax_id; ?>
				</label>
				<input type="text" name="tax_id" value="" class="form-control" />
			</div>
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
		
	</div>

</div>

<div class="row">
	<div class="col-md-12">
		<div class="checkbox">
			<label for="newsletter">
				<input type="checkbox" name="newsletter" value="1" id="newsletter" />
				<?php echo $entry_newsletter; ?>
			</label>
		</div>
		<?php if ($shipping_required) { ?>
		<div class="checkbox">
			<label for="shipping">
				<input type="checkbox" name="shipping_address" value="1" id="shipping" checked="checked" />
				<?php echo $entry_shipping; ?>
			</label>
		</div>
		<?php } ?>
	</div>
</div>
	
<div class="form-actions buttons">
	<?php if ($text_agree) { ?>
	<div class="checkbox">
		<label><input type="checkbox" name="agree" value="1" /> <?php echo $text_agree; ?></label>
	</div>
	<?php } ?>
	<input type="button" value="<?php echo $button_continue; ?>" id="button-register" class="button btn btn-default btn-inverse" />
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
<script type="text/javascript"><!--
	$('.colorbox').colorbox({
		overlayClose: true,
		opacity: 0.5,
		maxHeight: 560,
		maxWidth: 560,
		width:'100%'
	});

//-></script>