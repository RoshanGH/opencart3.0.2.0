<div class="tabbed-products">
	
	<?php $this->language->load('module/sellegance'); ?>		

	<?php $tabs = 0; ?>
	
	<ul id="tabs-<?php echo $module; ?>" class="nav nav-tabs">

		<?php if($featured_products && $featured_mode!='disabled') { $tabs++; ?>
			<li <?php echo ($tabs==1) ? 'class="active"' : ''; ?> ><a id="#tab-featured-<?php echo $module; ?>-link" href="#tab-featured-<?php echo $module; ?>" data-toggle="tab"><?php echo $tab_featured; ?></a></li>
		<?php } ?>

		<?php if($latest_products && $latest_mode!='disabled') { $tabs++; ?>
			<li <?php echo ($tabs==1) ? 'class="active"' : ''; ?> ><a id="#tab-latest-<?php echo $module; ?>-link" href="#tab-latest-<?php echo $module; ?>" data-toggle="tab"><?php echo $tab_latest; ?></a></li>
		<?php } ?>

		<?php if($bestseller_products && $bestseller_mode!='disabled') { $tabs++; ?>
			<li <?php echo ($tabs==1) ? 'class="active"' : ''; ?> ><a id="#tab-bestseller-<?php echo $module; ?>-link" href="#tab-bestseller-<?php echo $module; ?>" data-toggle="tab"><?php echo $tab_bestseller; ?></a></li>
		<?php } ?>

		<?php if($special_products && $special_mode!='disabled') { $tabs++; ?>
			<li <?php echo ($tabs==1) ? 'class="active"' : ''; ?> ><a id="#tab-special-<?php echo $module; ?>-link" href="#tab-special-<?php echo $module; ?>" data-toggle="tab"><?php echo $tab_special; ?></a></li>
		<?php } ?>

	</ul>

	<div class="tab-content">

	<?php 
			
			$tabs = 0;

			for ($i=1; $i <= 4; $i++) { 
				
				$disabled = 'true';
				
				switch ($i) {
					
					case '1':
						if($featured_products && $featured_mode!='disabled') {
							$products = $featured_products;
							$tabID = 'tab-featured-';
							($featured_mode=='carousel') ? $carousel=1 : $carousel=0;
							$disabled='false';
							$tabs++;
						}
						break;

					case '2':
						if($latest_products && $latest_mode!='disabled') {
							$products = $latest_products;
							$tabID = 'tab-latest-';
							($latest_mode=='carousel') ? $carousel=1 : $carousel=0;
							$disabled='false';
							$tabs++;
						}
						break;

					case '3':
						if($bestseller_products && $bestseller_mode!='disabled') {
							$products = $bestseller_products;
							$tabID = 'tab-bestseller-';
							($bestseller_mode=='carousel') ? $carousel=1 : $carousel=0;
							$disabled='false';
							$tabs++;
						}
						break;
					case '4':
						if($special_products && $special_mode!='disabled') {
							$products = $special_products;
							$tabID = 'tab-special-';
							($special_mode=='carousel') ? $carousel=1 : $carousel=0;
							$disabled='false';
							$tabs++;
						}
						break;
					default:
						break;
				} ?>

				

				<?php if ($disabled=='false') { ?>

					<div id="<?php echo $tabID.$module; ?>" class="tab-pane active <?php echo ($tabs>1) ? 'secondary' : ''; ?>">
						
						<?php if ($carousel == 1 ) { ?>

							<div id="<?php echo $tabID.$module; ?>_carousel" class="product-slider" <?php if ($this->language->get('direction')=='rtl') echo 'style="direction:ltr;"'?>>

								<div class="flexslider">

									<ul class="slides">

									<?php foreach ($products as $product) {  ?>
										
										<li>
											<div class="inner">

												<?php if ($product['price'] && $product['special']) { ?>
												<span class="onsale"><?php echo $this->language->get('text_onsale'); ?></span>
												<?php } ?>

													<div class="image hover_fade_in_back">
													<?php if ( $product['thumb'] && isset($product['thumb_swap']) && $this->config->get('sellegance_rollover_images')==1) { ?>
														<div class="front-image">
															<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>"/></a>
														</div>
														<div class="back-image">
															<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb_swap']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>"/></a>
														</div>
													<?php } else if ($product['thumb']) { ?>
														<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a>
													<?php } ?>
													</div>

													<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>

													<?php if ($product['price']) { ?>
													<div class="price">
													<?php if (!$product['special']) { ?>
														<?php echo $product['price']; ?>
													<?php } else { ?>
														<span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
													<?php } ?>
													</div>
													<?php } ?>

												<div class="cart"><input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button btn btn-default" /></div>

													<?php if ($product['rating']) { ?>
												<div class="rating"><img src="catalog/view/theme/sellegance/images/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
													<?php } ?>

											</div> <!-- .inner -->
										</li>

									<?php } ?>

									</ul>

								</div> <!-- .flexslider -->

							</div>

							<script type="text/javascript">

								$(window).load(function() {

									$('#<?php echo $tabID.$module; ?>_carousel .flexslider').flexslider({
										animation: "slide",
										animationLoop: true,
										itemWidth: 182,
										itemMargin: 10,
										minItems: 2,
										maxItems: 5,
										slideshow: true,
										slideshowSpeed: 4600,
										directionNav: true,
										start: function(){
											if ($('#<?php echo $tabID.$module; ?>').hasClass('secondary')) {
												$('#<?php echo $tabID.$module; ?>').removeClass('active');
											}
										}
									  });
								});

							</script>

						<?php } else { ?>

							<div class="product-box">

								<?php foreach ($products as $product) { ?>

								<div class="grid-box">

									<div class="inner">

										<?php if ($product['price'] && $product['special']) { ?>
										<span class="onsale"><?php echo $this->language->get('text_onsale'); ?></span>
										<?php } ?>

											<div class="image hover_fade_in_back">
											<?php if ( $product['thumb'] && isset($product['thumb_swap']) && $this->config->get('sellegance_rollover_images')==1) { ?>
												<div class="front-image">
													<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>"/></a>
												</div>
												<div class="back-image">
													<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb_swap']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>"/></a>
												</div>
											<?php } else if ($product['thumb']) { ?>
												<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a>
											<?php } ?>
											</div>

											<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>						

											<?php if ($product['price']) { ?>
											<div class="price">
											<?php if (!$product['special']) { ?>
												<?php echo $product['price']; ?>
											<?php } else { ?>
												<span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
											<?php } ?>
											</div>
											<?php } ?>

										<div class="cart"><input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button btn btn-default" /></div>

											<?php if ($product['rating']) { ?>
										<div class="rating"><img src="catalog/view/theme/sellegance/images/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
										<?php } ?>

									</div> <!-- .inner -->

								</div>

								<?php } ?>

							</div>

							<script type="text/javascript">

								$(window).load(function() {
									if ($('#<?php echo $tabID.$module; ?>').hasClass('secondary')) {
										$('#<?php echo $tabID.$module; ?>').removeClass('active');
									}
								});

							</script>

						<?php } ?>

					</div>

				<?php } ?>

		<?php } ?>

	</div>

</div>