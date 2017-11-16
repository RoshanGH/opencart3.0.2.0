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
							<td class="left" colspan="2"><?php echo $text_recurring_detail; ?></td>
						</tr>
					</thead>
					<tbody>
					<tr>
						<td class="left" style="width: 50%;">
							<p><b><?php echo $text_recurring_id; ?></b> #<?php echo $profile['order_recurring_id']; ?></p>
							<p><b><?php echo $text_date_added; ?></b> <?php echo $profile['created']; ?></p>
							<p><b><?php echo $text_status; ?></b> <?php echo $status_types[$profile['status']]; ?></p>
							<p><b><?php echo $text_payment_method; ?></b> <?php echo $profile['payment_method']; ?></p>
						</td>
						<td class="left" style="width: 50%; vertical-align: top;">
							<p><b><?php echo $text_product; ?></b> <a href="<?php echo $profile['product_link']; ?>"><?php echo $profile['product_name']; ?></a></p>
							<p><b><?php echo $text_quantity; ?></b> <?php echo $profile['product_quantity']; ?></p>
							<p><b><?php echo $text_order; ?></b> <a href="<?php echo $profile['order_link']; ?>">#<?php echo $profile['order_id']; ?></a></p>
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
							<td class="left" style="width: 50%;"><p><?php echo $profile['profile_description']; ?></p></td>
							<td class="left" style="width: 50%;"><p><?php echo $profile['profile_reference']; ?></p></td>
						</tr>
					</tbody>
				</table>

				<div class="contenset center"><span><?php echo $text_transactions; ?></span></div>

				<table class="table table-bordered">
					<thead>
						<tr>
							<td class="left"><?php echo $column_created; ?></td>
							<td class="center"><?php echo $column_type; ?></td>
							<td class="right"><?php echo $column_amount; ?></td>
						</tr>
					</thead>
					<tbody>
						<?php

						if(!empty($profile['transactions'])){
						foreach ($profile['transactions'] as $transaction) {

						?>
						<tr>
							<td class="left"><?php echo $transaction['created']; ?></td>
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

				<div class="form-actions buttons">
					<?php if($cancel_link){ ?>
						<a href="<?php echo $cancel_link; ?>" class="button btn btn-default" onclick="return confirmCancel();"><?php echo $button_cancel_profile; ?></a>
					<?php } ?>
					<a href="<?php echo $continue; ?>" class="button btn btn-default btn-inverse"><?php echo $button_continue; ?></a>
				</div>

			</div>

		</section> <!-- #maincontent -->

		<?php echo $column_right; ?>

	</div> <!-- .row -->

	<?php echo $content_bottom; ?>

<?php echo $footer; ?> 