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

		<?php if ($success) { ?>
		<div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
		  <button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
		<?php } ?>
		<?php if ($error_warning) { ?>
		<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
		  <button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
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

				<table class="table">

					<thead>
						<tr>
							<td colspan="2">
							<?php echo $text_order_detail; ?>
							</td>
						</tr>
					</thead>

					<tbody>
						<tr>
							<td style="width: 50%;">
								<?php if ($invoice_no) { ?>
									<b><?php echo $text_invoice_no; ?></b> <?php echo $invoice_no; ?><br />
								<?php } ?>

								<b><?php echo $text_order_id; ?></b> #<?php echo $order_id; ?><br />
								<b><?php echo $text_date_added; ?></b> <?php echo $date_added; ?>
							</td>
							<td>
								<?php if ($payment_method) { ?>
									<b><?php echo $text_payment_method; ?></b> <?php echo $payment_method; ?><br />
								<?php } ?>
								<?php if ($shipping_method) { ?>
									<b><?php echo $text_shipping_method; ?></b> <?php echo $shipping_method; ?>
								<?php } ?>
							</td>
						</tr>
					</tbody>

				</table>

				<table class="table">

					<thead>
						<tr>
							<td>
							<?php echo $text_payment_address; ?>
							</td>
							<?php if ($shipping_address) { ?>
							<td>
							<?php echo $text_shipping_address; ?>
							</td>
							<?php } ?>
						</tr>
					</thead>

					<tbody>
						<tr>
							<td class="left"><?php echo $payment_address; ?></td>
							<?php if ($shipping_address) { ?>
							<td class="left"><?php echo $shipping_address; ?></td>
							<?php } ?>
						</tr>
					</tbody>

				</table>

				<table class="table table-bordered">

					<thead>
						<tr>
							<td><?php echo $column_name; ?></td>
							<td><?php echo $column_quantity; ?></td>
							<td><?php echo $column_price; ?></td>
							<td><?php echo $column_total; ?></td>
							<?php if ($products) { ?>
							<td style="width: 5%;" class="hidden-xs"></td>
							<?php } ?>
						</tr>
					</thead>

					<tbody>

						<?php foreach ($products as $product) { ?>

							<tr>
								<td>
									<b><?php echo $product['name']; ?></b><br>
									<?php echo $column_model; ?>: <?php echo $product['model']; ?>

									<?php foreach ($product['option'] as $option) { ?>
										<br />&nbsp;
										<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
									<?php } ?>
									<br><br><p class="visible-xs" style="white-space: nowrap;">
										<?php if ($product['reorder']) { ?>
									  <a href="<?php echo $product['reorder']; ?>" data-toggle="tooltip" title="<?php echo $button_reorder; ?>" class="btn btn-default btn-cart"><i class="fa fa-shopping-cart"></i></a>
									  <?php } ?>
									  <a href="<?php echo $product['return']; ?>" data-toggle="tooltip" title="<?php echo $button_return; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
									</p>
								</td>
								<td class="right"><?php echo $product['quantity']; ?></td>
								<td class="right"><?php echo $product['price']; ?></td>
								<td class="right"><?php echo $product['total']; ?></td>
								<td class="text-right hidden-xs" style="white-space: nowrap;"><?php if ($product['reorder']) { ?>
								  <a href="<?php echo $product['reorder']; ?>" data-toggle="tooltip" title="<?php echo $button_reorder; ?>" class="btn btn-default btn-cart"><i class="fa fa-shopping-cart"></i></a>
								  <?php } ?>
								  <a href="<?php echo $product['return']; ?>" data-toggle="tooltip" title="<?php echo $button_return; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></td>
							</tr>

						<?php } ?>

						<?php foreach ($vouchers as $voucher) { ?>

							<tr>
								<td><?php echo $voucher['description']; ?></td>
								<td></td>
								<td class="right">1</td>
								<td class="right"><?php echo $voucher['amount']; ?></td>
								<td class="right"><?php echo $voucher['amount']; ?></td>
								<?php if ($products) { ?>
								<td></td>
								<?php } ?>
							</tr>
						<?php } ?>

					</tbody>

					<tfoot>
						<?php foreach ($totals as $total) { ?>
						<tr>
							<td colspan="3" class="right"><b><?php echo $total['title']; ?>:</b></td>
							<td class="right"><?php echo $total['text']; ?></td>
							<?php if ($products) { ?>
							<td class="hidden-xs"></td>
							<?php } ?>
						</tr>
						<?php } ?>
					</tfoot>
				</table>

				<?php if ($comment) { ?>
				<table class="table">
					<thead>
						<tr><td><?php echo $text_comment; ?></td></tr>
					</thead>
					<tbody>
						<tr><td><?php echo $comment; ?></td></tr>
					</tbody>
				</table>
				<?php } ?>

				<?php if ($histories) { ?>
				<div class="contentset center">
					<h4 class="inner"><span><?php echo $text_history; ?></span></h4>
				</div>

				<table class="table">
					<thead>
						<tr>
							<td><?php echo $column_date_added; ?></td>
							<td><?php echo $column_status; ?></td>
							<td><?php echo $column_comment; ?></td>
						</tr>
					</thead>
					<tbody>
						<?php foreach ($histories as $history) { ?>
						<tr>
							<td><?php echo $history['date_added']; ?></td>
							<td><?php echo $history['status']; ?></td>
							<td><?php echo $history['comment']; ?></td>
						</tr>
						<?php } ?>
					</tbody>
				</table>
				<?php } ?>

				<div class="buttons">
					<a href="<?php echo $continue; ?>" class="button btn btn-primary"><?php echo $button_continue; ?></a>
				</div>

			</div>

		</div> <!-- #content -->

		<?php echo $column_right; ?>

	</div> <!-- .row -->

	<?php echo $content_bottom; ?>

<?php echo $footer; ?> 