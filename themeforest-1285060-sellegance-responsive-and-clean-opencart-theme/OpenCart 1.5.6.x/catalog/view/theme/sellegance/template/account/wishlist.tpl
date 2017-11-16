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
	
	if ($column_left && $column_right) { 
		$main = "col-sm-6 middle sideleft"; }
	else if ($column_left || $column_right) { 
		$main = "col-sm-9";
		if($column_left) $main.=" sideleft"; else $main.= " sideright";
	} 
	else { $main = "col-sm-12"; } 

	?>

	<div class="row">

		<?php echo $column_left;?>

		<section id="maincontent" class="<?php echo $main; ?>" role="main">

			<div class="mainborder">

				<?php if ($column_left || $column_right) { ?>
					<div id="toggle_sidebar"></div>
				<?php } ?>

				<?php if ($products) { ?>

					<div id="wish-list">

						<?php foreach ($products as $product) { ?>

							<div id="wishlist-row<?php echo $product['product_id']; ?>" class="row">
						
								<div class="col-sm-2 image">
									<?php if ($product['thumb']) { ?>
									<a href="<?php echo $product['href']; ?>">
										<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" />
									</a>
									<?php } ?>
								</div>
								
								<div class="col-sm-4 name">
									<a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
									<small><?php echo $column_model; ?>:</small> <?php echo $product['model']; ?><br>
									<small><?php echo $column_stock; ?>:</small> <span class="stock"><?php echo $product['stock']; ?></span>
								</div>
								
								<div class="col-sm-2 price">
									<?php if ($product['price']) { ?>
										<?php if (!$product['special']) { ?>
											<?php echo $product['price']; ?>
										<?php } else { ?>
											<div class="price-old"><?php echo $product['price']; ?></div>
											<div class="price-new"><?php echo $product['special']; ?></div>
										<?php } ?>
									<?php } ?>
								</div>
								
								<div class="col-sm-4 list-actions">
									<input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button btn btn-cart btn-sm" /> 
																			
									<a href="<?php echo $product['remove']; ?>" class="button btn btn-default btn-sm" title="<?php echo $button_remove; ?>"><i class="fa fa-times-circle"></i> <?php echo $button_remove; ?></a>
								</div>

							</div>

						<?php } ?>

					</div> <!-- #wish-list -->
				
					<div class="form-actions buttons">
						<a href="<?php echo $continue; ?>" class="button btn btn-default btn-inverse"><?php echo $button_continue; ?></a>
					</div>

				<?php } else { ?>

					<div class="content empty">
						<p><?php echo $text_empty; ?></p>
						<div class="form-actions buttons">
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