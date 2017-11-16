<?php echo $header; ?>
<div class="centralbox">
		<div class="container">
			<div class="container-inner">

	<?php echo $content_top; ?>

	<header class="page-header">
		<h1><?php echo $heading_title; ?></h1>
	</header>

	<ul class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
		<?php } ?>
	</ul>

	<?php 
	
	if ($column_left && $column_right) { 
		$class = "col-sm-6 middle sideleft"; }
	else if ($column_left || $column_right) { 
		$class = "col-sm-9"; 
		if($column_left) $class.=" sideleft"; else $class.= " sideright";
	} 
	else { $class = "col-sm-12"; } 

	?>

	<div class="row"><?php echo $column_left; ?>

	<div id="content" class="<?php echo $class; ?> blog-single"><?php echo $content_top; ?>

		<div class="blog_post mainborder">

			<?php if($main_thumb && $blogsetting_post_thumb){ ?>
				<div class="main_thumb zoom_image_container">
				<img src="<?php echo $blogsetting_post_thumb; ?>" class="img-responsive" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" />
				</div>
			<?php } ?>

			<div class="blog_stats">
				<?php if($post_date_added_status){ ?>
					<span><b class="hl"><?php echo $date_added_full; ?></b></span>
				<?php } ?>
				
				<?php if($post_author_status){ ?><span><b class="text"><?php echo $text_posted_by; ?></b> <b class="hl"><?php echo $author; ?></b></span><?php } ?>
				
				<?php if($post_page_view_status){ ?><span><b class="text"><?php echo $text_read; ?></b> <b class="hl"><?php echo $new_read_counter_value; ?></b></span><?php } ?>

				<?php if($post_comments_count_status){ ?>
					<span class="comment_count"><i class="fa fa-comments"></i> <b class="hl"><?php echo $comment_total;?></b></span>
				<?php } ?>
			</div>

				<div class="main_description">
					<?php echo $description; ?>
				</div>

				<?php if ($tags) { ?>
				<p class="tags">
					<?php echo $text_tags; ?>
				<?php for ($i = 0; $i < count($tags); $i++) { ?>
				<?php if ($i < (count($tags) - 1)) { ?>
				<a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>, 
				<?php } else { ?>
				<a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
				<?php } ?>
				<?php } ?>
				</p>
				<?php } ?>

				<div class="share">

					<?php $url = urlencode($config_url."index.php?route=blog/blog&blog_id=".$blog_id); ?>

					<ul>
						<li><a href="//facebook.com/sharer.php?u=<?php echo $url; ?>" target="_blank" title="Facebook" class="facebook" data-toggle="tooltip"><i class="fa fa-facebook"></i></a></li>
						<li><a href="https://twitter.com/share?url=<?php echo $url; ?>" target="_blank" title="Twitter" class="twitter" data-toggle="tooltip"><i class="fa fa-twitter"></i></a></li>
						<li><a href="https://plus.google.com/share?url=<?php echo $url; ?>" target="_blank" title="Google +" class="google-plus" data-toggle="tooltip" onclick="javascript:window.open(this.href,
								'', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" ><i class="fa fa-google-plus"></i></a></li>
						<li><a href="//pinterest.com/pin/create/button/?url=<?php echo $url; ?>&<?php if ($blogsetting_post_thumb) {?>media=<?php echo $blogsetting_post_thumb; ?>&<?php } ?>description=<?php echo strip_tags($heading_title); ?>" target="_blank" title="Pinterest" class="pinterest" data-toggle="tooltip"><i class="fa fa-pinterest"></i></a></li>
						<li><a href="mailto:enteryour@addresshere.com?subject=<?php echo strip_tags($heading_title); ?>&body=<?php echo $url; ?>" class="envelope"  title="Email" data-toggle="tooltip"><i class="fa fa-envelope"></i></a></li>
					</ul>

				</div>
				
				<!-- Related Products -->
				<?php if ($products) { ?>
					<div class="contentset center">
						<h4 class="inner"><span><?php echo $text_related_products; ?></span></h4>
					</div>
					 <div class="blog_grid_holder blog_products">
						<?php foreach ($products as $product) { ?>
							<div class="item">
								<div class="product-thumb transition">

									<div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
								 
									<div class="caption">
										
										<h4 class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>

										<?php if ($product['price']) { ?>
										<p class="price">
											<?php if (!$product['special']) { ?>
											<?php echo $product['price']; ?>
											<?php } else { ?>
											<span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
											<?php } ?>
											<?php if ($product['tax']) { ?>
											<span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
											<?php } ?>
										</p>
										<?php } ?>

										<?php if ($product['rating']) { ?>
										<div class="rating">
											<?php for ($i = 1; $i <= 5; $i++) { ?>
											<?php if ($product['rating'] < $i) { ?>
											<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
											<?php } else { ?>
											<span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
											<?php } ?>
											<?php } ?>
										</div>
										<?php } ?>

										<div class="cart">
										<?php if ((float)VERSION >= 2.1) { ?>
											<button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');" class="btn btn-sm btn-cart"><i class="fa fa-shopping-cart visible-xs"></i> <span class="hidden-xs"><?php echo $button_cart; ?></span></button>
										<?php } else { ?>
											<button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');" class="btn btn-sm btn-cart"><i class="fa fa-shopping-cart visible-xs"></i> <span class="hidden-xs"><?php echo $button_cart; ?></span></button>
										<?php } ?>
										</div>
									</div>
								</div>
							</div>
						<?php } ?>
					</div>
					<?php } ?>
			 <!-- Related Products End -->

				<?php if ($related_blogs) { ?>
					<div class="contentset center">
						<h4 class="inner"><span><?php echo $text_related_blog; ?></span></h4>
					</div>
					<div class="blog_grid_holder related">
						<?php foreach ($related_blogs as $blog) { ?>
						<div class="blog_item">
							<?php if(($blog['image']) && ($rel_thumb_status)){ ?>
							<div class="image zoom_image_container">
							<a href="<?php echo $blog['href']; ?>"><img src="<?php echo $blog['image']; ?>" class="img-responsive" alt="<?php echo $blog['title']; ?>" title="<?php echo $blog['title']; ?>" /></a>
							</div>
							<?php } ?>
							
							<div class="blog_summary">
							
									<h2 class="blog_title"><a href="<?php echo $blog['href']; ?>"><?php echo $blog['title']; ?></a></h2>
									<div class="blog_stats">
										<?php if($date_added_status){ ?>
											<span class="date"><b class="hl"><?php echo $blog['date_added_full']; ?></b></span>
										<?php } ?>
										<?php if($post_comments_count_status){ ?><span class="comment_count"><i class="fa fa-comments"></i> <b class="hl"><?php echo $comment_total;?></b></span><?php } ?>
									</div> <!-- blog-stats ends -->
									<p><?php echo $blog['short_description']; ?></p>

							</div> <!-- summary ends -->
						</div> <!-- item ends -->
						<?php } ?>            
					</div>

					<script type="text/javascript">
					$(document).ready(function() {
						
						$('.blog_grid_holder.blog_products').owlCarousel({
						itemsCustom: [ [0, 2], [500, 2], [767, <?php echo $rel_prod_per_row;?>]],
						pagination: false,
						navigation:true,
						navigationText: [
						"<div class='slide_arrow_prev'><i class='fa fa-angle-left'></i></div>",
						"<div class='slide_arrow_next'><i class='fa fa-angle-right'></i></div>"],
						slideSpeed:500
						}); 

						$('.blog_grid_holder.related').owlCarousel({
						itemsCustom: [ [0, 1], [500, 2], [767, <?php echo $rel_per_row;?>]],
						pagination: false,
						navigation:true,
						navigationText: [
						"<div class='slide_arrow_prev'><i class='fa fa-angle-left'></i></div>",
						"<div class='slide_arrow_next'><i class='fa fa-angle-right'></i></div>"],
						slideSpeed:500
						}); 

					});
					</script>

				<?php } ?>
				 <!-- Related Blog End -->
			 
				<!-- Comment Area start -->
				<?php if($allow_comment){ ?>
			
					<form id="comment_form" class="row">

						<div class="contentset center">
							<h4 class="inner"><span><?php echo $text_comments; ?></span></h4>
						</div>

							<div id="comment"></div>

						<div class="contentset center">
							<h4 class="inner"><span><?php echo $text_write_comment; ?></span></h4>
						</div>

						<div id="add-review" class="col-sm-8 col-sm-push-2">

							<div class="form-group required">
								<label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
								<input type="text" name="name" value="" id="input-name" class="form-control" />
							</div>
							<div class="form-group required">
								<label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
								<input type="text" name="email" value="" id="input-email" class="form-control" />
							</div>
							
							<div class="form-group required">
									<label class="control-label" for="input-review"><?php echo $entry_comment; ?></label>
									<textarea name="comment" rows="5" id="input-comment" class="form-control"></textarea>
							</div>

							<?php echo $captcha; ?>

							<div class="buttons">
								<button type="button" id="button-comment" class="btn btn-primary"><?php echo $button_send; ?></button>
							</div>

						</div>

					</form>

				<?php } ?>

			</div>

		</div> <!-- #content -->
		
		<?php echo $column_right; ?>

	</div> <!-- .row -->

	<?php echo $content_bottom; ?>

<script type="text/javascript"><!--

$('#comment').delegate('.pagination a', 'click', function(e) {
	e.preventDefault();
	$("html,body").animate({scrollTop:(($("#comment").offset().top)-50)},500);
	$('#comment').fadeOut(50);

	$('#comment').load(this.href);

	$('#comment').fadeIn(500);
	
});

$('#comment').load('index.php?route=blog/blog/comment&blog_id=<?php echo $blog_id; ?>');
//--></script>

<script type="text/javascript"><!--

$('#button-comment').on('click', function() {
	$.ajax({
		url: 'index.php?route=blog/blog/write&blog_id=<?php echo $blog_id; ?>',
		type: 'post',
		dataType: 'json',
		data: $("#comment_form").serialize(),
		
		complete: function() {
			$('#button-comment').button('reset');
			$('#captcha_comment').attr('src', 'index.php?route=blog/blog/captcha#'+new Date().getTime());
			$('input[name=\'captcha_comment\']').val('');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();
			
			if (json['error']) {
				$('#comment').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}
			
			if (json['success']) {
				$('#comment').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
				
				$('input[name=\'name\']').val('');
				$('input[name=\'email\']').val('');
				$('textarea[name=\'comment\']').val('');
				$('input[name=\'captcha_comment\']').val('');
			}
		}
	});
});     
</script>

<script type="application/ld+json">
{
"@context": "http://schema.org",
"@type": "NewsArticle",
"mainEntityOfPage": {
"@type": "WebPage",
"@id": "https://google.com/article"
},
"headline": "<?php echo $heading_title ?>",
<?php if($blogsetting_post_thumb){ ?>
"image": {
"@type": "ImageObject",
"url": "<?php echo $blogsetting_post_thumb ?>",
"height": <?php echo $img_height ?>,
"width": <?php echo $img_width ?>
},
<?php } ?>
"datePublished": "<?php echo $date_added_full ?>",
"dateModified": "<?php echo $date_added_full ?>",
"author": {
"@type": "Person",
"name": "<?php echo $author ?>"
},
"publisher": {
"@type": "Organization",
"name": "<?php echo $store ?>",
<?php if($logo){ ?>
"logo": {
"@type": "ImageObject",
"url": "<?php echo $logo ?>"
}
<?php } ?>
},
"description": "<?php echo $short_description ?>"
}
</script>
<?php echo $footer; ?> 