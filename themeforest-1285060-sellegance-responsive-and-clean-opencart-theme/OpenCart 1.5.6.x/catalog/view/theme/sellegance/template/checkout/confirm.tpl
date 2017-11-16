<?php if (!isset($redirect)) { ?>

<div class="row">

	<div class="checkout-confirm col-md-12">
	
		<table class="table table-confirm table-bordered">
	
			<thead>
				<tr>
					<td><?php echo $column_name; ?></td>
					<td><?php echo $column_model; ?></td>
					<td><?php echo $column_quantity; ?></td>
					<td class="price"><?php echo $column_price; ?></td>
					<td class="total"><?php echo $column_total; ?></td>
				</tr>
			</thead>
	
			<tbody>
				
				<?php foreach ($products as $product) { ?>

					<?php if($product['recurring']): ?>
					<tr>
						<td colspan="5"><i class="fa fa-repeat"></i><strong><?php echo $text_recurring_item ?></strong><br>
							<?php echo $product['profile_description'] ?>
						</td>
					</tr>
					<?php endif; ?>
	
					<tr>
						<td class="name">
							<a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
							<?php foreach ($product['option'] as $option) { ?>
							<br />
							<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
							<?php } ?>
							<?php if($product['recurring']): ?>
								<br><small><span><?php echo $text_payment_profile ?>:</span> <?php echo $product['profile_name'] ?></small>
							<?php endif; ?>
						</td>
						<td class="model"><?php echo $product['model']; ?></td>
						<td class="quantity"><?php echo $product['quantity']; ?></td>
						<td class="price right"><?php echo $product['price']; ?></td>
						<td class="total right"><?php echo $product['total']; ?></td>
					</tr>
	
				<?php } ?>
	
				<?php foreach ($vouchers as $voucher) { ?>
	
					<tr>
						<td class="name"><?php echo $voucher['description']; ?></td>
						<td class="model"></td>
						<td class="quantity">1</td>
						<td class="price right"><?php echo $voucher['amount']; ?></td>
						<td class="total right"><?php echo $voucher['amount']; ?></td>
					</tr>
	
				<?php } ?>
	
			</tbody>
	
			<tfoot>
				
				<?php if ($totals) { $i = 0; $j = count($totals); } ?>
	
				<?php foreach ($totals as $total) { ?>
	
					<tr>
						<td class="price"></td>
						<td colspan="3" class="right">
							<b><?php echo $total['title']; ?>:</b>
						</td>
						<td class="total <?php if($i == $j-1) echo 'last'; ?> right">
							<?php echo $total['text']; ?>
						</td>
					</tr>
	
				<?php $i++; } ?>
	
			</tfoot>
	
		</table>
	
		<div class="payment"><?php echo $payment; ?></div>
	
	</div>
	
</div>

<?php } else { ?>

<script type="text/javascript"><!--

	location = '<?php echo $redirect; ?>';

//--></script> 

<?php } ?>