<?php 
global $language; global $config;

if($config->get('sellegance_ebay_carousel') != '') {
	$class1= "product-slider top-arrows";
	$class2= "owl-carousel";
	$class3= "item";
} else {
	$class1= "box";
	$class2= "row";
	$class3= "product-layout col-lg-3 col-md-3 col-sm-6 col-xs-12";
}
?>

	<div id="ebay-products" class="<?php echo $class1; ?>" <?php if ($language->get('direction')=='rtl') echo 'style="direction:rtl;"'?>>

    <div class="contentset center">
      <h4 class="inner"><span><?php echo $heading_title; ?></span></h4>
    </div>

		<div class="<?php echo $class2; ?>">

      <?php foreach ($products as $product) {  ?>
        
				<div class="<?php echo $class3; ?>">

					<div class="product-thumb transition">


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
							<div class="price"><?php echo $product['price']; ?></div>

						</div> <!-- .caption -->

					</div> <!-- .product-thumb -->
        
				</div> <!-- .item, .product-layout -->

      <?php } ?>

		</div><!-- .owl-carousel -->
		<img src="<?php echo $tracking_pixel; ?>" height="0" width="0" />
  </div>

	<?php if($config->get('sellegance_ebay_carousel') != '') { ?>

  <script type="text/javascript">
    $(document).ready(function() {
			$('#ebay-products .owl-carousel').owlCarousel({
        items: 4,
				<?php if($config->get('sellegance_carousel_autoplay') == 1) echo "autoPlay: 3000,"; ?>
        navigation: true,
        navigationText: ['<i class="fa fa-angle-left fa-5x"></i>', '<i class="fa fa-angle-right fa-5x"></i>'],
        pagination: true,
        loop:true
      });
    });
  </script>
<?php } ?>