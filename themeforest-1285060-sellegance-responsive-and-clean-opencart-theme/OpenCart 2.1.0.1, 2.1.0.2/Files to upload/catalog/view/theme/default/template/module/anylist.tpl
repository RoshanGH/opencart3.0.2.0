<?php if (count($products)>0) { ?>
	<?php echo ($titlelink) ? '<a href="'.$titlelink.'">' : ''; ?>
	<h2><?php echo $heading_title; ?></h2>
	<?php echo ($titlelink) ? '</a>' : ''; ?>

	<div class="row product-layout">
		<?php foreach ($products as $product) { ?>
			  <div class="AnyListDiv">
			    <div class="product-thumb transition">
                    <?php if ($product['thumb']) { ?>
                    <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
                    <?php } ?>
                    <div>
                        <div class="caption">
                            <h4 style="height: 40px; overflow: hidden;"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
                            <div style="height: 120px; overflow: auto;"><?php echo $product['description']; ?></div>

                            <?php if ($product['price']) { ?>
                            	<p class="price">
                            	  <?php if (!$product['special']) { ?>
                            	        <?php     echo $product['price']; ?>
                            	  <?php } else { ?>
                            	        <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
                            	  <?php } ?>
                                  <?php if ($product['tax']) { ?>
                                     <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                                  <?php } ?>
                                  
                            	</p>
                            <?php } ?>
                            <?php if ($product['rating']) { ?>
                            <div class="rating"><img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
                            <?php } ?>
                        </div>
                        <div class="button-group">
                            <button class="btn-primary" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
                            <button class="btn-wl" type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
                            <button class="btn-wl" type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
                        </div>
                    </div>
                </div>  
            </div>
        <?php } ?>
	</div>
	
	
	<script type="text/javascript">
		$(document).ready(
			function() {
				$('.AnyListDiv').each( 
					function(index) {
						var divclass = 'col-lg-12 col-md-12'; 
						if (($(this).closest('#column-right').length==0) && ($(this).closest('#column-left').length==0)) { // if we are in content area check the layout
							var cols = $('#column-right, #column-left').length; // how many columns we have
							// 2 columns - left, right and content - smallest content area - 2 boxes on row
							if (cols==2) 
								divclass = 'col-lg-6 col-md-6 col-sm-12 col-xs-12';
									
							// 1 column - left or right and content - 3 boxes on row	
							if (cols==1) 	
								divclass = 'col-lg-4 col-md-4 col-sm-8 col-xs-12';	
								
							// only content - largest content area - 4 boxes on row
							if (cols==0) 
								divclass = 'col-lg-3 col-md-3 col-sm-2 col-xs-12';	
						}
						$(this).addClass(divclass);
					}
				)
			}
		);
	</script>
	
<?php } ?>