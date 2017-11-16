<?php echo $header; ?>
<div class="centralbox">
		<div class="container">
			<div class="container-inner">

	<?php echo $content_top; ?>

	<header class="page-header">
		<h1><?php echo $heading_title; ?>
			<?php if ($weight) { ?>
			<span class="weight">(<?php echo $weight; ?>)</span>
			<?php } ?>
		</h1>
	</header>

	<ul class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
			<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
		<?php } ?>
	</ul>

		<?php if ($attention) { ?>
		<div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $attention; ?>
			<button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
		<?php } ?>
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

	<div class="row">

		<div id="content" class="col-md-12 shopping-cart" role="main">

			<div class="mainborder">

					<div class="row">

						<div id="cart-info" class="col-md-8">

							<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="cart-contents">

									<table class="table">
										<thead>
											<tr>
												<th class="image"><?php echo $column_image; ?></th>
												<th class="name text-left"><?php echo $column_name; ?></th>
												<th class="quantity text-left"><?php echo $column_quantity; ?></th>
												<th class="price text-right"><?php echo $column_price; ?></th>
												<th class="total text-right"><?php echo $column_total; ?></th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<?php foreach ($products as $product) { ?>
											<tr>
													<td class="image">
													<?php if ($product['thumb']) { ?>
														<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>"  class="img-responsive" /></a>
													<?php } ?>
												</td>

												<td class="name">
													<a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>

													<?php if (!$product['stock']) { ?>
														<span class="text-danger">***</span>
													<?php } ?>

														<div><?php echo $product['model']; ?></div>

													<?php if ($product['option']) { ?>
														<?php foreach ($product['option'] as $option) { ?>
														<small>- <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small><br />
														<?php } ?>
													<?php } ?>

													<?php if ($product['reward']) { ?>
														<small><?php echo $product['reward']; ?></small><br />
													<?php } ?>

													<?php if ($product['recurring']) { ?>
														<span class="label label-info"><?php echo $text_recurring_item; ?></span> <small><?php echo $product['recurring']; ?></small><br />
													<?php } ?>
												</td>
												
												<td class="text-left quantity">
													<div class="input-group btn-block" style="min-width:84px; max-width: 100px;">
													<input type="text" name="quantity[<?php echo $product['cart_id']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" class="form-control input-sm" />
														<span class="input-group-btn">
														<button type="submit" data-toggle="tooltip" title="<?php echo $button_update; ?>" class="btn btn-default btn-sm"><i class="fa fa-refresh"></i></button>
														</span>
													</div>
												</td>

												<td class="price"><?php echo $product['price']; ?></td>

												<td class="total"><?php echo $product['total']; ?></td>
												<td><button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-remove btn-sm" onclick="cart.remove('<?php echo $product['cart_id']; ?>');">&times;</button></td>

											</tr>

											<?php } ?>

											<?php foreach ($vouchers as $vouchers) { ?>
											<tr>
											<td class="image"></td>
											<td class="name"><?php echo $vouchers['description']; ?></td>
											<td class="model"></td>
											<td class="quantity">
												<div class="input-group btn-block" style="min-width:120px; max-width: 200px;">
													<input type="text" name="" value="1" size="1" disabled="disabled" class="form-control" />
													<span class="input-group-btn"><button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-default" onclick="voucher.remove('<?php echo $vouchers['key']; ?>');"><i class="fa fa-times-circle"></i></button></span>
												</div>
											</td>
											<td class="price"><?php echo $vouchers['amount']; ?></td>
											<td class="total"><?php echo $vouchers['amount']; ?></td>
											</tr>
											<?php } ?>
										</tbody>
									</table>

							</form>

						</div>

						<div class="col-md-4">

								<div id="cart-module">

							<?php if ($coupon || $voucher || $reward || $shipping) { ?>

								<h4 class="inner"><?php echo $text_next; ?></h4>

								<p><?php echo $text_next_choice; ?></p>

								<div class="panel-group" id="accordion"><?php echo $coupon; ?><?php echo $voucher; ?><?php echo $reward; ?><?php echo $shipping; ?></div>
							
							<?php } ?>

							<div id="total-cart">

							<table id="total" class="table">
								<?php foreach ($totals as $total) { ?>
								<tr>
										<td class="text-right"><?php echo $total['title']; ?>:</td>
									<td class="text-right"><?php echo $total['text']; ?></td>
								</tr>
								<?php } ?>
							</table>

							<div class="buttons">
									<a href="<?php echo $checkout; ?>" id="button-checkout" class="button btn btn-default btn-cart btn-block"><?php echo $button_checkout; ?></a>
								<a href="<?php echo $continue; ?>" id="continue-shopping" class="button btn btn-default btn-block"><?php echo $button_shopping; ?></a>
							</div>

						</div>

					</div>

				</div>

			</div> <!-- .mainborder -->

		</div><!-- #content -->

	</div> <!-- .row -->
	
	<?php echo $content_bottom; ?>

<?php echo $footer; ?>