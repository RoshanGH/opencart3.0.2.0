<div class="box blog_latest product-slider">
	<div class="contentset center">
		<h4 class="inner"><span><?php echo $heading_title_latest; ?></span></h4>
	</div>
	<div class="box-content latest">
	<?php if(!empty($posts)){ ?>
		<div class="blog_grid_holder latest column-<?php echo $columns; ?> carousel-<?php echo $carousel; ?> <?php echo $module; ?>">
			<?php foreach ($posts as $blog) { ?>
				<div class="blog_item">
					<?php if($blog['image'] && $thumb){ ?>
					<div class="image zoom_image_container">
						<a href="<?php echo $blog['href']; ?>"><img src="<?php echo $blog['image']; ?>" class="zoom_image img-responsive" alt="<?php echo $blog['title']; ?>" title="<?php echo $blog['title']; ?>" /></a>
					</div>
					<?php } ?>

					<div class="blog_summary">
					
						<h2 class="blog_title"><a href="<?php echo $blog['href']; ?>"><?php echo $blog['title']; ?></a></h2>
						<div class="blog_stats">
						<?php if($date_added_status){ ?>
							<span class="blog_date"><b class="hl"><?php echo date("M d",strtotime($blog['date_added_full'])); ?></b></span>
						<?php } ?>
						<?php if($comments_count_status){ ?>
							<span class="comment_count"><i class="fa fa-comments"></i> <b class="hl"><?php echo $blog['comment_total'];?></b></span>
						<?php } ?>
						</div>

						<?php if(!$characters == '0'){ ?>
							<p><?php echo $blog['description']; ?></p>
						<?php } ?>

					</div>
			  </div>
			<?php } ?>
		</div>
	<?php } ?>
	</div>
</div>


<?php if($carousel) { ?>
<script type="text/javascript">
$(document).ready(function() {
$('.blog_grid_holder.carousel-1.<?php echo $module; ?>').owlCarousel({
itemsCustom: [ [0, 1], [500, 2], [767, 3], [979,<?php echo $columns;?>]],
pagination: true,
navigation:true,
navigationText: ['<i class="fa fa-angle-left fa-5x"></i>', '<i class="fa fa-angle-right fa-5x"></i>'],
slideSpeed:500
}); });
</script>
<?php } ?>