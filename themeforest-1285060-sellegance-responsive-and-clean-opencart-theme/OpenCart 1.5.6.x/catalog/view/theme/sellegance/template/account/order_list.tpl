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

		<?php echo $column_left; ?>

		<section id="maincontent" class="<?php echo $main; ?>" role="main">

			<div class="mainborder">

				<?php if ($column_left || $column_right) { ?>
					<div id="toggle_sidebar"></div>
				<?php } ?>

				<?php if ($orders) { ?>

				<div id="order-list">
							
					<?php foreach ($orders as $order) { ?>

						<div class="contentset">
							<div class="inner"><span><?php echo $text_order_id; ?> <?php echo $order['order_id']; ?></span></div>
						</div>

						<div class="row">
							
							<div class="col-sm-3">
								<small><?php echo $text_date_added; ?></small> <?php echo $order['date_added']; ?><br>
								<small><?php echo $text_status; ?></small> <?php echo $order['status']; ?> <br/>
								
							</div>

							<div class="order-contents col-sm-4">
								<b><?php echo $text_customer; ?></b> <?php echo $order['name']; ?>
							</div>

							<div class="col-sm-2">
								<?php echo $text_products; ?> <?php echo $order['products']; ?> <br/>
								<b><?php echo $text_total; ?></b> <?php echo $order['total']; ?>
							</div>
							
							<div class="col-sm-3 list-actions">
								<a href="<?php echo $order['href']; ?>" class="button btn btn-default btn-sm" title="<?php echo $button_view; ?>"><?php echo $button_view; ?></a>
								<a href="<?php echo $order['reorder']; ?>" class="button btn btn-default btn-sm btn-cart" title="<?php echo $button_reorder; ?>"><?php echo $button_reorder; ?></a>
							</div>

						</div>
						
					<?php } ?>

				</div>

				<div class="pagination"><?php echo $pagination; ?></div>

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