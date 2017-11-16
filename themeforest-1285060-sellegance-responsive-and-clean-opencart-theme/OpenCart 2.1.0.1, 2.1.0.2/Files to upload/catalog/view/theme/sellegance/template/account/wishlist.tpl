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

	<div class="row">

		<?php echo $column_left;?>

		<div id="content" class="<?php echo $class; ?>" role="main">

			<div class="mainborder">

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
									<input type="button" value="<?php echo $button_cart; ?>" onclick="cart.add('<?php echo $product['product_id']; ?>');" class="btn btn-cart btn-sm" /> 
									<a href="<?php echo $product['remove']; ?>" class="btn btn-default btn-sm" title="<?php echo $button_remove; ?>"><i class="fa fa-times-circle"></i> <?php echo $button_remove; ?></a>
								</div>

							</div>

						<?php } ?>

					</div> <!-- #wish-list -->
				
					<div class="buttons">
						<a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a>
					</div>

				<?php } else { ?>

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