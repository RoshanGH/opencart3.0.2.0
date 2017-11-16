<?php $this->language->load('module/sellegance'); ?>

	<div id="quickViewContent">
		
		<div id="notification"></div>
		
		<section id="quick-maincontent" class="product-info" role="main">
		
			<div class="mainborder">
		
				<div class="row">
		
					<div class="col-sm-6">
		
						<?php if ($thumb || $images) { ?>
		
							<?php if ($thumb) { ?>
		
								<div class="image">
		
								<?php if($this->config->get('sellegance_cloud_zoom') == 1) { 
		
									if($this->config->get('sellegance_zoom_autosize') == 1) {
										$zwidth = 'auto';
										$zheight = 'auto';
									} else {
										$zwidth = $this->config->get('sellegance_zoom_width');
										$zheight = $this->config->get('sellegance_zoom_height');
									}
		
									?>
		
									<!-- image zoom  -->
		
									<a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="cloud-zoom" id='image' rel="adjustX: 10, adjustY:-4, tint:false,lensOpacity:0.2, zoomWidth:'<?php echo $zwidth ?>', zoomHeight:'<?php echo $zheight; ?>', position:'<?php echo $this->config->get('sellegance_zoom_position'); ?>', showTitle:false"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image" /></a>
		
								<?php } else { ?>
		
									<a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="colorbox" rel="colorbox"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
		
								<?php } ?>
		
								</div>
		
							<?php } ?>
		
							<?php if ($images) { ?>
		
								<div class="image-additional">
		
									<ul>
										<?php if($this->config->get('sellegance_cloud_zoom') == 1) { ?>
		
										<li><a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="cloud-zoom-gallery first" rel="useZoom: 'image', smallImage: '<?php echo $thumb; ?>' "><img src="<?php echo $small; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>
		
										<?php } ?>
		
									<?php foreach ($images as $image) { ?>
		
										<?php if($this->config->get('sellegance_cloud_zoom') == 1) { ?>
		
											<li><a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="cloud-zoom-gallery" rel="useZoom: 'image', smallImage: '<?php echo $image['thumb']; ?>' "><img src="<?php echo $image['small']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a><a href="<?php echo $image['popup']; ?>" class="colorbox" style="display:none" rel="colorbox"></a></li>
		
										<?php } else { 
		
											if($image['small']) { ?>
		
												<li><a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="colorbox" rel="colorbox"><img src="<?php echo $image['small']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>
		
											<?php } else { ?>
		
												<li><a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="colorbox" rel="colorbox"><img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>
		
											<?php } ?>
		
										<?php } ?>
		
									<?php } ?>
		
									</ul>
		
								</div>
		
							<?php } ?>
		
						<?php } ?> 
					
					</div> <!-- .span6 LEFT BOX-->
		
		
					<div class="col-sm-6 rightcol">

						<header class="page-header">
							<h1><?php echo $heading_title; ?></h1>
							<a href="index.php?route=product/product&product_id=<?php echo $product_id; ?>" class="button btn btn-default btn-sm more-details"><?php echo $this->language->get('text_more_details'); ?> <i class="fa fa-caret-right"></i></a>
						</header>
		
						<?php if ($price && $special) { ?>
						<div class="onsale"><span><?php echo $this->language->get('text_onsale'); ?></span></div>
						<?php } ?>
						
						<?php if ($price) { ?>
		
						<div class="price">
							
							<?php if (!$special) { ?>
								<span class="price-normal"><?php echo $price; ?></span>
							<?php } else { ?>
								<span class="price-old"><?php echo $price; ?></span> <span class="price-new"><?php echo $special; ?></span>
							<?php } ?>
		
						<?php if ($tax) { ?>
								<div class="price-tax"><?php echo $text_tax; ?> <?php echo $tax; ?></div>
							<?php } ?>
		
							<?php if ($points) { ?>
								<div class="reward"><small><?php echo $text_points; ?> <?php echo $points; ?></small></div>
							<?php } ?>
		
							<?php if ($discounts) { ?>
							<div class="discount">
								<ul>
								<?php foreach ($discounts as $discount) { ?>
									<li><?php echo sprintf($text_discount, $discount['quantity'], "<span>".$discount['price']."</span>"); ?></li>
								<?php } ?>
								</ul>
							</div>
							<?php } ?>

							<div class="stock"><?php echo $stock; ?></div>
		
						</div> <!-- .price -->
		
						<?php } ?>
		
						<div class="description">
		
							<?php if ($manufacturer) { ?>
								<span><?php echo $text_manufacturer; ?></span> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a><br />
							<?php } ?>
							
							<span><?php echo $text_model; ?></span> <?php echo $model; ?><br />
							<?php if ($reward) { ?>
							<span><?php echo $text_reward; ?></span> <?php echo $reward; ?><br />
							<?php } ?>
		
						</div> <!-- .description -->
		
						<?php if ($options) { ?>
						
							<div class="options">

							<h4><?php echo $text_option ?></h4>

								<?php foreach ($options as $option) { ?>

									<!-- Select -->
								
									<?php if ($option['type'] == 'select') { ?>

										<div id="option-<?php echo $option['product_option_id']; ?>" class="control-group">
											
											<label for="option[<?php echo $option['product_option_id']; ?>]">
												<?php if ($option['required']) { ?><span class="required">*</span><?php } ?>
												<?php echo $option['name']; ?>:
											</label>

											<div class="controls">
												<select name="option[<?php echo $option['product_option_id']; ?>]" class="form-control input-sm">
													<option value=""><?php echo $text_select; ?></option>
													
													<?php foreach ($option['option_value'] as $option_value) { ?>
														
														<option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
														
														<?php if ($option_value['price']) { ?>
															(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
														<?php } ?>

														</option>

													<?php } ?>
												</select>
											</div>

										</div>

									<?php } ?>

									<!-- Radio -->

									<?php if ($option['type'] == 'radio') { ?>

										<div id="option-<?php echo $option['product_option_id']; ?>" class="control-group">

											<label class="control-label">
												<?php if ($option['required']) { ?><span class="required">*</span><?php } ?>
												<?php echo $option['name']; ?>:
											</label>

											<?php foreach ($option['option_value'] as $option_value) { ?>						
												
												<label for="option-value-<?php echo $option_value['product_option_value_id']; ?>" class="radio">
													
													<input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />

													<?php echo $option_value['name']; ?>

													<?php if ($option_value['price']) { ?>
														(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
													<?php } ?>

												</label>

											<?php } ?>

										</div>

									<?php } ?>

									<!-- Checkbox -->

									<?php if ($option['type'] == 'checkbox') { ?>

										<div id="option-<?php echo $option['product_option_id']; ?>" class="control-group">

											<label class="control-label">
												<?php if ($option['required']) { ?><span class="required">*</span><?php } ?>
												<?php echo $option['name']; ?>:
											</label>

											<?php foreach ($option['option_value'] as $option_value) { ?>
											
												<label for="option-value-<?php echo $option_value['product_option_value_id']; ?>" class="checkbox">
													<input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
											
													<?php echo $option_value['name']; ?>
											
													<?php if ($option_value['price']) { ?>
														(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
													<?php } ?>
											
												</label>
											
											<?php } ?>
										
										</div>

									<?php } ?>

									<!-- Image -->

									<?php if ($option['type'] == 'image') { ?>

										<div id="option-<?php echo $option['product_option_id']; ?>" class="control-group">

											<label class="control-label">
												<?php if ($option['required']) { ?><span class="required">*</span><?php } ?>
												<?php echo $option['name']; ?>:
											</label>

											<?php foreach ($option['option_value'] as $option_value) { ?>						
												<label for="option-value-<?php echo $option_value['product_option_value_id']; ?>" class="radio option-image">
													<input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
													<img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" />
													<?php echo $option_value['name']; ?>
													<?php if ($option_value['price']) { ?>
														(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
													<?php } ?>
												</label>

											<?php } ?>

										</div>

									<?php } ?>

									<!-- Text field -->

									<?php if ($option['type'] == 'text') { ?>

										<div id="option-<?php echo $option['product_option_id']; ?>" class="form-group">
											<label for="option[<?php echo $option['product_option_id']; ?>]">
												<?php if ($option['required']) { ?><span class="required">*</span><?php } ?>
												<?php echo $option['name']; ?>:
											</label>
											<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>"  class="form-control" />
										</div>

									<?php } ?>

									<!-- Textarea -->

									<?php if ($option['type'] == 'textarea') { ?>

										<div id="option-<?php echo $option['product_option_id']; ?>" class="form-group">
											<label for="option[<?php echo $option['product_option_id']; ?>]">
												<?php if ($option['required']) { ?><span class="required">*</span><?php } ?>
												<?php echo $option['name']; ?>:
											</label>
											<textarea name="option[<?php echo $option['product_option_id']; ?>]" cols="40" rows="5"  class="form-control"><?php echo $option['option_value']; ?></textarea>
										</div>

									<?php } ?>

									<!-- File -->

									<?php if ($option['type'] == 'file') { ?>

										<div id="option-<?php echo $option['product_option_id']; ?>" class="form-group">
											<label for="option[<?php echo $option['product_option_id']; ?>]">
												<?php if ($option['required']) { ?><span class="required">*</span><?php } ?>
												<?php echo $option['name']; ?>:
											</label>
											<a id="button-option-<?php echo $option['product_option_id']; ?>" class="button btn btn-success btn-sm"><i class="fa fa-cloud-upload icon-white"></i> <?php echo $button_upload; ?></a>
											<input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" />
										</div>

									<?php } ?>

									<!-- Date -->

									<?php if ($option['type'] == 'date') { ?>

										<div id="option-<?php echo $option['product_option_id']; ?>" class="form-group">
											<label for="option[<?php echo $option['product_option_id']; ?>]">
												<?php if ($option['required']) { ?><span class="required">*</span><?php } ?>
												<?php echo $option['name']; ?>:
											</label>
											<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="date form-control" />
										</div>

									<?php } ?>

									<!-- Date time -->

									<?php if ($option['type'] == 'datetime') { ?>

										<div id="option-<?php echo $option['product_option_id']; ?>" class="form-group">
											<label for="option[<?php echo $option['product_option_id']; ?>]">
												<?php if ($option['required']) { ?><span class="required">*</span><?php } ?>
												<?php echo $option['name']; ?>:
											</label>
											<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="datetime form-control" />
										</div>

									<?php } ?>

									<!-- Time -->

									<?php if ($option['type'] == 'time') { ?>

										<div id="option-<?php echo $option['product_option_id']; ?>" class="form-group">

											<label for="option[<?php echo $option['product_option_id']; ?>]">
												<?php if ($option['required']) { ?><span class="required">*</span><?php } ?>
												<?php echo $option['name']; ?>:
											</label>
											<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="time form-control" />

										</div>

									<?php } ?>

								<?php } ?>

							</div> <!-- .options -->

						<?php } ?>
		
							<div class="cart">
							<div>
								<div class="input-qty">
									<div class="qty-minus" onclick="if ($(this).parent('.input-qty').find('#qty-input').val()>1) { $(this).parent('.input-qty').find('#qty-input').val(parseInt($(this).parent('.input-qty').find('#qty-input').val())-1); }">-</div>
										<div class="qty-input-div">
											<input id="qty-input"  type="text" name="quantity" value="<?php echo $minimum; ?>" class="form-control input-sm" />
										</div>
									<div class="qty-plus" onclick="$(this).parent('.input-qty').find('#qty-input').val(parseInt($(this).parent('.input-qty').find('#qty-input').val())+1);">+</div>
								</div>
								
								<input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
								
								<input type="button" value="<?php echo $button_cart; ?>" id="button-cart" class="button btn btn-default" />
								
								<?php if ($minimum > 1) { ?>
									<small class="minimum"><?php echo $text_minimum; ?></small>
								<?php } ?>
							</div>
							</div> <!-- .cart -->
		
						<div class="links">
							<span class="wishlist"><a onclick="addToWishList('<?php echo $product_id; ?>');" title="<?php echo $button_wishlist; ?>" class="tooltp" ><i class="fa fa-heart"></i> <?php echo $button_wishlist; ?></a></span>
								<span class="compare"><a onclick="addToCompare('<?php echo $product_id; ?>');" title="<?php echo $button_compare; ?>" class="tooltp"><i class="fa fa-plus"></i> <?php echo $button_compare; ?></a></span>
							</div>
		
						<?php if ($tags) { ?>
		
							<div class="tags">
								<b><?php echo $text_tags; ?></b>
								
								<?php foreach ($tags as $tag) { ?>
									<a href="<?php echo $tag['href']; ?>"><?php echo $tag['tag']; ?></a>
								<?php } ?>
							
							</div>
		
						<?php } ?>
		
					</div> <!-- .col-sm-6 RIGHT BOX-->
		
				</div>
		
				 <section id="full-info" class="clearfix">
		
				 <?php echo $description; ?>
		
				</section>
		
		
			</div>
			
		</section>

	</div>
	

	<script type="text/javascript">

		$('#button-cart').bind('click', function() {
			$.ajax({
				url: 'index.php?route=checkout/cart/add',
				type: 'post',
				data: $('.product-info input[type=\'text\'], .product-info input[type=\'hidden\'], .product-info input[type=\'radio\']:checked, .product-info input[type=\'checkbox\']:checked, .product-info select, .product-info textarea'),
				dataType: 'json',
				success: function(json) {
					$('.success, .warning, .attention, information, .error').remove();
					
					if (json['error']) {
						if (json['error']['option']) {
							for (i in json['error']['option']) {
								$('#option-' + i).after('<span class="error">' + json['error']['option'][i] + '</span>');
							}
						}
					} 
					
					if (json['success']) {

						$('#dialog').dialog("close");
						
						ajaxLoading();
						
						setTimeout(function(){
						$('#loadingdialog').dialog("close");
						$.colorbox.close();
						
						$('#cart-total').html(json['total']);
						//minicartDetailPopup();
						$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/sellegance/images/close.png" alt="" class="close" /></div>');
						$('.success').fadeIn('slow');
						$('html, body').animate({ scrollTop: 0 }, 'slow'); 
						}, 1000); 
						
						setTimeout(function(){$('.success').fadeOut('slow');},10000);



					} 
				}
			});
		});

	</script>


	<?php if ($options) { ?>

		<script type="text/javascript" src="catalog/view/javascript/jquery/ajaxupload.js"></script>

		<?php foreach ($options as $option) { ?>

			<?php if ($option['type'] == 'file') { ?>

				<script type="text/javascript">

					new AjaxUpload('#button-option-<?php echo $option['product_option_id']; ?>', {
						action: 'index.php?route=product/product/upload',
						name: 'file',
						autoSubmit: true,
						responseType: 'json',
						onSubmit: function(file, extension) {
							$('#button-option-<?php echo $option['product_option_id']; ?>').after('<img src="catalog/view/theme/sellegance/images/loading.gif" class="loading" style="padding-left: 5px;" />');
						},
						onComplete: function(file, json) {
							$('.error').remove();
							
							if (json.success) {
								alert(json.success);
								
								$('input[name=\'option[<?php echo $option['product_option_id']; ?>]\']').attr('value', json.file);
							}
							
							if (json.error) {
								$('#option-<?php echo $option['product_option_id']; ?>').after('<span class="error">' + json.error + '</span>');
							}
							
							$('.loading').remove(); 
						}
					});

				</script>

			<?php } ?>

		<?php } ?>

	<?php } ?>

	</script> 

	<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script>

	<script type="text/javascript">
		
		$(document).ready(function() {
			
			if ($.browser.msie && $.browser.version == 6) {
				$('.date, .datetime, .time').bgIframe();
			}

			$('.date').datepicker({dateFormat: 'yy-mm-dd'});
			$('.datetime').datetimepicker({
				dateFormat: 'yy-mm-dd',
				timeFormat: 'h:m'
			});
			$('.time').timepicker({timeFormat: 'h:m'});
		
		});

	</script> 
