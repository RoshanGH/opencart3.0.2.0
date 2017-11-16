<?php if (!isset($redirect)) { ?>

	<div class="checkout-confirm">
	
		<table class="table table-confirm table-hover">
	
			<thead>
				<tr>
					<th><?php echo $column_name; ?></th>
					<th><?php echo $column_model; ?></th>
					<th><?php echo $column_quantity; ?></th>
					<th class="price"><?php echo $column_price; ?></th>
					<th class="total"><?php echo $column_total; ?></th>
				</tr>
			</thead>
	
			<tbody>
				
				<?php foreach ($products as $product) { ?>
					<tr>
						<td class="name">
							<a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
							<?php foreach ($product['option'] as $option) { ?>
							<br />
							<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
							<?php } ?>
							<?php if($product['recurring']){ ?>
								<small><span class="label label-info"><?php echo $text_recurring; ?></span> <?php echo $product['recurring']; ?></small>
							<?php } ?>
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
						<td colspan="2"></td>
						<td class="total-label right">
							<?php echo $total['title']; ?>:
						</td>
						<td class="total-value <?php if($i == $j-1) echo 'last'; ?> right">
							<?php echo $total['text']; ?>
						</td>
					</tr>
	
				<?php $i++; } ?>
	
			</tfoot>
	
		</table>
	
		<div class="payment"><?php echo $payment; ?></div>
	
	</div>

<?php } else { ?>

<script type="text/javascript"><!--

	location = '<?php echo $redirect; ?>';

//--></script> 

<?php } ?>