<?php echo $header; ?>

	<?php echo $content_top; ?>

	<div class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
			<?php echo $breadcrumb['separator']; ?>
			<a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
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

		<?php echo $column_left ?>
		
		<section id="maincontent" class="<?php echo $main; ?>" role="main">

			<div class="mainborder">

				<?php if ($column_left || $column_right) { ?>
					<div id="toggle_sidebar"></div>
				<?php } ?>

				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="payment" class="form" role="form">

					<fieldset class="subheading">

						<legend><?php echo $text_your_payment; ?></legend>

						<div class="form-group">
							<label for="tax"><?php echo $entry_tax; ?></label>
							<div class="controls">
								<input type="text" name="tax" id="tax" value="<?php echo $tax; ?>" class="form-control" />
							</div>
						</div>

						<div class="form-group">
							<label><?php echo $entry_payment; ?></label>

							<div class="radio">
								<label>
									<?php if ($payment == 'cheque') { ?>
										<input type="radio" name="payment" value="cheque" id="cheque" checked="checked" />
									<?php } else { ?>
										<input type="radio" name="payment" value="cheque" id="cheque" />
									<?php } ?>
									<?php echo $text_cheque; ?>
								</label>
							</div>

							<div class="radio">
								<label>
									<?php if ($payment == 'paypal') { ?>
										<input type="radio" name="payment" value="paypal" id="paypal" checked="checked" />
									<?php } else { ?>
										<input type="radio" name="payment" value="paypal" id="paypal" />
									<?php } ?>
									<?php echo $text_paypal; ?>
								</label>
							</div>

							<div class="radio">
								<label>
									<?php if ($payment == 'bank') { ?>
										<input type="radio" name="payment" value="bank" id="bank" checked="checked" />
									<?php } else { ?>
										<input type="radio" name="payment" value="bank" id="bank" />
									<?php } ?>
									<?php echo $text_bank; ?>
								</label>
							</div>
						</div>

						<div class="form-group payment" id="payment-cheque">
							<label for="cheque_account"><?php echo $entry_cheque; ?></label>
							<input type="text" name="cheque" id="cheque_account" value="<?php echo $cheque; ?>" class="form-control" />
						</div>

						<div class="form-group payment" id="payment-paypal">
							<label for="paypal_account"><?php echo $entry_paypal; ?></label>
							<input type="text" name="paypal" id="paypal_account" value="<?php echo $paypal; ?>" class="form-control" />
						</div>

						<div class="form-group payment" id="payment-bank">

							<div class="form-group">
								<label for="bank_name"><?php echo $entry_bank_name; ?></label>
								<input type="text" name="bank_name" id="bank_name" value="<?php echo $bank_name; ?>" class="form-control" />
							</div>
							<div class="form-group">
								<label for="bank_branch_number"><?php echo $entry_bank_branch_number; ?></label>
								<input type="text" name="bank_branch_number" id="bank_branch_number" value="<?php echo $bank_branch_number; ?>" class="form-control" />
							</div>
							<div class="form-group">
								<label for="bank_swift_code"><?php echo $entry_bank_swift_code; ?></label>
								<input type="text" name="bank_swift_code" id="bank_swift_code" value="<?php echo $bank_swift_code; ?>" class="form-control" />
							</div>
							<div class="form-group">
								<label for="bank_account_name"><?php echo $entry_bank_account_name; ?></label>
								<input type="text" name="bank_account_name" id="bank_account_name" value="<?php echo $bank_account_name; ?>" class="form-control" />
							</div>
							<div class="form-group">
								<label for="bank_account_number"><?php echo $entry_bank_account_number; ?></label>
								<input type="text" name="bank_account_number" id="bank_account_number" value="<?php echo $bank_account_number; ?>" class="form-control" />
							</div>

						</div>

					</fieldset>

					<div class="form-actions buttons">
						<a href="<?php echo $back; ?>" class="button btn btn-default"><?php echo $button_back; ?></a>
						<input type="submit" value="<?php echo $button_continue; ?>" class="button btn btn-default btn-inverse" />
					</div>

				</form>

			</div>
			
		</section> <!-- #maincontent -->

		<?php echo $column_right; ?>

	</div> <!-- .row -->

	<?php echo $content_bottom; ?>
	
	<script type="text/javascript"><!--

		$('input[name=\'payment\']').bind('change', function() {
			$('.payment').hide();
			
			$('#payment-' + this.value).show();
		});

		$('input[name=\'payment\']:checked').trigger('change');

	//--></script>

<?php echo $footer; ?> 