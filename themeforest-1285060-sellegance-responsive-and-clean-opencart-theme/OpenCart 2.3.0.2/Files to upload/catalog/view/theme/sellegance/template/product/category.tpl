<?php echo $header; ?>
<div class="centralbox">
		<div class="container" id="product-category">
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

	<?php if ($thumb || $description) { ?>

		<div class="category-info visible-xs">
			<?php if ($thumb) { ?>
			<div class="image"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" /></div>
			<?php } ?>
			<?php if ($description) { ?>
			<?php echo $description; ?>
			<?php } ?>
		</div>

	<?php } ?>

	<?php
	if ($column_left && $column_right) { 
		$class = "col-sm-6 middle sideleft";
		$grid = "col-lg-6 col-md-6 col-sm-12 col-xs-12";
	} else if ($column_left || $column_right) { 
		$class = "col-sm-9"; 
		if($column_left) $class.=" sideleft"; else $class.= " sideright";
		$grid = "col-lg-4 col-md-4 col-sm-6 col-xs-12";
	} else { 
		$class = "col-sm-12";
		$grid = "col-lg-3 col-md-3 col-sm-6 col-xs-12";
	}
	?>

	<div class="row">

		<?php echo $column_left; ?>

		<div id="content" class="<?php echo $class; ?> category" role="main">

			<div class="mainborder">

				<div class="category-details">

					<?php if ($thumb || $description) { ?>

						<div class="category-info hidden-xs">
							<?php if ($thumb) { ?>
							<div class="image"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" /></div>
							<?php } ?>
							<?php if ($description) { ?>
							<?php echo $description; ?>
							<?php } ?>
						</div>

					<?php } ?>

					<?php if ($categories && isset($sellegance_subcat_status) && $sellegance_subcat_status == 1) { ?>

						<?php if($sellegance_subcat_thumbnails_status != 1){ ?>
							
							<div class="contentset">
								<h4 class="inner"><span><?php echo $text_subcategories; ?></span></h4>
							</div>
							<ul class="category-list">
								<?php foreach ($categories as $category) { ?>
								<li class="subcat"><a href="<?php echo $category['href']; ?>" title="<?php echo $category['name']; ?>"><?php echo $category['name']; ?></a></li>
								<?php } ?>
							</ul>

						<?php } ?>

					<?php } ?>

				</div>

				<!-- Grid/Lis view, filters -->

				<div class="product-filter">

					<?php if($categories && $sellegance_subcat_status == 1 && $sellegance_subcat_thumbnails_status == 1){ ?>

						<a class="btn btn-cart subcat-btn" role="button" data-toggle="collapse" href="#subcategories" aria-expanded="false" aria-controls="collapseExample"><?php echo $text_subcategories; ?> <i class="fa fa-angle-right"></i></a>

						<div class="collapse" id="subcategories">
							<ul class="category-list" aria-labelledby="subcategories">
								<?php foreach ($categories as $category) { ?>
								<li class="subcat_thumb">
									<a href="<?php echo $category['href']; ?>" title="<?php echo $category['name']; ?>">
										<?php if (isset($category['thumb'])) { ?>
											<img src="<?php echo $category['thumb']; ?>" alt="<?php echo $category['name']; ?>" />
										<?php } else { 
											$thumb_width = $sellegance_subcat_thumb_width;
											$thumb_height = $sellegance_subcat_thumb_height;
											?>
											<img src="image/no_image.jpg" width="<?php echo $thumb_width; ?>" height="<?php echo $thumb_height; ?>" />
										<?php } ?>
										<span><?php echo $category['name']; ?></span>
									</a>
								</li>
								<?php } ?>
							</ul>
						</div>

					<?php } ?>

					<?php if ($products) { ?>

						<div class="btn-group display">
						  <button type="button" id="list-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
						  <button type="button" id="grid-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
						</div>

						<span class="product-compare"><a href="<?php echo $compare; ?>" id="compare-total" data-toggle="tooltip" class="btn btn-default" title="<?php echo $text_compare; ?>"><i class="fa fa-exchange"></i></a></span>
						
						<div class="list-options"> 

							<div class="sort">

								<i class="fa fa-sort-amount-asc" data-toggle="tooltip" title="<?php echo $text_sort; ?>"></i>

								<div class="btn-group dropdown">
									<ul class="dropdown-menu dropdown-menu-right">
										<?php foreach ($sorts as $sorts) { ?>
										<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
										<li><a href="<?php echo $sorts['href']; ?>"><b><?php echo $sorts['text']; ?></b></a></li>
										<?php $current_sort=$sorts['text']; ?>
										<?php } else { ?>
										<li><a href="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></a></li>
										<?php } ?>
										<?php } ?>
									</ul>
									<button type="button" id="input-sort" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
										<?php echo $current_sort; ?> <span class="caret"></span>
									</button>
									
								</div>

							</div>

							<div class="limit">

								<div class="btn-group dropdown">
									<ul class="dropdown-menu dropdown-menu-right">
										<?php foreach ($limits as $limits) { ?>
										<?php if ($limits['value'] == $limit) { ?>
										<li><a href="<?php echo $limits['href']; ?>"><b><?php echo $limits['text']; ?></b></a></li>
										<?php $current_limit=$limits['text']; ?>
										<?php } else { ?>
										<li><a href="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></a></li>
										<?php } ?>
										<?php } ?>
									</ul>
									<button type="button" id="input-limit" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
										<?php echo $current_limit; ?> <span class="caret"></span>
									</button>
								</div>

							</div>

						</div>

					<?php } ?>

				</div>
			
				<!-- Product list (Default to Grid) -->

				<?php if ($products) { ?>

					<div class="row product-listing">
						<?php foreach ($products as $product) { ?>
						<div class="product-layout product-grid <?php echo $grid; ?>">
							<div class="product-thumb">

								<?php if ($product['price'] && $product['special']) { ?>
									<span class="onsale"><?php echo $text_onsale; ?></span>
								<?php } ?>

								<div class="image hover_fade_in_back">
									<div class="quickview"><a id="qv<?php echo $product['product_id']; ?>" class="button btn btn-link" rel="mp-quickview" href="index.php?route=product/quickview&product_id=<?php echo $product['product_id']; ?>" ><i class="fa fa-plus-circle"></i><?php echo $text_quickview; ?></a></div>
									
									<?php if ( $product['thumb'] && isset($product['thumb_swap']) && $sellegance_rollover_images==1) { ?>
									<div class="front-image">
										<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" alt="<?php echo $product['name']; ?>"/></a>
									</div>
									<div class="back-image">
										<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb_swap']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" alt="<?php echo $product['name']; ?>"/></a>
									</div>
									<?php } else if ($product['thumb']) { ?>
									<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" alt="<?php echo $product['name']; ?>" /></a>
									<?php } ?>
								</div>

								<div>
									<div class="caption">
									
										<h4 class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
										<p class="description"><?php echo $product['description']; ?></p>

										<?php if ($product['price']) { ?>
										<p class="price">
											<?php if (!$product['special']) { ?>
											<?php echo $product['price']; ?>
											<?php } else { ?>
											<span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
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
											<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
											<?php } else { ?>
											<span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
											<?php } ?>
											<?php } ?>
										</div>
										<?php } ?>

										<div class="cart">
											<div class="btn-group">
											<button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');" class="btn btn-sm btn-cart"><?php echo $button_cart; ?></button>
											<button type="button" data-toggle="tooltip" class="btn btn-link btn-sm wishlist" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart-o"></i></button>
											<button type="button" data-toggle="tooltip" class="btn btn-link btn-sm compare" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
											</div>
										</div>

									</div>

								</div>
							</div>
						</div>
						<?php } ?>
					</div>

					<div class="pagination"><?php echo $pagination; ?></div>
				
				<?php } ?> <!-- products END -->


				<!-- If Category is empty -->

				<?php if (!$categories && !$products) { ?>

					<div class="content empty">

						<p><?php echo $text_empty; ?></p>

						<div class="buttons">
							<a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a>
						</div>

					</div>

				<?php } ?>

			</div>

		</div> <!-- #content -->
		
		<?php echo $column_right; ?>

	</div> <!-- .row -->
	
	<?php echo $content_bottom; ?>

<?php echo $footer; ?>