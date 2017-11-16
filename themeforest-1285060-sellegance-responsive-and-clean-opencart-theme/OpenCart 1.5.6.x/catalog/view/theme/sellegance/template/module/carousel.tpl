<div id="carousel<?php echo $module; ?>" class="banner-carousel" <?php if ($this->language->get('direction')=='rtl') echo 'style="direction:ltr;"'?>>

	<div class="flexslider">

		<ul class="slides">

		<?php foreach ($banners as $banner) { ?>
			
			<li>
				<a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" /></a>
			</li>

		<?php } ?>

		</ul>

  </div>

</div> <!-- .banner-carousel -->

<script type="text/javascript">

	$(document).ready(function() {
		$('#carousel<?php echo $module; ?> .flexslider').flexslider({
			animation: "slide",
			animationLoop: false,
			itemWidth: <?php echo (isset($width)) ? $width : '300'; ?>,
			itemMargin: 10,
			minItems: 1,
			maxItems: <?php echo $scroll; ?>,
			move: <?php echo $scroll; ?>,
			slideshow: true,
			slideshowSpeed: 3500,
			controlNav: true,
			directionNav: true
		  });
	});

</script>