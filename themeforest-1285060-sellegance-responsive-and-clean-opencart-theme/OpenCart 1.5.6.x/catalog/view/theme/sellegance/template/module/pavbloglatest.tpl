<section id="latest-blog" class="product-slider top-arrows" <?php if ($this->language->get('direction')=='rtl') echo 'style="direction:ltr;"'?>>

	<div class="contentset center">
		<h4 class="inner"><span><?php echo $heading_title; ?></span></h4>
	</div>

	<div class="flexslider">

		<ul class="slides">

		<?php foreach( $blogs as $key => $blog ) { $key = $key + 1;?>
			
			<li>
				<div class="blog-item">
					<div class="blog-header clearfix">
						<h5 class="blog-title">
							<a href="<?php echo $blog['link'];?>" title="<?php echo $blog['title'];?>"><?php echo $blog['title'];?></a>
						</h5>
					</div>
					<div class="blog-body">
						<?php if( $blog['thumb']  )  { ?>
							<a href="<?php echo $blog['link'];?>" title="<?php echo $blog['title'];?>"><img src="<?php echo $blog['thumb'];?>" title="<?php echo $blog['title'];?>" align="left"/></a>
						<?php } ?>
						<div class="description">
								<?php $blog['description'] = strip_tags($blog['description']); ?>
								<?php echo utf8_substr( $blog['description'],0, 200 );?>...
						</div>
						<a href="<?php echo $blog['link'];?>" class="btn btn-link btn-xs readmore"><?php echo $this->language->get('text_readmore');?> <i class="fa fa-caret-right"></i></a>
					</div>	
				</div>
			</li>

		<?php } ?>

		</ul>

  	</div>

</section> <!-- .product-slider -->

<script type="text/javascript">

	$(document).ready(function() {
		$('#latest-blog .flexslider').flexslider({
			animation: "slide",
			animationLoop: true,
			itemWidth: 182,
			itemMargin: 10,
			minItems: 2,
			maxItems: <?php echo $cols;?>
		  });
	});

</script>