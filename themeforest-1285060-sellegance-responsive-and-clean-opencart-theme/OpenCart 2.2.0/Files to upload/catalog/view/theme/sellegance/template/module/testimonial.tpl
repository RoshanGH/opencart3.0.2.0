<div class="box testimonials">
	<div class="contentset">
		<h4 class="inner"><span><?php echo $testimonial_title; ?></span></h4>
	</div>
	<div class="box-content">
		<div class="product-grid m<?php echo $module; ?> <?php if ($testimonial_carousel) { ?>carousel<?php } ?> ">
			<?php foreach ($testimonials as $testimonial) { ?>
				<div class="item testimonial col-md-<?php echo 12/$testimonial_columns; ?>">
					<h4 class="heading"><a href="<?php echo $testimonial['link']; ?>"><?php echo $testimonial['title']; ?></a></h4>
					<div class="review"><?php echo $testimonial['description'] ; ?></div>

					<?php if ($testimonial['rating']) { ?>
						<span class="rating r<?php echo $testimonial['rating']; ?>">
							<i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
						</span>
					<?php } ?>

					<div class="testimonial_author">
						<a href="<?php echo $testimonial['link']; ?>"><?php echo $testimonial['name']; ?></a>, 
						<span class="city"><?php echo $testimonial['city']; ?></span>
					</div>

				</div>
			<?php } ?>
		</div>

	<?php if ($testimonial_links) { ?>
		<div class="testimonials_links">
			<a href="<?php echo $showall_url;?>"><?php echo $show_all; ?></a>
			<a href="<?php echo $href_write_testimonial; ?>"><?php echo $write_testimonial; ?></a>
		</div>
	<?php } ?>

	</div>
</div>

<?php if ($testimonial_carousel) { ?>
<script type="text/javascript"><!--
	$(document).ready(function() {
		$('.product-grid.carousel.m<?php echo $module; ?>').owlCarousel({
			//itemsCustom: [[0, 1], [767, <?php echo $testimonial_columns; ?>]],
			items:1,
			singleItem: true,
			slideSpeed:500,
			autoPlay: 3000,
			scrollPerPage:false,
			navigation:true,
			navigationText: ['<i class="fa fa-angle-left fa-5x"></i>', '<i class="fa fa-angle-right fa-5x"></i>'],
			pagination: false,
			loop: true
		}); 
	});	
//--></script>
<?php } ?>