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
	global $config;
	
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

		<div id="content" class="<?php echo $class; ?> search listing" role="main">

			<div class="mainborder">

				<div class="search-criteria">
					
					<div class="contentset center">
						<h4 class="inner"><span><?php echo $entry_search; ?></span></h4>
					</div>
						
					<div class="controls">
						<input type="text" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_keyword; ?>" id="input-search" class="form-control search-box input-lg" />
					</div>

					<select name="category_id" class="form-control">
						<option value="0"><?php echo $text_category; ?></option>
						<?php foreach ($categories as $category_1) { ?>
						<?php if ($category_1['category_id'] == $category_id) { ?>
						<option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
						<?php } else { ?>
						<option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
						<?php } ?>
						<?php foreach ($category_1['children'] as $category_2) { ?>
						<?php if ($category_2['category_id'] == $category_id) { ?>
						<option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
						<?php } else { ?>
						<option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
						<?php } ?>
						<?php foreach ($category_2['children'] as $category_3) { ?>
						<?php if ($category_3['category_id'] == $category_id) { ?>
						<option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
						<?php } else { ?>
						<option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
						<?php } ?>
						<?php } ?>
						<?php } ?>
						<?php } ?>
					</select>

					<div class="controls">
						
						<label class="checkbox-inline">
										<?php if ($sub_category) { ?>
										<input type="checkbox" name="sub_category" value="1" checked="checked" />
										<?php } else { ?>
										<input type="checkbox" name="sub_category" value="1" />
										<?php } ?>
										<?php echo $text_sub_category; ?>
								</label>

						<label class="checkbox-inline">
									<?php if ($description) { ?>
									<input type="checkbox" name="description" value="1" id="description" checked="checked" />
									<?php } else { ?>
									<input type="checkbox" name="description" value="1" id="description" />
									<?php } ?>
									<?php echo $entry_description; ?>
								</label>

					</div>
			
					<div class="buttons">
						<input type="button" value="<?php echo $button_search; ?>" id="button-search" class="btn btn-primary" />
					</div>

				</div>


				<!-- Products -->

				<?php if ($products) { ?>

					<!-- Grid/Lis view, filters -->

					<div class="product-filter">

						<div class="btn-group display" data-toggle="buttons">

							<label class="btn btn-default btn-sm active" id="list-view">
									<input type="radio" name="options" id="option1" autocomplete="off" checked><i class="fa fa-th-list"></i>
								</label>
							<label class="btn btn-default btn-sm" id="grid-view">
									<input type="radio" name="options" id="option2" autocomplete="off"><i class="fa fa-th"></i>
								</label>

						</div>

						<span class="product-compare"><a href="<?php echo $compare; ?>" id="compare-total" data-toggle="tooltip" class="btn btn-default btn-sm" title="<?php echo $text_compare; ?>"><i class="fa fa-exchange"></i></a></span>
						
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

					</div>
				
					<!-- Product list (Default to Grid) -->

						<div class="row product-listing">
							<?php foreach ($products as $product) { ?>
						<div class="product-layout product-grid <?php echo $grid; ?>">
								<div class="product-thumb">

										<?php if ($product['price'] && $product['special']) { ?>
											<span class="onsale"><?php echo $text_onsale; ?></span>
										<?php } ?>

									<div class="image hover_fade_in_back">
									<div class="quickview"><a id="qv<?php echo $product['product_id']; ?>" class="button btn btn-link" rel="mp-quickview" href="index.php?route=product/quickview&product_id=<?php echo $product['product_id']; ?>" ><i class="fa fa-plus-circle"></i><?php echo $text_quickview; ?></a></div>
								
									<?php if ( $product['thumb'] && isset($product['thumb_swap']) && $config->get('sellegance_rollover_images')==1) { ?>
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
				
				<?php } else { ?>

					<div class="content empty white">

						<div class="alert alert-warning"><?php echo $text_empty; ?></div>

					</div>

				<?php } ?>

			</div>

		</div><!-- #content -->
		
		<?php echo $column_right; ?>

	</div> <!-- .row -->
	
	<?php echo $content_bottom; ?>

	<script type="text/javascript"><!--
	$('#button-search').bind('click', function() {
		url = 'index.php?route=product/search';
		
		var search = $('#content input[name=\'search\']').prop('value');
		
		if (search) {
			url += '&search=' + encodeURIComponent(search);
		}

		var category_id = $('#content select[name=\'category_id\']').prop('value');
		
		if (category_id > 0) {
			url += '&category_id=' + encodeURIComponent(category_id);
		}
		
		var sub_category = $('#content input[name=\'sub_category\']:checked').prop('value');
		
		if (sub_category) {
			url += '&sub_category=true';
		}
			
		var filter_description = $('#content input[name=\'description\']:checked').prop('value');
		
		if (filter_description) {
			url += '&description=true';
		}

		location = url;
	});

	$('#content input[name=\'search\']').bind('keydown', function(e) {
		if (e.keyCode == 13) {
			$('#button-search').trigger('click');
		}
	});

	$('select[name=\'category_id\']').on('change', function() {
		if (this.value == '0') {
			$('input[name=\'sub_category\']').prop('disabled', true);
		} else {
			$('input[name=\'sub_category\']').prop('disabled', false);
		}
	});

	$('select[name=\'category_id\']').trigger('change');
	--></script>

<?php echo $footer; ?>