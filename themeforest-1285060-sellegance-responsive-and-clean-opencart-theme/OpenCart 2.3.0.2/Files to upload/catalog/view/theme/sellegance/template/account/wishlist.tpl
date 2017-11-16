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

					<div class="table-responsive">
					       <table class="table">
					         <thead>
					           <tr>
					             <td class="text-center"><?php echo $column_image; ?></td>
					             <td class="text-left"><?php echo $column_name; ?></td>
					             <td class="text-left"><?php echo $column_model; ?></td>
					             <td class="text-right"><?php echo $column_stock; ?></td>
					             <td class="text-right"><?php echo $column_price; ?></td>
					             <td class="text-right"><?php echo $column_action; ?></td>
					           </tr>
					         </thead>
					         <tbody>
					           <?php foreach ($products as $product) { ?>
					           <tr>
					             <td class="text-center"><?php if ($product['thumb']) { ?>
					               <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
					               <?php } ?></td>
					             <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></td>
					             <td class="text-left"><?php echo $product['model']; ?></td>
					             <td class="text-right"><?php echo $product['stock']; ?></td>
					             <td class="text-right"><?php if ($product['price']) { ?>
					               <div class="price">
					                 <?php if (!$product['special']) { ?>
					                 <?php echo $product['price']; ?>
					                 <?php } else { ?>
					                 <b><?php echo $product['special']; ?></b> <s><?php echo $product['price']; ?></s>
					                 <?php } ?>
					               </div>
					               <?php } ?></td>
					             <td class="text-right"><button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');" data-toggle="tooltip" title="<?php echo $button_cart; ?>" class="btn btn-cart"><i class="fa fa-shopping-cart"></i></button>
					               <a href="<?php echo $product['remove']; ?>" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-remove">&times;</a></td>
					           </tr>
					           <?php } ?>
					         </tbody>
					       </table>
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