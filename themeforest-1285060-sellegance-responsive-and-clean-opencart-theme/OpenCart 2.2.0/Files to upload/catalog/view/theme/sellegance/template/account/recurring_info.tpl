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
	
	<?php if ($error_warning) { ?>
		<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
	<?php } ?>

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

		<?php echo $column_left; ?>

		<div id="content" class="<?php echo $class; ?>" role="main">

			<div class="mainborder">

				<table class="table table-bordered">
					<thead>
						<tr>
						<td class="text-left" colspan="2"><?php echo $text_recurring_detail; ?></td>
						</tr>
					</thead>
					<tbody>
					<tr>
						<td class="text-left" style="width: 50%;"><b><?php echo $text_order_recurring_id; ?></b> #<?php echo $order_recurring_id; ?><br />
							<b><?php echo $text_date_added; ?></b> <?php echo $date_added; ?><br />
							<b><?php echo $text_status; ?></b> <?php echo $status; ?><br />
							<b><?php echo $text_payment_method; ?></b> <?php echo $payment_method; ?></td>
						<td class="text-left" style="width: 50%;"><b><?php echo $text_order_id; ?></b> <a href="<?php echo $order; ?>">#<?php echo $order_id; ?></a><br />
							<b><?php echo $text_product; ?></b> <a href="<?php echo $product; ?>"><?php echo $product_name; ?></a><br />
							<b><?php echo $text_quantity; ?></b> <?php echo $product_quantity; ?></td>
					</tr>
					</tbody>
				</table>

				<table class="table table-bordered">
					<thead>
						<tr>
						<td class="text-left"><?php echo $text_description; ?></td>
						<td class="text-left"><?php echo $text_reference; ?></td>
						</tr>
					</thead>
					<tbody>
						<tr>
						<td class="text-left" style="width: 50%;"><?php echo $recurring_description; ?></td>
						<td class="text-left" style="width: 50%;"><?php echo $reference; ?></td>
						</tr>
					</tbody>
				</table>

				<div class="contentset center">
					<h4 class="inner"><span><?php echo $text_transaction; ?></span></h4>
				</div>

				<table class="table table-bordered">
					<thead>
						<tr>
							<td class="left"><?php echo $column_date_added; ?></td>
							<td class="center"><?php echo $column_type; ?></td>
							<td class="right"><?php echo $column_amount; ?></td>
						</tr>
					</thead>
					<tbody>
					<?php if ($transactions) { ?>
					<?php foreach ($transactions as $transaction) { ?>
						<tr>
						<td class="text-left"><?php echo $transaction['date_added']; ?></td>
						<td class="text-left"><?php echo $transaction['type']; ?></td>
						<td class="text-right"><?php echo $transaction['amount']; ?></td>
						</tr>
					<?php } ?>
					<?php } else { ?>
						<tr>
						<td colspan="3" class="text-center"><?php echo $text_no_results; ?></td>
						</tr>
					<?php } ?>
					</tbody>
				</table>

				<?php echo $recurring; ?>

			</div>

		</div> <!-- #content -->

		<?php echo $column_right; ?>

	</div> <!-- .row -->

	<?php echo $content_bottom; ?>

<?php echo $footer; ?> 