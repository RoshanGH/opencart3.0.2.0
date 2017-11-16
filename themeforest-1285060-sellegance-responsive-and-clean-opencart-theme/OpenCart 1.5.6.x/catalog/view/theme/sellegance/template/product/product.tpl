<?php echo $header; ?>

<?php echo $content_top; ?>
	<div class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
		<?php } ?>
	</div>

	<header class="page-header">
		<h1><?php echo $heading_title; ?></h1>
	</header>

	<?php 

	$this->language->load('module/sellegance');
	
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

		<section id="maincontent" class="product-info <?php echo $main; ?>" role="main">

			<div class="mainborder">

				<?php if ($column_left || $column_right) { ?>
					<div id="toggle_sidebar"></div>
				<?php } ?>

				<!-- PREVNEXT BUTTONS PLACEHOLDER -->

				<div class="row">

					<div class="col-sm-6">

						<?php if ($thumb || $images) { ?>

							<?php if ($thumb) { ?>

								<div class="image">

								<?php if ($price && $special) { ?>
								<span class="onsale"><?php echo $this->language->get('text_onsale'); ?></span>
								<?php } ?>

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

									<a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="cloud-zoom" id="mainimage" rel="adjustX: 10, adjustY:-4, tint:false,lensOpacity:0.2, zoomWidth:'<?php echo $zwidth ?>', zoomHeight:'<?php echo $zheight; ?>', position:'<?php echo $this->config->get('sellegance_zoom_position'); ?>', showTitle:false"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image" /></a><a href="<?php echo $popup; ?>"id="zoom-image" title=" <?php echo $heading_title; ?>" class="magnificPopup tooltp" rel="magnificPopup"><span><i class="fa fa-search"></i> <?php echo $this->language->get('text_zoom'); ?></span></a>

								<?php } else { ?>

									<a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="magnificPopup" rel="magnificPopup"><img src="<?php echo $thumb; ?>" id="image"  title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>

								<?php } ?>

								</div>

							<?php } ?>

							<?php if ($images) { ?>

								<div class="image-additional">

									<ul>
										<?php if($this->config->get('sellegance_cloud_zoom') == 1) { ?>

										<li><a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="cloud-zoom-gallery" rel="useZoom: 'mainimage', smallImage: '<?php echo $thumb; ?>' "><img src="<?php echo $small; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>

										<?php } ?>

									<?php foreach ($images as $image) { ?>

										<?php if($this->config->get('sellegance_cloud_zoom') == 1) { ?>

											<li><a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="cloud-zoom-gallery" rel="useZoom: 'mainimage', smallImage: '<?php echo $image['thumb']; ?>' "><img src="<?php echo $image['small']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a><a href="<?php echo $image['popup']; ?>" class="magnificPopup" style="display:none" rel="magnificPopup"></a></li>

										<?php } else { 

											if($image['small']) { ?>

												<li><a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="magnificPopup" rel="magnificPopup"><img src="<?php echo $image['small']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>

											<?php } else { ?>

												<li><a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="magnificPopup" rel="magnificPopup"><img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>

											<?php } ?>

										<?php } ?>

									<?php } ?>

									</ul>

								</div>

							<?php } ?>

						<?php } ?> 
					
					</div> <!-- .span6 LEFT BOX-->


					<div class="col-sm-6 rightcol">
						
						<?php if ($price) { ?>

						<div class="price">
							
							<?php echo $text_price; ?>

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

						<?php if ($profiles): ?>
							<div class="option">
								<h4><span class="required">*</span><?php echo $text_payment_profile ?></h4>
								<select name="profile_id" class="form-control input-sm">
									<option value=""><?php echo $text_select; ?></option>
									<?php foreach ($profiles as $profile): ?>
									<option value="<?php echo $profile['profile_id'] ?>"><?php echo $profile['name'] ?></option>
									<?php endforeach; ?>
								</select>
								<div id="profile-description"></div>
							</div>
						<?php endif; ?>

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
											<a id="button-option-<?php echo $option['product_option_id']; ?>" class="button btn btn-success btn-sm"><i class="fa fa-cloud-upload"></i> <?php echo $button_upload; ?></a>
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

								<a onclick="addToWishList('<?php echo $product_id; ?>');" title="<?php echo $button_wishlist; ?>" class="btn btn-default wishlist wishcompare" ><i class="fa fa-heart"></i></a>

								<a onclick="addToCompare('<?php echo $product_id; ?>');" title="<?php echo $button_compare; ?>" class="btn btn-default compare wishcompare"><i class="fa fa-plus"></i></a>

								<?php if ($minimum > 1) { ?>
									<small class="minimum"><?php echo $text_minimum; ?></small>
								<?php } ?>
								</div>
							</div> <!-- .cart -->

						<?php if ($review_status) { ?>

							<div class="review">
								
								<img src="catalog/view/theme/sellegance/images/stars-<?php echo $rating; ?>.png" alt="<?php echo $reviews; ?>" />

								<a onclick="$('a[href=\'#tab-review\']').trigger('click'); $('html, body').animate({scrollTop: $('#tabs').offset().top}, 800);" class="view-revs"><?php echo $reviews; ?></a>

								<a id="add-review-link" class="button btn btn-default btn-xs" onclick="$('a[href=\'#tab-review\']').trigger('click'); $('html, body').animate({scrollTop: $('#add-review').offset().top}, 800);" ><i class="fa fa-caret-down"></i> <?php echo $text_write; ?></a>

							</div>

						<?php } ?>

						<div class="share">

							<?php $url = urlencode($this->config->get('config_url')."index.php?route=product/product&product_id=".$product_id); ?>

							<ul>
								<li><a href="http://www.facebook.com/sharer.php?u=<?php echo $url; ?>" target="_blank" title="Facebook" class="facebook" data-toggle="tooltip"><i class="fa fa-facebook"></i></a></li>
								<li><a href="https://twitter.com/share?url=<?php echo $url; ?>" target="_blank" title="Twitter" class="twitter" data-toggle="tooltip"><i class="fa fa-twitter"></i></a></li>
								<li><a href="https://plus.google.com/share?url=<?php echo $url; ?>" target="_blank" title="Google +" class="google-plus" data-toggle="tooltip" onclick="javascript:window.open(this.href,
										'', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" ><i class="fa fa-google-plus"></i></a></li>
								<li><a href="//pinterest.com/pin/create/button/?url=<?php echo $url; ?>&<?php if ($thumb) {?>media=<?php echo $thumb; ?>&<?php } ?>description=<?php echo strip_tags($heading_title); ?>" target="_blank" title="Pinterest" class="pinterest" data-toggle="tooltip"><i class="fa fa-pinterest"></i></a></li>
								<li><a href="mailto:enteryour@addresshere.com?subject=<?php echo strip_tags($heading_title); ?>&body=<?php echo $this->config->get('config_url'); ?>index.php?route=product/product&product_id=<?php echo $product_id; ?>" class="envelope"  title="<?php echo $this->language->get('text_email_friend'); ?>" data-toggle="tooltip"><i class="fa fa-envelope"></i></a></li>
								<li><a href="<?php echo $this->config->get('config_url'); ?>index.php?route=product/product&product_id=<?php echo $product_id; ?>" class="link"  title="<?php echo $this->language->get('text_get_link'); ?>" data-toggle="tooltip"><i class="fa fa-link"></i></a></li>
							</ul>

						</div>

						<?php if ($tags) { ?>

							<div class="tags">
								<b><?php echo $text_tags; ?></b>
								
								<?php foreach ($tags as $tag) { ?>
									<a href="<?php echo $tag['href']; ?>"><?php echo $tag['tag']; ?></a>
								<?php } ?>
							
							</div>

						<?php } ?>


						<?php if($this->config->get('sellegance_product_details_layout') == 'accordion') { ?>

						<section id="full-info" class="clearfix">

							<div class="panel-group" id="product-details">

							  <div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#product-details" href="#tab-description"><?php echo $tab_description; ?> <span class="expand"></span></a></h4>
										</div>
								<div id="tab-description" class="panel-collapse collapse in">
									<div class="panel-body">
										<?php echo $description; ?>
								  </div>
								</div>
							  </div>

							  <?php if ($attribute_groups) { ?>
							  <div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#product-details" href="#tab-attribute"><?php echo $tab_attribute; ?> <span class="expand"></span></a></h4>
								</div>
								<div id="tab-attribute" class="panel-collapse collapse">
								  <div class="panel-body">
									<table class="table table-bordered attribute">
										<?php foreach ($attribute_groups as $attribute_group) { ?>
										<thead>
											<tr>
												<td colspan="2"><?php echo $attribute_group['name']; ?></td>
											</tr>
										</thead>
										<tbody>
											<?php foreach ($attribute_group['attribute'] as $attribute) { ?>
											<tr>
												<th><?php echo $attribute['name']; ?></th>
												<td><?php echo $attribute['text']; ?></td>
											</tr>
											<?php } ?>
										</tbody>
										<?php } ?>
									</table>
								  </div>
								</div>
							  </div>
							  <?php } ?>

							  <?php if ($review_status) { ?>
							  <div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#product-details" href="#tab-review"><?php echo $tab_review; ?> <span class="expand"></span></a></h4>
								</div>
								<div id="tab-review" class="panel-collapse collapse">
									<div class="panel-body">
										<section id="list-reviews">
											<div id="review"></div>
										</section>
										
										<section id="add-review">

											<div id="review-form" class="form">

												<div class="contentset center" id="review-title">
													<h4 class="inner"><span><?php echo $text_write; ?></span></h4>
												</div>

												<div class="form-group">
													<label><span class="required">*</span> <?php echo $entry_name; ?></label>
													<input type="text" name="name" value="" class="form-control" required />
												</div>

												<div class="form-group">
													<label><span class="required">*</span> <?php echo $entry_review; ?></label>
													<textarea name="text" cols="40" rows="8" class="form-control" required ></textarea>
													<small><?php echo $text_note; ?></small>
												</div>

												<div class="form-group">
													<label><span class="required">*</span> <?php echo $entry_rating; ?></label>
													<span><?php echo $entry_bad; ?></span>
													<input type="radio" name="rating" value="1" />
													<input type="radio" name="rating" value="2" />
													<input type="radio" name="rating" value="3" />
													<input type="radio" name="rating" value="4" />
													<input type="radio" name="rating" value="5" />
													<span><?php echo $entry_good; ?></span>
												</div>

												<div class="form-group">
													<label for="captcha"><b><?php echo $entry_captcha; ?></b></label>
													<input type="text" name="captcha" id="captcha" value="" class="form-control" />
													<br>
													<img src="index.php?route=product/product/captcha" alt="" />
												</div>
												
												<div class="form-actions">
													<a id="button-review" class="button btn btn-default btn-inverse"><span><?php echo $button_continue; ?></span></a>
												</div>

											</div> <!-- #review-form -->

										</section> <!-- #add-review -->
								  </div>
								</div>
							  </div>
							  <?php } ?>

							</div>

						</section>

						<?php } ?>

					</div> <!-- .span6 RIGHT BOX-->

				</div>
				
				 <?php if($this->config->get('sellegance_product_details_layout') == 'tabs') { ?>

				 <section id="full-info" class="clearfix">

					<div id="tabs" class="htabs">
						<a href="#tab-description"><?php echo $tab_description; ?></a>
						<?php if ($attribute_groups) { ?>
						<a href="#tab-attribute"><?php echo $tab_attribute; ?></a>
						<?php } ?>
						<?php if ($review_status) { ?>
						<a href="#tab-review"><?php echo $tab_review; ?></a>
						<?php } ?>
					</div> <!-- #tabs -->
					<div id="tab-description" class="tab-content"><?php echo $description; ?></div> <!-- #tab-description -->
					<?php if ($attribute_groups) { ?>
						<div id="tab-attribute" class="tab-content">
							<section class="product-atrributes">
													
								<table class="table table-striped attribute">

									<?php foreach ($attribute_groups as $attribute_group) { ?>

									<thead>
										<tr>
											<td colspan="2"><?php echo $attribute_group['name']; ?></td>
										</tr>
									</thead>

									<tbody>
										<?php foreach ($attribute_group['attribute'] as $attribute) { ?>
										<tr>
											<th><?php echo $attribute['name']; ?></th>
											<td><?php echo $attribute['text']; ?></td>
										</tr>
										<?php } ?>
									</tbody>

									<?php } ?>

								</table>

							</section>
						</div> <!-- #tab-attribute -->
					<?php } ?>
					<?php if ($review_status) { ?>
						<div id="tab-review" class="tab-content">
							<div class="row">
														
								<section id="review" class="col-sm-12"></section>
								
								<section id="add-review" class="col-sm-11">

									<div id="review-form" class="form">

										<div class="contentset center" id="review-title">
											<h4 class="inner"><span><?php echo $text_write; ?></span></h4>
										</div>

										<div class="form-group">
											<label><span class="required">*</span> <?php echo $entry_name; ?></label>
											<input type="text" name="name" value="" class="form-control" required />
										</div>

										<div class="form-group">
											<label><span class="required">*</span> <?php echo $entry_review; ?></label>
											<textarea name="text" cols="40" rows="8" class="form-control" required ></textarea>
											<small><?php echo $text_note; ?></small>
										</div>

										<div class="form-group">

											<label><span class="required">*</span> <?php echo $entry_rating; ?></label>
												
											<span><?php echo $entry_bad; ?></span>
											<input type="radio" name="rating" value="1" />
											<input type="radio" name="rating" value="2" />
											<input type="radio" name="rating" value="3" />
											<input type="radio" name="rating" value="4" />
											<input type="radio" name="rating" value="5" />
											<span><?php echo $entry_good; ?></span>

										</div>

										<div class="form-group">
											<label for="captcha"><b><?php echo $entry_captcha; ?></b></label>
											<input type="text" name="captcha" id="captcha" value="" class="form-control" />
											<br>
											<img src="index.php?route=product/product/captcha" alt="" />
										</div>
										
										<div class="form-actions">
											<a id="button-review" class="button btn btn-default btn-inverse"><span><?php echo $button_continue; ?></span></a>
										</div>

									</div> <!-- #review-form -->

								</section>

							</div>
						</div> <!-- #tab-review -->
					<?php } ?>

				</section> <!-- #full-info -->

				<?php } ?>

			</div>
			
		</section>

		<?php echo $column_right; ?>

	</div>

	<?php echo $content_bottom; ?>

	<script type="text/javascript"><!--
	$(document).ready(function() {
		$("a[rel^='magnificPopup']").magnificPopup({
		type:'image',
			gallery:{
				enabled:true
			}
		});
	});
	//--></script> 
	

	<script type="text/javascript">

		$('select[name="profile_id"], input[name="quantity"]').change(function(){
			$.ajax({
				url: 'index.php?route=product/product/getRecurringDescription',
				type: 'post',
				data: $('input[name="product_id"], input[name="quantity"], select[name="profile_id"]'),
				dataType: 'json',
				beforeSend: function() {
					$('#profile-description').html('');
				},
				success: function(json) {
					$('.success, .warning, .attention, information, .error').remove();
					
					if (json['success']) {
						$('#profile-description').html(json['success']);
					}	
				}
			});
		});

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
						if (json['error']['profile']) {
							$('select[name="profile_id"]').after('<span class="error">' + json['error']['profile'] + '</span>');
						}
					} 
					
					if (json['success']) {
						
						$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/sellegance/images/close.png" alt="" class="close" /></div>');
							
						$('.success').fadeIn('slow');
						
						$('html, body').animate({ scrollTop: 0 }, 'slow');

						$('.cart-total').html(json['total']); 

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


	<script type="text/javascript">

		$('#review .pagination a').live('click', function() {
		$('#review').fadeOut('slow');
			
		$('#review').load(this.href);
		
		$('#review').fadeIn('slow');
		
		return false;
	});			

	$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

	$('#button-review').bind('click', function() {
		$.ajax({
			url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
			type: 'post',
			dataType: 'json',
			data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
			beforeSend: function() {
				$('.success, .warning').remove();
				$('#button-review').attr('disabled', true);
				$('#review-title').after('<div class="attention"><img src="catalog/view/theme/sellegance/images/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
			},
			complete: function() {
				$('#button-review').attr('disabled', false);
				$('.attention').remove();
			},
			success: function(data) {
				if (data['error']) {
					$('#review-title').after('<div class="warning">' + data['error'] + '</div>');
				}
				
				if (data['success']) {
					$('#review-title').after('<div class="success">' + data['success'] + '</div>');
									
					$('input[name=\'name\']').val('');
					$('textarea[name=\'text\']').val('');
					$('input[name=\'rating\']:checked').attr('checked', '');
					$('input[name=\'captcha\']').val('');
				}
			}
		});
	});

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


<?php echo $footer; ?>