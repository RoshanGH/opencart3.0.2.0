<script type="text/javascript">
	if (typeof OC == 'undefined') OC = { };
	OC.Countdown = {
		TEXT_YEARS 		: '<?php echo $text_years ?>',
		TEXT_MONTHS 	: '<?php echo $text_months ?>',
		TEXT_WEEKS 		: '<?php echo $text_weeks ?>',
		TEXT_DAYS 		: '<?php echo $text_days ?>',
		TEXT_HOURS 		: '<?php echo $text_hours ?>',
		TEXT_MINUTES 	: '<?php echo $text_minutes ?>',
		TEXT_SECONDS 	: '<?php echo $text_seconds ?>'
	};
</script>
<script type="text/javascript" src="catalog/view/javascript/jquery.countdown.js"></script>

<div class="countdown_deals">

	<div class="contentset center">
		<h4 class="inner"><span><i class="fa fa-gift"></i> <?php echo $title; ?></span></h4>
	</div>

	<?php if($products): ?>

		<div class="countdown-inner">
	
				<?php foreach ($products as $product) : ?>
			
					<div class="item">

						<div class="product-thumb transition">

							<?php if ($product['orgprice'] && $product['special']) { ?>
							<span class="onsale"><?php echo $text_onsale; ?></span>
							<?php } ?>

							<div class="image hover_fade_in_back">
								<div class="quickview"><a id="qv<?php echo $product['product_id']; ?>" class="button btn btn-link" rel="mp-quickview" href="index.php?route=product/quickview&product_id=<?php echo $product['product_id']; ?>" ><i class="fa fa-plus-circle"></i><?php echo $text_quickview; ?></a></div>
								
								<?php if ( $product['thumb'] && isset($product['thumb_swap']) && $sellegance_rollover_images==1) { ?>
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

								<div class="description"><?php echo $product['description']; ?></div>

								<?php if ($product['orgprice']) { ?>
									<?php if (!$product['special']) { ?>
										<div class="price-box">
											<span class="regular-price">
												<span class="price"><?php echo $product['orgprice']; ?></span>
											</span>
										</div>
									<?php } else { ?>
										<div class="price-box">
											<span class="price-old"><?php echo $product['orgprice']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
										</div>
									<?php } ?>
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
									<button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');" class="btn btn-link"><?php echo $button_cart; ?></button>
								</div>

							</div> <!-- .caption -->
						
						<?php if(strtotime($product['date_end'])) { ?>
							<div id="Countdown<?php echo $product['product_id']?>" class="box-timer"></div>

							<script type="text/javascript">

								$(function () {
									var austDay = new Date();
									austDay = new Date(austDay.getFullYear() + 1, 1 - 1, 26);
									$('#Countdown<?php echo $product['product_id'];?>').countdown({
										until: new Date(
											<?php echo date("Y",strtotime($product['date_end']))?>,
											<?php echo date("m",strtotime($product['date_end']))?> -1, 
											<?php echo date("d",strtotime($product['date_end']))?>,
											<?php echo date("H",strtotime($product['date_end']))?>,
											<?php echo date("i",strtotime($product['date_end']))?>, 
											<?php echo rand(0,59) ?>
											),
										onExpiry: liftOff 
									});
									function liftOff() {
										$('#Countdown<?php echo $product['product_id'];?>').parent().addClass ('hide_cart');
									}
									/*$('#Countdown<?php echo $product['product_id'];?>').countdown('pause');*/
								});
							</script>
						<?php } ?>

						</div>
				
					</div>

				<?php endforeach;  ?>

		</div>

	<?php else: ?>

		<p><?php echo $text_empty; ?></p>

	<?php endif; ?>

</div>

<script type="text/javascript">
	$('.countdown-inner').owlCarousel({
		autoPlay : <?php echo ($config_slide['autoplay']) ? 'true' : 'false'; ?>,
		items : <?php echo ($config_slide['items']) ? $config_slide['items'] : 4; ?>,
		itemsMobile:[479,2],
		slideSpeed : <?php echo ($config_slide['f_speed']) ? $config_slide['f_speed'] : 3000; ?>,
		navigation: true,
		navigationText: ['<i class="fa fa-angle-left fa-5x"></i>', '<i class="fa fa-angle-right fa-5x"></i>'],
		stopOnHover : true,
		scrollPerPage:true,
	});
</script>