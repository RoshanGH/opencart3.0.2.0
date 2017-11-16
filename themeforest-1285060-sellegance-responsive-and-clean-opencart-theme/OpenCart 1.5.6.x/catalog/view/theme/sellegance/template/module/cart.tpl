<section id="cart" class="cart-block">

	<div class="heading">
		<h4><a href="<?php echo $cart; ?>"><?php echo $heading_title; ?></a></h4>
		<div class="minicart-total">
			<a href="<?php echo $cart; ?>" class="cart-total"><?php echo $text_items; ?></a>
		</div>
	</div>
	<div class="details">
		<div class="arrow">
			<div class="cart-icon">
				<span class="cart-icon-body"></span>
				<span class="cart-icon-handle"></span>
			</div>
		</div>
		<div class="content">
			
			<?php if ($products || $vouchers) { ?>
			
			<div class="mini-cart-info">
				<table class="items">
					<?php foreach ($products as $product) { ?>
					<tr>
						<td class="image"><?php if ($product['thumb']) { ?>
							<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
							<?php } ?></td>
						<td class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
							<div>
								<?php foreach ($product['option'] as $option) { ?>
								- <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small><br />
								<?php } ?>
							</div>
							<div>
							<?php if ($product['recurring']): ?>
								- <small><?php echo $text_payment_profile ?> <?php echo $product['profile']; ?></small><br />
							<?php endif; ?>
							</div>
						</td>
						<td class="quantity"><?php echo $product['quantity']; ?></td>
						<td class="total"><?php echo $product['total']; ?></td>
						<td class="remove"><a title="<?php echo $button_remove; ?>" onclick="(getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') ? location = 'index.php?route=checkout/cart&remove=<?php echo $product['key']; ?>' : $('.cart-block').load('index.php?route=module/cart&remove=<?php echo $product['key']; ?>' + ' .cart-block > *');"> <i class="fa fa-times-circle"></i></a></td>
					</tr>
					<?php } ?>
					<?php foreach ($vouchers as $voucher) { ?>
					<tr>
						<td class="image"></td>
						<td class="name"><?php echo $voucher['description']; ?></td>
						<td class="quantity">x&nbsp;1</td>
						<td class="total"><?php echo $voucher['amount']; ?></td>
						<td class="remove"><a title="<?php echo $button_remove; ?>" onclick="(getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') ? location = 'index.php?route=checkout/cart&remove=<?php echo $voucher['key']; ?>' : $('.cart-block').load('index.php?route=module/cart&remove=<?php echo $voucher['key']; ?>' + ' .cart-block > *');" > <i class="fa fa-times-circle"></i></a></td>
					</tr>
					<?php } ?>
				</table>
			</div>

			<div class="mini-cart-total">
				<table class="total">
					<?php foreach ($totals as $total) { ?>
					<tr>
						<td class="right"><b><?php echo $total['title']; ?>:</b></td>
						<td class="right"><?php echo $total['text']; ?></td>
					</tr>
					<?php } ?>
				</table>
			</div>

			<div class="checkout">
				<a href="<?php echo $cart; ?>" class="button btn btn-default btn-inverse btn-block btn-sm"><?php echo $text_cart; ?></a>
				<a href="<?php echo $checkout; ?>" class="button btn btn-cart btn-default btn-block btn-sm"><?php echo $text_checkout; ?></a>
			</div>

			<?php } else { ?>

			<div class="empty white"><?php echo $text_empty; ?></div>

			<?php } ?>

			<a id="closecart" title="Close" onclick="$('#cart').removeClass('active');"><i class="fa fa-times-circle"></i></a>

		</div>
	</div>
</section>