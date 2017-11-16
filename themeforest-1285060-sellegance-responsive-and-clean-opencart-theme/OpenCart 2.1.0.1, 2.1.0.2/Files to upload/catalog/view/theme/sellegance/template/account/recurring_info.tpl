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
							<td class="left" colspan="2"><?php echo $text_recurring_detail; ?></td>
						</tr>
					</thead>
					<tbody>
					<tr>
						<td class="left" style="width: 50%;">
							<p><b><?php echo $text_recurring_id; ?></b> #<?php echo $recurring['order_recurring_id']; ?></p>
            				<p><b><?php echo $text_date_added; ?></b> <?php echo $recurring['date_added']; ?></p>
							<p><b><?php echo $text_status; ?></b> <?php echo $status_types[$recurring['status']]; ?></p>
							<p><b><?php echo $text_payment_method; ?></b> <?php echo $recurring['payment_method']; ?></p>
						</td>
						<td class="left" style="width: 50%; vertical-align: top;">
							<p><b><?php echo $text_product; ?></b> <a href="<?php echo $recurring['product_link']; ?>"><?php echo $recurring['product_name']; ?></a></p>
							<p><b><?php echo $text_quantity; ?></b> <?php echo $recurring['product_quantity']; ?></p>
							<p><b><?php echo $text_order; ?></b> <a href="<?php echo $recurring['order_link']; ?>">#<?php echo $recurring['order_id']; ?></a></p>
						</td>
					</tr>
					</tbody>
				</table>

				<table class="table table-bordered">
					<thead>
						<tr>
							<td class="left"><?php echo $text_recurring_description; ?></td>
							<td class="left"><?php echo $text_ref; ?></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="left" style="width: 50%;"><p><?php echo $recurring['recurring_description']; ?></p></td>
							<td class="left" style="width: 50%;"><p><?php echo $recurring['reference']; ?></p></td>
						</tr>
					</tbody>
				</table>

				<div class="contentset center">
					<h4 class="inner"><span><?php echo $text_transactions; ?></span></h4>
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
        			<?php if (!empty($recurring['transactions'])) { ?><?php foreach ($recurring['transactions'] as $transaction) { ?>
						<tr>
							<td class="left"><?php echo $transaction['date_added']; ?></td>
							<td class="center"><?php echo $transaction_types[$transaction['type']]; ?></td>
							<td class="right"><?php echo $transaction['amount']; ?></td>
						</tr>
						<?php } }else{ ?>

						<tr>
							<td colspan="3" class="center"><?php echo $text_empty_transactions; ?></td>
						</tr>

					<?php } ?>
					</tbody>
				</table>

				<?php echo $buttons; ?>

			</div>

		</div> <!-- #content -->

		<?php echo $column_right; ?>

	</div> <!-- .row -->

	<?php echo $content_bottom; ?>

<?php echo $footer; ?> 