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

				<table class="table table-bordered">

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
								<b><?php echo $text_payment_method; ?></b> <?php echo $payment_method; ?><br />
								<?php if ($shipping_method) { ?>
									<b><?php echo $text_shipping_method; ?></b> <?php echo $shipping_method; ?>
								<?php } ?>
							</td>
						</tr>
					</tbody>

				</table>

				<table class="table table-bordered">

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

				<table class="table table-bordered table-adjust">

					<thead>
						<tr>
							<td><?php echo $column_name; ?></td>
							<td><?php echo $column_model; ?></td>
							<td><?php echo $column_quantity; ?></td>
							<td><?php echo $column_price; ?></td>
							<td><?php echo $column_total; ?></td>
						</tr>
					</thead>

					<tbody>

						<?php foreach ($products as $product) { ?>

							<tr>
								<td>
									<b><?php echo $product['name']; ?></b>

									<?php foreach ($product['option'] as $option) { ?>
										<br />&nbsp;
										<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
									<?php } ?>
									<br />
									<small>
										<a href="<?php echo $product['return']; ?>" class="" title="<?php echo $button_return; ?>" ><?php echo $button_return; ?>  &rarr;</a>
									</small>
								</td>
								<td><?php echo $product['model']; ?></td>
								<td class="right"><?php echo $product['quantity']; ?></td>
								<td class="right"><?php echo $product['price']; ?></td>
								<td class="right"><?php echo $product['total']; ?></td>
							</tr>

						<?php } ?>

						<?php foreach ($vouchers as $voucher) { ?>

							<tr>
								<td><?php echo $voucher['description']; ?></td>
								<td></td>
								<td class="right">1</td>
								<td class="right"><?php echo $voucher['amount']; ?></td>
								<td class="right"><?php echo $voucher['amount']; ?></td>
							</tr>
						<?php } ?>

					</tbody>

					<tfoot>
						<?php foreach ($totals as $total) { ?>
						<tr>
							<td colspan="4" class="right"><b><?php echo $total['title']; ?>:</b></td>
							<td class="right"><?php echo $total['text']; ?></td>
						</tr>
						<?php } ?>
					</tfoot>
				</table>

				<?php if ($comment) { ?>
				<table class="table table-bordered">
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
					<h4 class="inner">
						<span><?php echo $text_history; ?></span>
					</h4>
				</div>
				<table class="table table-bordered">
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

				<div class="form-actions buttons">
					<a href="<?php echo $continue; ?>" class="button btn btn-default btn-inverse"><span><?php echo $button_continue; ?></span></a>
				</div>

			</div>

		</section> <!-- #maincontent -->

		<?php echo $column_right; ?>

	</div> <!-- .row -->

	<?php echo $content_bottom; ?>

<?php echo $footer; ?> 