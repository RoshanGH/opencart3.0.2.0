<div id="cart" >

	<button type="button" class="btn btn-link btn-header" data-loading-text="<?php echo $text_loading; ?>" data-toggle="offcanvas" data-target="#sidecart" data-disable-scrolling="true" data-modal="true">
		<i class="fa fa-shopping-cart"></i> <span id="cart-total"><?php echo $text_items; ?></span>
	</button>

	<?php
	if ($direction=='rtl') { $position = "navmenu-fixed-left"; }
	else { $position = "navmenu-fixed-right"; }
	?>
	
	<ul id="sidecart" class="panel panel-default navmenu <?php echo $position; ?> offcanvas" role="navigation">

		<li>

			<a class="closesidebar" onclick="$('#sidecart').offcanvas('hide');" data-toggle="tooltip" data-placement="left" title="Close"><span class="line-1"></span><span class="line-2"></span><span class="line-3"></span></a>
			
			<h4><a href="<?php echo $cart; ?>"><?php echo $text_cart; ?> <span id="cart-total"><?php echo $text_items; ?></span></a></h4>
			
		</li>
		
		<?php if ($products || $vouchers) { ?>
			<li>
				<table class="table table-items">
					<?php foreach ($products as $product) { ?>
					<tr>
						<td class="text-center" width="20%"><?php if ($product['thumb']) { ?>
							<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>
							<?php } ?></td>
						<td class="text-left" width="70%"><span class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></span>
							<?php if ($product['option']) { ?>
							<?php foreach ($product['option'] as $option) { ?>
							<br />
							- <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small>
							<?php } ?>
							<?php } ?>
							<?php if ($product['recurring']) { ?>
							<br />
							- <small><?php echo $text_recurring; ?> <?php echo $product['recurring']; ?></small>
							<?php } ?>
							<br><span class="badge"><?php echo $product['quantity']; ?></span> <span class="cart-price"><?php echo $product['total']; ?></span>
						</td>
						<td class="text-center" width="10%"><button type="button" onclick="cart.remove('<?php echo $product['cart_id']; ?>'); $(this).tooltip('destroy')" data-toggle="tooltip" data-placement="left" title="<?php echo $button_remove; ?>" class="btn btn-remove">&times;</button></td>
					</tr>
					<?php } ?>
					<?php foreach ($vouchers as $voucher) { ?>
					<tr>
						<td class="text-center"></td>
						<td class="text-left"><?php echo $voucher['description']; ?> <br> <span class="badge">1</span> <?php echo $voucher['amount']; ?></td>
						<td class="text-center text-danger"><button type="button" onclick="voucher.remove('<?php echo $voucher['key']; ?>'); $(this).tooltip('destroy')" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-remove">&times;</button></td>
					</tr>
					<?php } ?>
				</table>
				<div class="cart-summary">
					<table class="table totals">
						<?php foreach ($totals as $total) { ?>
						<tr>
							<td class="text-right"><?php echo $total['title']; ?></td>
							<td class="text-right"><?php echo $total['text']; ?></td>
						</tr>
						<?php } ?>
					</table>
					<div class="text-right">
						<a href="<?php echo $cart; ?>" class="btn btn-primary btn-block"><?php echo $text_cart; ?></a>
						<a href="<?php echo $checkout; ?>" class="btn btn-default btn-cart btn-block"><?php echo $text_checkout; ?></a>
					</div>
				</div>
			</li>
		<?php } else { ?>
			<li>
				<p class="empty  white text-center">
				<i class="fa fa-shopping-cart fa-5x"></i><br>
				<?php echo $text_empty; ?></p>
			</li>
		<?php } ?>
	
	</ul>

</div>