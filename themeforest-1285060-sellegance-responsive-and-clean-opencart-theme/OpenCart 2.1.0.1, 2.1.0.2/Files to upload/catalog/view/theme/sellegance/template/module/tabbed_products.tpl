<?php global $language; global $config; ?>

<div class="tabbed-products">
	
	<?php $tabs = 0; ?>
	
	<ul id="tabs-<?php echo $module; ?>" class="nav nav-pills">

		<?php if(isset($featured_products) && $featured_mode!='disabled') { $tabs++; ?>
			<li <?php echo ($tabs==1) ? 'class="active"' : ''; ?> ><a id="#tab-featured-<?php echo $module; ?>-link" href="#tab-featured-<?php echo $module; ?>" data-toggle="tab"><?php echo $tab_featured; ?></a></li>
		<?php } ?>

		<?php if(isset($latest_products) && $latest_mode!='disabled') { $tabs++; ?>
			<li <?php echo ($tabs==1) ? 'class="active"' : ''; ?> ><a id="#tab-latest-<?php echo $module; ?>-link" href="#tab-latest-<?php echo $module; ?>" data-toggle="tab"><?php echo $tab_latest; ?></a></li>
		<?php } ?>

		<?php if(isset($bestseller_products) && $bestseller_mode!='disabled') { $tabs++; ?>
			<li <?php echo ($tabs==1) ? 'class="active"' : ''; ?> ><a id="#tab-bestseller-<?php echo $module; ?>-link" href="#tab-bestseller-<?php echo $module; ?>" data-toggle="tab"><?php echo $tab_bestseller; ?></a></li>
		<?php } ?>

		<?php if(isset($special_products) && $special_mode!='disabled') { $tabs++; ?>
			<li <?php echo ($tabs==1) ? 'class="active"' : ''; ?> ><a id="#tab-special-<?php echo $module; ?>-link" href="#tab-special-<?php echo $module; ?>" data-toggle="tab"><?php echo $tab_special; ?></a></li>
		<?php } ?>

	</ul>

	<div class="tab-content">

	<?php 
			
			$tabs = 0;

			for ($t=1; $t <= 4; $t++) { 
				
				$disabled = 'true';
				$carousel = 1; 
				
				switch ($t) {
					
					case '1':
						if(isset($featured_products) && $featured_mode!='disabled') {
							$products = $featured_products;
							$tabID = 'tab-featured-';
							($featured_mode=='carousel') ? $carousel=1 : $carousel=0;
							$disabled='false';
							$tabs++;
						}
						break;

					case '2':
						if(isset($latest_products) && $latest_mode!='disabled') {
							$products = $latest_products;
							$tabID = 'tab-latest-';
							($latest_mode=='carousel') ? $carousel=1 : $carousel=0;
							$disabled='false';
							$tabs++;
						}
						break;

					case '3':
						if(isset($bestseller_products) && $bestseller_mode!='disabled') {
							$products = $bestseller_products;
							$tabID = 'tab-bestseller-';
							($bestseller_mode=='carousel') ? $carousel=1 : $carousel=0;
							$disabled='false';
							$tabs++;
						}
						break;
					case '4':
						if(isset($special_products) && $special_mode!='disabled') {
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

				<?php 
				if($carousel==1) {
					$class1= "product-slider top-arrows";
					$class2= "owl-carousel";
					$class3= "item";
				} else {
					$class1= "box";
					$class2= "row";
					$class3= "product-layout col-lg-3 col-md-3 col-sm-6 col-xs-12";
				}
				?>

				<?php if ($disabled=='false') { ?>

					<div id="<?php echo $tabID.$module; ?>" class="tab-pane active <?php echo ($tabs>1) ? 'secondary' : ''; ?>">

						<div id="<?php echo $tabID.$module; ?>_carousel" class="<?php echo $class1; ?>" <?php if ($language->get('direction')=='rtl') echo 'style="direction:rtl;"'?>>

									<div class="<?php echo $class2; ?>">

										<?php foreach ($products as $product) {  ?>
											
											<div class="<?php echo $class3; ?>">
												
												<div class="product-thumb transition">

													<?php if ($product['price'] && $product['special']) { ?>
													<span class="onsale"><?php echo $text_onsale; ?></span>
													<?php } ?>

													<div class="image hover_fade_in_back">
													<div class="quickview"><a id="qv<?php echo $product['product_id']; ?>" class="button btn btn-link" rel="mp-quickview" href="index.php?route=product/quickview&product_id=<?php echo $product['product_id']; ?>" ><i class="fa fa-plus-circle"></i><?php echo $text_quickview; ?></a></div>
													
													<?php if ( $product['thumb'] && isset($product['thumb_swap']) && $config->get('sellegance_rollover_images')==1) { ?>
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
													
													<div class="caption">

														<h4 class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>

														<?php if ($product['price']) { ?>
														<div class="price">
														<?php if (!$product['special']) { ?>
															<?php echo $product['price']; ?>
														<?php } else { ?>
															<span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
														<?php } ?>
														</div>
														<?php } ?>

														<?php if ($product['rating']) { ?>
														<div class="rating">
															<?php for ($i = 1; $i <= 5; $i++) { ?>
															<?php if ($product['rating'] < $i) { ?>
															<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
															<?php } else { ?>
															<span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
															<?php } ?>
															<?php } ?>
														</div>
														<?php } ?>

														<div class="cart">
								<div class="btn-group">
								<button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');" class="btn btn-sm btn-cart"><?php echo $button_cart; ?></button>
								<button type="button" data-toggle="tooltip" class="btn btn-link btn-sm wishlist" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart-o"></i></button>
								<button type="button" data-toggle="tooltip" class="btn btn-link btn-sm compare" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
														</div>
							</div>

													</div> <!-- .caption -->

												</div> <!-- .product-thumb -->
																	
											</div> <!-- .item, .product-layout -->

										<?php } ?>

									</div><!-- .owl-carousel, .box -->

							</div>

							<script type="text/javascript">

								$(window).load(function() {

									<?php if ($carousel == 1 ) { ?>

									$('#<?php echo $tabID.$module; ?>_carousel .owl-carousel').owlCarousel({
										items: 4,
										itemsMobile:[479,2],
										<?php if($config->get('sellegance_carousel_autoplay') == 1) echo "autoPlay: 3000,"; ?>
										navigation: true,
										navigationText: ['<i class="fa fa-angle-left fa-5x"></i>', '<i class="fa fa-angle-right fa-5x"></i>'],
										pagination: true,
										loop:true,
										afterInit: function(){
											if ($('#<?php echo $tabID.$module; ?>').hasClass('secondary')) {
												$('#<?php echo $tabID.$module; ?>').removeClass('active');
											}
										}
									});

									<?php } else { ?>
										
										if ($('#<?php echo $tabID.$module; ?>').hasClass('secondary')) {
											$('#<?php echo $tabID.$module; ?>').removeClass('active');
										}

									<?php } ?> <!-- if $carousel -->

								});

							</script>
							
					</div>

				<?php } ?> <!-- if $disabled -->

		<?php } ?>

	</div>

</div>