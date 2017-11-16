<?php echo $header; ?>

	<?php echo $content_top; ?>

	<div class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
			<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
		<?php } ?>
	</div>

	<header class="page-header">
		<h1><?php echo $heading_title; ?></h1>
	</header>

	<?php 

	$this->language->load('module/sellegance');
	
	if ($column_left && $column_right) { 
		$main = "col-sm-6 middle sideleft"; }
	else if ($column_left || $column_right) { 
		$main = "col-sm-9"; 
		if($column_left) $main.=" sideleft"; else $main.= " sideright";
	} 
	else { $main = "col-sm-12"; }

	?>

	<div class="row">

		<?php echo $column_left; ?>

		<section id="maincontent" class="<?php echo $main; ?> category" role="main">

			<div class="mainborder">

				<?php if ($column_left || $column_right) { ?>
					<div id="toggle_sidebar"></div>
				<?php } ?>

				<div class="category-details">

					<?php if ($thumb || $description) { ?>

						<div class="category-info">
							<?php if ($thumb) { ?>
							<div class="image"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" /></div>
							<?php } ?>
							<?php if ($description) { ?>
							<?php echo $description; ?>
							<?php } ?>
						</div>

					<?php } ?>

					<!-- Subcategories START -->

					<?php if ($categories && $this->config->get('sellegance_subcat_status') == 1) { ?>

						<div class="contentset">
							<h4 class="inner"><span><?php echo $text_refine; ?></span></h4>
						</div>

						<ul class="category-list">

							<?php if($this->config->get('sellegance_subcat_thumbnails_status') == 1){ ?>

								<?php foreach ($categories as $category) { ?>
								<li class="subcat_thumb">
									<a href="<?php echo $category['href']; ?>" title="<?php echo $category['name']; ?>">
										<?php if (isset($category['thumb'])) { ?>
											<img src="<?php echo $category['thumb']; ?>" alt="<?php echo $category['name']; ?>" />
										<?php } else { 
											$thumb_width = $this->config->get('sellegance_subcat_thumb_width');
											$thumb_height = $this->config->get('sellegance_subcat_thumb_height');
											?>
											<img src="image/no_image.jpg" width="<?php echo $thumb_width; ?>" height="<?php echo $thumb_height; ?>" />
										<?php } ?>
										<span><?php echo $category['name']; ?></span>
									</a>
								</li>
								<?php } ?>

							<?php } else { ?>

								<?php foreach ($categories as $category) { ?>
								<li class="subcat"><a href="<?php echo $category['href']; ?>" title="<?php echo $category['name']; ?>"><?php echo $category['name']; ?></a></li>
								<?php } ?>

							<?php } ?>

						</ul>

					<?php } ?> <!-- subcategories END -->

				</div>


				<!-- Products -->

				<?php if ($products) { ?>

					<!-- Grid/Lis view, filters -->

					<div class="product-filter">

						<div class="btn-group display" data-toggle="buttons">
							<label title="<?php echo $text_grid; ?>" class="btn btn-default btn-sm active" onclick="display('grid');"><input type="radio" name="options" id="grid" ><i class="fa fa-th"></i></label>
							<label title="<?php echo $text_list; ?>" class="btn btn-default btn-sm" onclick="display('list');"><input type="radio" name="options" id="list" ><i class="fa fa-bars"></i></label>
						</div>

						<span class="product-compare"><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a></span>
						
						<div class="list-options"> 

							<div class="sort">

								<?php echo $text_sort; ?>

								<select onchange="location = this.value;" class="form-control input-sm">
									<?php foreach ($sorts as $sorts) { ?>
									<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
									<option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
									<?php } else { ?>
									<option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
									<?php } ?>
									<?php } ?>
								</select>

							</div>

							<div class="limit">

								<?php echo $text_limit; ?>

								<select onchange="location = this.value;" class="form-control input-sm">
									
									<?php foreach ($limits as $limits) { ?>

										<?php if ($limits['value'] == $limit) { ?>

											<option value="<?php echo $limits['href']; ?>" selected="selected">
												<?php echo $limits['text']; ?>
											</option>

										<?php } else { ?>

											<option value="<?php echo $limits['href']; ?>">
												<?php echo $limits['text']; ?>
											</option>

										<?php } ?>

									<?php } ?>

								</select>

							</div>

						</div>

					</div>
				
					<!-- Product list (Default to Grid) -->

					<?php if($this->config->get('sellegance_product_columns') == '4') $productcols = 'cols-4'; 
						else $productcols = 'cols-3'; ?>

					<div class="product-listing">

						<div class="product-grid <?php echo $productcols; ?>">

							<?php foreach ($products as $product) { ?>

							<div class="grid-box">

								<div class="inner">

									<?php if ($product['price'] && $product['special']) { ?>
										<span class="onsale"><?php echo $this->language->get('text_onsale'); ?></span>
									<?php } ?>

									<div class="image hover_fade_in_back">
									<?php if ( $product['thumb'] && isset($product['thumb_swap']) && $this->config->get('sellegance_rollover_images')==1) { ?>
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

									<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>

									<div class="description"><?php echo $product['description']; ?></div>

									<?php if ($product['price']) { ?>

										<div class="price">
											
											<?php if (!$product['special']) { ?>
												<?php echo $product['price']; ?>
											<?php } else { ?>
												<span class="price-old"><?php echo $product['price']; ?></span>
												<span class="price-new"><?php echo $product['special']; ?></span>
											<?php } ?>

											<?php if ($product['tax']) { ?>
												<br />
												<span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
											<?php } ?>

										</div>

									<?php } ?>

									<?php if ($product['rating']) { ?>
										<div class="rating"><img src="catalog/view/theme/sellegance/images/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
									<?php } ?>

									<div class="cart"><input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button btn btn-default" /></div>

									<div class="links">
										<span class="wishlist"><a onclick="addToWishList('<?php echo $product['product_id']; ?>');" title="<?php echo $button_wishlist; ?>" class="tooltp" ><i class="fa fa-heart"></i></a></span>
										
										<span class="compare"><a onclick="addToCompare('<?php echo $product['product_id']; ?>');" title="<?php echo $button_compare; ?>" class="tooltp" ><i class="fa fa-plus"></i></a></span>
									</div>
									
								</div>

							</div>

							<?php } ?>

						</div> <!-- .produc-grid -->

					</div> <!-- .product-listing -->

					<div class="pagination"><?php echo $pagination; ?></div>
				
				<?php } ?> <!-- products END -->


				<!-- If Category is empty -->

				<?php if (!$categories && !$products) { ?>

					<div class="content empty">

						<p><?php echo $text_empty; ?></p>

						<div class="buttons">
							<a href="<?php echo $continue; ?>" class="button btn btn-default btn-inverse"><?php echo $button_continue; ?></a>
						</div>

					</div>

				<?php } ?>

			</div>

		</section> <!-- #maincontent -->
		
		<?php echo $column_right; ?>

	</div> <!-- .row -->
	
	<?php echo $content_bottom; ?>

<?php echo $footer; ?>