<div id="featured_categories<?php echo $module; ?>" class="category-slider top-arrows">
	
	<div class="contentset center">
		<h4 class="inner"><span><?php echo $heading_title; ?></span></h4>
	</div>

	<div class="owl-carousel">
		<?php foreach ($categories as $category) { ?>
		<div class="item">
			<div class="inner product-thumb">
				<div class="image">

					<div class="quickview"><a class="btn btn-link btn-quickview" title="" href="<?php echo $category['href']; ?>"><?php echo $text_browse; ?> <i class="fa fa-angle-right"></i></a></div>
					
					<div class="thumb"><a href="<?php echo $category['href']; ?>"><img src="<?php echo $category['thumb']; ?>" alt="<?php echo $category['name']; ?>" title="<?php echo $category['name']; ?>" class="img-responsive" /></a></div>

				</div>
				
				<div class="caption">
					<h4 class="catname"><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></h4>
					<?php if($category['display_description_status']=="1"){?>
						<p class="catdesc"><?php echo $category['description']; if($category['description']!=''){echo '..';}?></p>
					<?php } ?>
				</div>

			</div><!-- .inner -->
		</div><!-- .item -->
		<?php } ?>
	</div><!-- .owl-carousel -->

</div>

<script type="text/javascript"><!--
$(document).ready(function() {
	$('#featured_categories<?php echo $module; ?> .owl-carousel').owlCarousel({
		items: 5,
		itemsMobile:[479,2],
		<?php if($sellegance_carousel_autoplay == 1) echo "autoPlay: 3000,"; ?>
		navigation: true,
		navigationText: ['<i class="fa fa-angle-left fa-5x"></i>', '<i class="fa fa-angle-right fa-5x"></i>'],
		pagination: true,
		loop:true
	});
});
--></script>
