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

		<?php echo $column_left; ?>

		<section id="maincontent" class="<?php echo $main; ?>" role="main">

			<div class="mainborder">

				<?php if ($column_left || $column_right) { ?>
					<div id="toggle_sidebar"></div>
				<?php } ?>

				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="edit-account" class="form" role="form">
						
					<fieldset class="subheading">
						
						<legend><?php echo $text_your_details; ?></legend>

						<div class="row">
							<div class="form-group col-md-6">
								<label for="firstname"><span class="required">*</span> <?php echo $entry_firstname; ?></label>
								<input type="text" name="firstname" id="firstname" value="<?php echo $firstname; ?>" title="<?php echo $this->language->get('error_firstname'); ?>" class="form-control required" required />
								<?php if ($error_firstname) { ?>
								<span class="error"><?php echo $error_firstname; ?></span>
								<?php } ?>
							</div>

							<div class="form-group col-md-6">
								<label for="lastname"><span class="required">*</span> <?php echo $entry_lastname; ?></label>
								<input type="text" name="lastname" id="lastname" value="<?php echo $lastname; ?>" title="<?php echo $this->language->get('error_lastname'); ?>" class="form-control required" required />
								<?php if ($error_lastname) { ?>
								<span class="error"><?php echo $error_lastname; ?></span>
								<?php } ?>
							</div>
						</div>

						<div class="form-group">
							<label for="email"><span class="required">*</span> <?php echo $entry_email; ?></label>
							<input type="email" name="email" id="email" value="<?php echo $email; ?>"  title="<?php echo $this->language->get('error_email'); ?>" class="form-control required email" required />
							<?php if ($error_email) { ?>
							<span class="error"><?php echo $error_email; ?></span>
							<?php } ?>
						</div>

						<div class="form-group">
							<label for="telephone"><span class="required">*</span> <?php echo $entry_telephone; ?></label>
							<input type="text" name="telephone" id="telephone" value="<?php echo $telephone; ?>" title="<?php echo $this->language->get('error_telephone'); ?>" class="form-control required" required />
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
							<label for="address_1"><span class="required">*</span> <?php echo $entry_address_1; ?></label>
							<input type="text" name="address_1" id="address_1" value="<?php echo $address_1; ?>" title="<?php echo $this->language->get('error_address_1'); ?>" class="required form-control" required />
								<?php if ($error_address_1) { ?>
								<span class="error"><?php echo $error_address_1; ?></span>
								<?php } ?>
						</div>

						<div class="form-group">
							<label for="address_2"><?php echo $entry_address_2; ?></label>
							<input type="text" name="address_2" id="address_2" value="<?php echo $address_2; ?>" class="form-control" />
						</div>

						<div class="row">
							<div class="form-group col-md-6">
								<label for="city">
									<span class="required">*</span> <?php echo $entry_city; ?>
								</label>
								<input type="text" name="city" id="city" value="<?php echo $city; ?>" title="<?php echo $this->language->get('error_city'); ?>" class="required form-control" required />
								<?php if ($error_city) { ?>
								<span class="error"><?php echo $error_city; ?></span>
								<?php } ?>
							</div>

							<div class="form-group col-md-6">
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

							<div class="form-group col-md-6">
								<label for="country_id">
									<span class="required">*</span> <?php echo $entry_country; ?>
								</label>
								<select name="country_id" id="country_id" title="<?php echo $this->language->get('error_country'); ?>" class="required form-control" required >

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

							<div class="form-group col-md-6">
								<label for="zone_id">
									<span class="required">*</span> <?php echo $entry_zone; ?>
								</label>
								<select name="zone_id" id="zone_id" title="<?php echo $this->language->get('error_zone'); ?>" class="required form-control" required>
								</select>
								<?php if ($error_zone) { ?>
								<span class="error"><?php echo $error_zone; ?></span>
								<?php } ?>
							</div>

						</div>

					</fieldset>

					<div class="form-actions buttons">
						<a href="<?php echo $back; ?>" class="button btn btn-default"><span><?php echo $button_back; ?></span></a>
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
				url: 'index.php?route=affiliate/edit/country&country_id=' + this.value,
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
					} else {
						$('#postcode-required').hide();
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

<?php echo $footer; ?>