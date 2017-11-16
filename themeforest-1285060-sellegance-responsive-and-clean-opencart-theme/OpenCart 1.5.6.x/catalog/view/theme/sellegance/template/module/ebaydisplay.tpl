<?php if($this->config->get('sellegance_featured_carousel') != '') { ?>

	<section id="ebay-products" class="product-slider top-arrows box" <?php if ($this->language->get('direction')=='rtl') echo 'style="direction:ltr;"'?>>

		<div class="contentset center">
			<h4 class="inner"><span><?php echo $heading_title; ?></span></h4>
		</div>

		<div class="flexslider">

			<ul class="slides">

			<?php foreach ($products as $product) {  ?>
				
				<li>
					<div class="inner">

						<?php if ($product['thumb']) { ?>
						<div class="image"><a href="<?php echo $product['href']; ?>" target="_blank"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
						<?php } ?>

						<div class="name"><a href="<?php echo $product['href']; ?>" target="_blank"><?php echo $product['name']; ?></a></div>

						<div class="price">
							<?php echo $product['price']; ?>
							</div>

					</div> <!-- .inner -->
				</li>

			<?php } ?>

			</ul>

			<img src="<?php echo $tracking_pixel; ?>" height="0" width="0" />

	  </div>

	</section> <!-- .product-slider -->

	<script type="text/javascript">

		$(document).ready(function() {
			$('#ebay-products .flexslider').flexslider({
				animation: "slide",
				animationLoop: true,
				itemWidth: 182,
				itemMargin: 0,
				minItems: 1,
				maxItems: 4,
				<?php if($this->config->get('sellegance_carousel_autoplay') == 0) echo "slideshow: false,"; ?>
				slideshowSpeed: 4600
			  });
		});

	</script>

<?php } else { ?>

	<section id="ebay-products" class="box">

		<div class="contentset center">
			<h4 class="inner"><span><?php echo $heading_title; ?></span></h4>
		</div>

		<div class="box-content">

			<div class="product-grid row">
				
				<?php foreach ($products as $product) { ?>

				<div class="grid-box">

					<div class="inner">

						<?php if ($product['thumb']) { ?>
						<div class="image"><a href="<?php echo $product['href']; ?>" target="_blank"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
						<?php } ?>
						<div class="name"><a href="<?php echo $product['href']; ?>" target="_blank"><?php echo $product['name']; ?></a></div>
						<div class="price">
							<?php echo $product['price']; ?>
						</div>     

					</div> <!-- .inner -->

				</div>

				<?php } ?>

				<img src="<?php echo $tracking_pixel; ?>" height="0" width="0" />

			</div>

		</div>

	</section>

<?php } ?>