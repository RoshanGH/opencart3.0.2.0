<div class="row">
	<div class="col-sm-12">

		<div class="form-group">
			<label for="firstname">
				<span class="required">*</span> <?php echo $entry_firstname; ?>
			</label>
			<input type="text" name="firstname" value="<?php echo $firstname; ?>" class="form-control" />
		</div>

		<div class="form-group">
			<label for="lastname">
				<span class="required">*</span> <?php echo $entry_lastname; ?>
			</label>
			<input type="text" name="lastname" value="<?php echo $lastname; ?>" class="form-control" />
		</div>

		<div class="form-group">
			<label for="company">
				<?php echo $entry_company; ?>
			</label>
			<input type="text" name="company" value="<?php echo $company; ?>" class="form-control" />
		</div>

		<div class="form-group">
			<label for="address_1">
				<span class="required">*</span> <?php echo $entry_address_1; ?>
			</label>
			<div class="controls">
			<input type="text" name="address_1" value="<?php echo $address_1; ?>" class="form-control" />
			</div>
		</div>

		<div class="form-group">
			<label for="address_2">
				<?php echo $entry_address_2; ?>
			</label>
			<input type="text" name="address_2" value="<?php echo $address_2; ?>" class="form-control" />
		</div>

		<div class="form-group">
			<label for="city">
				<span class="required">*</span> <?php echo $entry_city; ?>
			</label>
			<input type="text" name="city" value="<?php echo $city; ?>" class="form-control" />
		</div>

		<div class="form-group">
			<label for="postcode">
				<span id="shipping-postcode-required" class="required">*</span><?php echo $entry_postcode; ?>
			</label>
			<input type="text" name="postcode" value="<?php echo $postcode; ?>" class="form-control" />
		</div>

		<div class="form-group">
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

		<div class="form-group">
			<label for="zone_id">
				<span class="required">*</span> <?php echo $entry_zone; ?>
			</label>
			<select name="zone_id" class="form-control"></select>
		</div>

	</div>
</div>

<div class="buttons">
	<input type="button" value="<?php echo $button_continue; ?>" id="button-guest-shipping" class="button btn btn-default btn-inverse" />
</div>
<script type="text/javascript"><!--
	$('#shipping-address select[name=\'country_id\']').bind('change', function() {
		if (this.value == '') return;
		$.ajax({
			url: 'index.php?route=checkout/checkout/country&country_id=' + this.value,
			dataType: 'json',
			beforeSend: function() {
				$('#shipping-address select[name=\'country_id\']').after('<span class="wait">&nbsp;<img src="catalog/view/theme/sellegance/images/loading.gif" alt="" /></span>');
			},
			complete: function() {
				$('.wait').remove();
			},			
			success: function(json) {
				if (json['postcode_required'] == '1') {
					$('#shipping-postcode-required').show();
				} else {
					$('#shipping-postcode-required').hide();
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
				
				$('#shipping-address select[name=\'zone_id\']').html(html);
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	});

	$('#shipping-address select[name=\'country_id\']').trigger('change');
//--></script>