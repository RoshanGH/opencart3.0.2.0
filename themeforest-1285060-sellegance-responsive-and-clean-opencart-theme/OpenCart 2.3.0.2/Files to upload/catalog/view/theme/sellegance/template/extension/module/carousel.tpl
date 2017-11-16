<div id="carousel<?php echo $module; ?>" class="owl-carousel banner-carousel">
	<?php foreach ($banners as $banner) { ?>
	<div class="item text-center">
		<?php if ($banner['link']) { ?>
		<a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
		<?php } else { ?>
		<img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
		<?php } ?>
	</div>
	<?php } ?>
</div>

<script type="text/javascript"><!--
$('#carousel<?php echo $module; ?>').owlCarousel({
	items: 3,
	itemsDesktop:[1199,3],
	// itemsTablet:[768,3],
	// itemsMobile:[479,2],
	autoPlay: 3000,
	navigation: true,
	navigationText: ['<i class="fa fa-angle-left fa-5x"></i>', '<i class="fa fa-angle-right fa-5x"></i>'],
	pagination: true
});
--></script>