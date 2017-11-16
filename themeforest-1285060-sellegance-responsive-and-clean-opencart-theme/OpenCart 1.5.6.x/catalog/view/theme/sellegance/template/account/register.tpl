<?php echo $header; ?>

	<?php echo $content_top; ?>

	<div class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
		<?php } ?>
	</div>
	
	 <header class="page-header">
		
		<h1><?php echo $heading_title; ?></h1>

		<?php if ($error_warning) { ?>
			<div class="warning"><?php echo $error_warning; ?></div>
		<?php } ?>

	</header>

	<?php 
	
	if ($column_left && $column_right) { 
		$main = "col-sm-6 middle sideleft"; }
	else if ($column_left || $column_right) { 
		$main = "col-sm-9";
		if($column_left) $main.=" sideleft"; else $main.= " sideright";
	} 
	else { $main = "col-sm-12"; } 

	?>

	<div class="row">

		<?php echo $column_left; ?>

		<section id="maincontent" class="<?php echo $main; ?>" role="main">

			<div class="mainborder">

				<?php if ($column_left || $column_right) { ?>
					<div id="toggle_sidebar"></div>
				<?php } ?>
			
				<p><?php echo $text_account_already; ?></p>

				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="register-form" class="form" role="form">

					<fieldset class="subheading">

						<legend><?php echo $text_your_details; ?></legend>

						<div class="row">
							<div class="form-group col-sm-6">
								<label for="firstname">
									<span class="required">*</span> <?php echo $entry_firstname; ?>
								</label>
									<input type="text" name="firstname" id="firstname" value="<?php echo $firstname; ?>" title="<?php echo $this->language->get('error_firstname'); ?>" class="form-control required" required />
									<?php if ($error_firstname) { ?>
									<span class="error"><?php echo $error_firstname; ?></span>
									<?php } ?>
							</div>

							<div class="form-group col-sm-6">
								<label for="lastname">
									<span class="required">*</span> <?php echo $entry_lastname; ?>
								</label>
									<input type="text" name="lastname" id="lastname" value="<?php echo $lastname; ?>" title="<?php echo $this->language->get('error_lastname'); ?>" class="form-control required" required />
									<?php if ($error_lastname) { ?>
									<span class="error"><?php echo $error_lastname; ?></span>
									<?php } ?>
							</div>
						</div>

						<div class="form-group">
							<label for="email">
								<span class="required">*</span> <?php echo $entry_email; ?>
							</label>
								<input type="email" name="email" id="email" value="<?php echo $email; ?>"  title="<?php echo $this->language->get('error_email'); ?>" class="form-control required email" required />
								<?php if ($error_email) { ?>
								<span class="error"><?php echo $error_email; ?></span>
								<?php } ?>
						</div>

						<div class="form-group">
							<label for="telephone">
								<span class="required">*</span> <?php echo $entry_telephone; ?>
							</label>
								<input type="tel" name="telephone" id="telephone" value="<?php echo $telephone; ?>" title="<?php echo $this->language->get('error_telephone'); ?>" class="form-control required" required />
								<?php if ($error_telephone) { ?>
								<span class="error"><?php echo $error_telephone; ?></span>
								<?php } ?>
						</div>

						<div class="form-group">
							<label for="fax"><?php echo $entry_fax; ?></label>
							<input type="text" name="fax" id="fax" value="<?php echo $fax; ?>" class="form-control" />
						</div>

					</fieldset>

					<fieldset class="subheading">

						<legend><?php echo $text_your_address; ?></legend>

						<div class="form-group">
							<label for="company"><?php echo $entry_company; ?></label>
								<input type="text" name="company" id="company" value="<?php echo $company; ?>" class="form-control" />
						</div>

						<div class="form-group" style="display: <?php echo (count($customer_groups) > 1 ? 'block' : 'none'); ?>;">
							<label>
								<?php echo $entry_customer_group; ?>
							</label>
								<?php foreach ($customer_groups as $customer_group) { ?>
								<?php if ($customer_group['customer_group_id'] == $customer_group_id) { ?>
								
								<label class="radio"><input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" id="customer_group_id<?php echo $customer_group['customer_group_id']; ?>" checked="checked" /> <?php echo $customer_group['name']; ?></label>
								<?php } else { ?>
								<label class="radio"><input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" id="customer_group_id<?php echo $customer_group['customer_group_id']; ?>" /> <?php echo $customer_group['name']; ?></label>
								<?php } ?>
								<?php } ?>
						</div>

				  		<div id="company-id-display" class="form-group">
							<label for="company_id">
								<span id="company-id-required" class="required">*</span> <?php echo $entry_company_id; ?>
							</label>
								<input type="text" name="company_id" id="company_id" value="" title="<?php echo $this->language->get('error_company_id'); ?>" class="form-control" />
								<?php if ($error_company_id) { ?>
					            <span class="error"><?php echo $error_company_id; ?></span>
					            <?php } ?>
						</div>

						<div id="tax-id-display" class="form-group">
							<label for="tax_id" class="control-label">
								<span id="tax-id-required" class="required">*</span> <?php echo $entry_tax_id; ?>
							</label>
								<input type="text" name="tax_id" id="tax_id" value="" title="<?php echo $this->language->get('error_tax_id'); ?>" class="form-control" />
								<?php if ($error_tax_id) { ?>
					            <span class="error"><?php echo $error_tax_id; ?></span>
					            <?php } ?>
						</div>

						<div class="form-group">
							<label for="address_1">
								<span class="required">*</span> <?php echo $entry_address_1; ?>
							</label>
								<input type="text" name="address_1" id="address_1" value="<?php echo $address_1; ?>" title="<?php echo $this->language->get('error_address_1'); ?>" class="form-control required" required />
								<?php if ($error_address_1) { ?>
								<span class="error"><?php echo $error_address_1; ?></span>
								<?php } ?>
						</div>

						<div class="form-group">
							<label for="address_2"><?php echo $entry_address_2; ?></label>
								<input type="text" name="address_2" id="address_2" value="<?php echo $address_2; ?>" class="form-control" />
						</div>

						<div class="row">
							<div class="form-group col-sm-6">
								<label for="city">
									<span class="required">*</span> <?php echo $entry_city; ?>
								</label>
									<input type="text" name="city" id="city" value="<?php echo $city; ?>" title="<?php echo $this->language->get('error_city'); ?>" class="form-control required" required />
									<?php if ($error_city) { ?>
									<span class="error"><?php echo $error_city; ?></span>
									<?php } ?>
							</div>

							<div class="form-group col-sm-6">
								<label for="postcode">
									<span id="postcode-required" class="required">*</span> <?php echo $entry_postcode; ?>
								</label>
									<input type="text" name="postcode" id="postcode" value="<?php echo $postcode; ?>" title="<?php echo $this->language->get('error_postcode'); ?>" class="form-control" />
									<?php if ($error_postcode) { ?>
									<span class="error"><?php echo $error_postcode; ?></span>
									<?php } ?>
							</div>
						</div>

						<div class="row">

							<div class="form-group col-sm-6">
								<label for="country_id">
									<span class="required">*</span> <?php echo $entry_country; ?>
								</label>
									<select name="country_id" id="country_id" title="<?php echo $this->language->get('error_country'); ?>" class="form-control required" required >

										<option value="false"><?php echo $text_select; ?></option>

										<?php foreach ($countries as $country) { ?>
											
											<?php if ($country['country_id'] == $country_id) { ?>
										
												<option value="<?php echo $country['country_id']; ?>" selected="selected">
													<?php echo $country['name']; ?>
												</option>

											<?php } else { ?>
											
												<option value="<?php echo $country['country_id']; ?>">
													<?php echo $country['name']; ?>
												</option>
											
											<?php } ?>
										
										<?php } ?>

									</select>
									<?php if ($error_country) { ?>
									<span class="error"><?php echo $error_country; ?></span>
									<?php } ?>
							</div>

							<div class="form-group col-sm-6">
								<label for="zone_id">
									<span class="required">*</span> <?php echo $entry_zone; ?>
								</label>
									<select name="zone_id" id="zone_id" title="<?php echo $this->language->get('error_zone'); ?>" class="form-control required" required>
									</select>
									<?php if ($error_zone) { ?>
									<span class="error"><?php echo $error_zone; ?></span>
									<?php } ?>
							</div>

						</div>

					</fieldset>

					<fieldset class="subheading">

						<legend><?php echo $text_your_password; ?></legend>

						<div class="row">

							<div class="form-group col-sm-6">
								<label for="password">
									<span class="required">*</span> <?php echo $entry_password; ?>
								</label>
									<input type="password" name="password" id="password" value="<?php echo $password; ?>" title="<?php echo $this->language->get('error_password'); ?>" class="form-control password" required />
									<?php if ($error_password) { ?>
										<span class="error"><?php echo $error_password; ?></span>
									<?php } ?>
							</div>

							<div class="form-group col-sm-6">
								<label for="confirm">
									<span class="required">*</span> <?php echo $entry_confirm; ?>
								</label>
									<input type="password" name="confirm" id="confirm" value="<?php echo $confirm; ?>"  title="<?php echo $this->language->get('error_password'); ?>" class="form-control password" required />
									<?php if ($error_confirm) { ?>
										<span class="error"><?php echo $error_confirm; ?></span>
									<?php } ?>
							</div>

						</div>

					</fieldset>

					<fieldset class="subheading">

						<legend><?php echo $text_newsletter; ?></legend>

						<div class="form-group">
							<label><?php echo $entry_newsletter; ?></label>
								<?php if ($newsletter == 1) { ?>
								<div class="radio">
									<label><input type="radio" name="newsletter" value="1" checked="checked" /><?php echo $text_yes; ?></label>
								</div>
								<div class="radio">
									<label><input type="radio" name="newsletter" value="0" /><?php echo $text_no; ?></label>
								</div>
								<?php } else { ?>
								<div class="radio">
									<label><input type="radio" name="newsletter" value="1" /><?php echo $text_yes; ?></label>
									</div>
									<div class="radio">
									<label><input type="radio" name="newsletter" value="0" checked="checked" /><?php echo $text_no; ?></label>
									</div>
								<?php } ?>
						</div>

					</fieldset>

					<div class="form-actions buttons">
							
						<?php if ($text_agree) { ?>
						<div class="checkbox">
							<label><input type="checkbox" name="agree" value="1" <?php if ($agree) { ?> checked="checked" <?php } ?> /> <?php echo $text_agree; ?></label>
						</div>
						<?php } ?>
						
						<input type="submit" value="<?php echo $button_continue; ?>" class="button btn btn-default btn-inverse" />
						
					</div>
					
				</form>

			</div>

		</section> <!-- #maincontent -->

		<?php echo $column_right; ?>

	</div> <!-- .row -->

	<?php echo $content_bottom; ?>

	<script type="text/javascript"><!--

		$('input[name=\'customer_group_id\']:checked').live('change', function() {
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
					$('#company_id').addClass('required');
				} else {
					$('#company-id-required').hide();
					$('#company_id').removeClass('required');
				}
				
				if (customer_group[this.value]['tax_id_display'] == '1') {
					$('#tax-id-display').show();
				} else {
					$('#tax-id-display').hide();
				}
				
				if (customer_group[this.value]['tax_id_required'] == '1') {
					$('#tax-id-required').show();
					$('#tax_id').addClass('required');
				} else {
					$('#tax-id-required').hide();
					$('#tax_id').removeClass('required');
				}	
			}
		});

		$('input[name=\'customer_group_id\']:checked').trigger('change');
		
	//--></script>

	<script type="text/javascript"><!--
		
		$('select[name=\'country_id\']').bind('change', function() {
			$.ajax({
				url: 'index.php?route=account/register/country&country_id=' + this.value,
				dataType: 'json',
				beforeSend: function() {
					$('select[name=\'country_id\']').after('<span class="wait">&nbsp;<img src="catalog/view/theme/sellegance/images/loading.gif" alt="" /></span>');
				},
				complete: function() {
					$('.wait').remove();
				},			
				success: function(json) {
					if (json['postcode_required'] == '1') {
						$('#postcode-required').show();
						$('#postcode').addClass('required');
					} else {
						$('#postcode-required').hide();
						$('#postcode').removeClass('required');
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
					
					$('select[name=\'zone_id\']').html(html);
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		});

		$('select[name=\'country_id\']').trigger('change');

	//--></script>

	<script type="text/javascript"><!--
		$(document).ready(function() {
			$('.colorbox').colorbox({
				overlayClose: true,
				opacity: 0.5,
				maxHeight: 560,
				maxWidth: 560,
				width:'100%'
			});
		});
	//--></script> 

<?php echo $footer; ?>