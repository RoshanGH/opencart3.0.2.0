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
		$class = "col-sm-6 middle sideleft"; }
	else if ($column_left || $column_right) { 
		$class = "col-sm-9";
		if($column_left) $class.=" sideleft"; else $class.= " sideright";
	} 
	else { $class = "col-sm-12"; }  

	?>

	<div class="row">

		<?php echo $column_left ?>

		<div id="content" class="<?php echo $class; ?> comparison" role="main">

			<div class="mainborder">

				<?php if ($products) { ?>

				<div class="contentset center">
					<h4 class="inner"><span><?php echo $text_product; ?></span></h4>
				</div>
				
				<div class="nav-container">

					<div class="btn-group nav-compare visible-xs" data-toggle="buttons">

						<button id="previous-column" class="btn btn-default btn-sm">
							<?php echo $text_prev; ?>
						</button>
						
						<button id="next-column" class="btn btn-default btn-sm">
							<?php echo $text_next; ?>
						</button>

					</div>

				</div>

				<div id="compare-wrapper">

					<table class="table table-responsive table-adjust compare-info">
						
							<thead>
								<tr>
									<td><?php echo $text_name; ?></td>
								
									<?php foreach ($products as $product) { ?>
										<td class="name">
											<a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
										</td>
									<?php } ?>
								</tr>
							</thead>

						<tbody>
							<tr>
								<td class="title"><?php echo $text_image; ?></td>
								
								<?php foreach ($products as $product) { ?>
								<td>
									<div>
									<?php if ($product['price'] && $product['special']) { ?>
									<span class="onsale">
										<?php echo $text_onsale; ?>
									</span>
									<?php } ?>
									
									<?php if ($product['thumb']) { ?>
										<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a>
									<?php } ?>
									</div>
								</td>
								<?php } ?>
							</tr>

							<tr>
								<td class="title"><?php echo $text_price; ?></td>

								<?php foreach ($products as $product) { ?>

								<td class="price">
									<?php if ($product['price']) { ?>
									
										<?php if (!$product['special']) { ?>
											<?php echo $product['price']; ?>
										<?php } else { ?>
											<span class="price-old"><?php echo $product['price']; ?></span> 
											<span class="price-new"><?php echo $product['special']; ?></span>
										<?php } ?>
									<?php } ?>
								</td>
								<?php } ?>
							</tr>

							<tr>
								<td class="title"><?php echo $text_model; ?></td>
								
								<?php foreach ($products as $product) { ?>
								<td><?php echo $product['model']; ?></td>
								<?php } ?>
							</tr>
							<tr>
								<td class="title"><?php echo $text_manufacturer; ?></td>

								<?php foreach ($products as $product) { ?>
								<td><?php echo $product['manufacturer']; ?></td>
								<?php } ?>
							</tr>
							<tr>
								<td class="title"><?php echo $text_availability; ?></td>
								<?php foreach ($products as $product) { ?>
								<td><?php echo $product['availability']; ?></td>
								<?php } ?>
							</tr>
							<?php if ($review_status) { ?>
							<tr>
								<td class="title"><?php echo $text_rating; ?></td>
								<?php foreach ($products as $product) { ?>
								<td class="rating">
									<?php for ($i = 1; $i <= 5; $i++) { ?>
										<?php if ($product['rating'] < $i) { ?>
											<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
										<?php } else { ?>
											<span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
										<?php } ?>
									<?php } ?><br />
									<small><?php echo $product['reviews']; ?></small>
								</td>
								<?php } ?>
							</tr>
							<?php } ?>
							<tr>
								<td class="title"><?php echo $text_summary; ?></td>
								<?php foreach ($products as $product) { ?>
								<td class="description">
									<?php echo $product['description']; ?>
								</td>
								<?php } ?>
							</tr>
							<tr>
								<td class="title"><?php echo $text_weight; ?></td>
								
								<?php foreach ($products as $product) { ?>
								<td><?php echo $product['weight']; ?></td>
								<?php } ?>
							</tr>
							<tr>
								<td><?php echo $text_dimension; ?></td>
								<?php foreach ($products as $product) { ?>
								<td><?php echo $product['length']; ?> x <?php echo $product['width']; ?> x <?php echo $product['height']; ?></td>
							<?php } ?>
							</tr>
						</tbody>
						<?php foreach ($attribute_groups as $attribute_group) { ?>
						<thead>
							<tr>
								<td class="compare-attribute" colspan="<?php echo count($products) + 1; ?>">
									<?php echo $attribute_group['name']; ?>
								</td>
							</tr>
						</thead>
						<tbody>
						<?php foreach ($attribute_group['attribute'] as $key => $attribute) { ?>
						
							<tr>
							<td class="title"><?php echo $attribute['name']; ?></td>
							<?php foreach ($products as $product) { ?>
							<?php if (isset($product['attribute'][$key])) { ?>
							<td><?php echo $product['attribute'][$key]; ?></td>
							<?php } else { ?>
							<td></td>
							<?php } ?>
							<?php } ?>
							</tr>
						
						<?php } ?>
						</tbody>
						<?php } ?>
						<tbody>
							<tr>
								<td></td>
								<?php foreach ($products as $product) { ?>
								<td><input type="button" value="<?php echo $button_cart; ?>" class="btn btn-cart" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');" /></td>
								<?php } ?>
							</tr>
							<tr>
								<td></td>
								<?php foreach ($products as $product) { ?>
								<td class="remove"><a href="<?php echo $product['remove']; ?>" class="button btn btn-default btn-sm"> <i class="fa fa-times-circle"></i>	<?php echo $button_remove; ?></a></td>
								<?php } ?>
							</tr>
						</tbody>
					</table>
				
				</div>

				<div class="buttons">
					<a href="<?php echo $continue; ?>" class="button btn btn-default btn-inverse"><span><?php echo $button_continue; ?></span></a>
				</div>

				<?php } else { ?>

				<div class="content empty">
					<p><?php echo $text_empty; ?></p>
					<div class="buttons">
						<a href="<?php echo $continue; ?>" class="button btn btn-default"><span><?php echo $button_continue; ?></span></a>
					</div>
				</div>
				
				<?php } ?>

		</div>

		</div> <!-- #content -->

		<?php echo $content_bottom; ?>

	</div>

	<script type="text/javascript">

		$(document).ready(function() {
			$('#next-column').click(function(event) {
				event.preventDefault();
				$('#compare-wrapper').animate({scrollLeft:'+=95'}, 'medium');        
			});
			$('#previous-column').click(function(event) {
				event.preventDefault();
				$('#compare-wrapper').animate({scrollLeft:'-=95'}, 'medium');        
			});
		});

	</script>
	
<?php echo $footer; ?>