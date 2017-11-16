<?php echo $header; ?>

	<?php echo $content_top; ?>

	<div class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
			<?php echo $breadcrumb['separator']; ?>
			<a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
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

		<?php echo $column_left ?>

		<section id="maincontent" class="<?php echo $main; ?>" role="main">

			<div class="mainborder">

				<?php if ($column_left || $column_right) { ?>
					<div id="toggle_sidebar"></div>
				<?php } ?>
		
				<p><?php echo $text_account_already; ?></p>

				<p><?php echo $text_signup; ?></p>

				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="register-form" class="form">

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

						<div class="form-group">
							<label for="website"><?php echo $entry_website; ?></label>
							<input type="text" name="website" id="website" value="<?php echo $website; ?>" class="form-control" />
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

						<legend><?php echo $text_payment; ?></legend>

						<div class="form-group">
							<label for="tax"><?php echo $entry_tax; ?></label>
							<div class="controls">
								<input type="text" name="tax" id="tax" value="<?php echo $tax; ?>" class="form-control" />
							</div>
						</div>

						<div class="row">
							<div class="form-group col-sm-4">
							
								<label><?php echo $entry_payment; ?></label>
							
								<div class="controls">
									<div class="radio">
									<label>
										<?php if ($payment == 'cheque') { ?>
											<input type="radio" name="payment" value="cheque" id="cheque" checked="checked" />
										<?php } else { ?>
											<input type="radio" name="payment" value="cheque" id="cheque" />
										<?php } ?>
										<?php echo $text_cheque; ?>
									</label>
									</div>
									<div class="radio">
									<label>
										<?php if ($payment == 'paypal') { ?>
											<input type="radio" name="payment" value="paypal" id="paypal" checked="checked" />
										<?php } else { ?>
											<input type="radio" name="payment" value="paypal" id="paypal" />
										<?php } ?>
										<?php echo $text_paypal; ?>
									</label>
									</div>
									<div class="radio">
									<label>
										<?php if ($payment == 'bank') { ?>
											<input type="radio" name="payment" value="bank" id="bank" checked="checked" />
										<?php } else { ?>
											<input type="radio" name="payment" value="bank" id="bank" />
										<?php } ?>
										<?php echo $text_bank; ?>
									</label>
							
							</div>
								</div>
							</div>
							
							<div class="form-group payment col-sm-8" id="payment-cheque">
								<label for="cheque"><?php echo $entry_cheque; ?></label>
								<input type="text" name="cheque" value="<?php echo $cheque; ?>" class="form-control" />
							</div>
							
							<div class="form-group payment col-sm-8" id="payment-paypal">
								<label for="paypal"><?php echo $entry_paypal; ?></label>
								<input type="text" name="paypal" value="<?php echo $paypal; ?>" class="form-control" />
							</div>
							
							<div class="form-group payment col-sm-8" id="payment-bank">
								<div class="form-group">
									<label for="bank_name"><?php echo $entry_bank_name; ?></label>
									<input type="text" name="bank_name" id="bank_name" value="<?php echo $bank_name; ?>" class="form-control" />
								</div>
								<div class="form-group">
									<label for="bank_branch_number"><?php echo $entry_bank_branch_number; ?></label>
									<input type="text" name="bank_branch_number" id="bank_branch_number" value="<?php echo $bank_branch_number; ?>" class="form-control" />
								</div>
								<div class="form-group">
									<label for="bank_swift_code"><?php echo $entry_bank_swift_code; ?></label>
									<input type="text" name="bank_swift_code" id="bank_swift_code" value="<?php echo $bank_swift_code; ?>" class="form-control" />
								</div>
								<div class="form-group">
									<label for="bank_account_name"><?php echo $entry_bank_account_name; ?></label>
									<input type="text" name="bank_account_name" id="bank_account_name" value="<?php echo $bank_account_name; ?>" class="form-control" />
								</div>
								<div class="form-group">
									<label for="bank_account_number"><?php echo $entry_bank_account_number; ?></label>
									<input type="text" name="bank_account_number" id="bank_account_number" value="<?php echo $bank_account_number; ?>" class="form-control" />
								</div>
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
								<input type="password" name="password" id="password" value="<?php echo $password; ?>" title="<?php echo $this->language->get('error_password'); ?>" class="password form-control"  />
								<?php if ($error_password) { ?>
									<span class="error"><?php echo $error_password; ?></span>
								<?php } ?>
							</div>
							
							<div class="form-group col-sm-6">
								<label for="confirm">
									<span class="required">*</span> <?php echo $entry_confirm; ?>
								</label>
								<input type="password" name="confirm" id="confirm" value="<?php echo $confirm; ?>"  title="<?php echo $this->language->get('error_password'); ?>" class="password form-control" />
								<?php if ($error_confirm) { ?>
									<span class="error"><?php echo $error_confirm; ?></span>
								<?php } ?>
							</div>
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
	
		$('select[name=\'country_id\']').bind('change', function() {
			
			$.ajax({
				url: 'index.php?route=affiliate/register/country&country_id=' + this.value,
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

		$('input[name=\'payment\']').bind('change', function() {
			$('.payment').hide();
			
			$('#payment-' + this.value).show();
		});

		$('input[name=\'payment\']:checked').trigger('change');

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