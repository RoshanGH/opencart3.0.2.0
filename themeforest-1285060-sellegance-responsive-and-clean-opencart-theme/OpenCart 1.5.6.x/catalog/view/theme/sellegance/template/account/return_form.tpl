<?php echo $header; ?>

	<?php echo $content_top; ?>

	<div class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
		<?php } ?>
	</div>
	
	<header class="page-header">

		<h1><?php echo $heading_title; ?></h1>

		<?php if ($error_warning) { ?>
		<div class="warning"><?php echo $error_warning; ?></div>
		<?php } ?>

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

				<?php echo $text_description; ?>

				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="return" class="form" role="form">

					<fieldset class="subheading">
						
						<legend><?php echo $text_order; ?></legend>

						<div class="row">
							<div class="form-group col-sm-6">
								<label for="firstname">
									<span class="required">*</span> <?php echo $entry_firstname; ?>
								</label>
								<input type="text" name="firstname" id="firstname" value="<?php echo $firstname; ?>" title="<?php echo $this->language->get('error_firstname'); ?>" class="form-control required" required />
								<?php if ($error_firstname) { ?>
								<span class="error"><?php echo $error_firstname; ?></span>
								<?php } ?>
							</div>

							<div class="form-group col-sm-6">
								<label for="lastname">
									<span class="required">*</span> <?php echo $entry_lastname; ?>
								</label>
								<input type="text" name="lastname" id="lastname" value="<?php echo $lastname; ?>" title="<?php echo $this->language->get('error_lastname'); ?>" class="form-control required" required />
								<?php if ($error_lastname) { ?>
								<span class="error"><?php echo $error_lastname; ?></span>
								<?php } ?>
							</div>
						</div>

						<div class="form-group">
							<label for="email">
								<span class="required">*</span> <?php echo $entry_email; ?>
							</label>
							<input type="email" name="email" id="email" value="<?php echo $email; ?>"  title="<?php echo $this->language->get('error_email'); ?>" class="form-control required email" required />
							<?php if ($error_email) { ?>
							<span class="error"><?php echo $error_email; ?></span>
							<?php } ?>
						</div>

						<div class="form-group">
							<label for="telephone">
								<span class="required">*</span> <?php echo $entry_telephone; ?>
							</label>
							<input type="text" name="telephone" id="telephone" value="<?php echo $telephone; ?>" title="<?php echo $this->language->get('error_telephone'); ?>" class="form-control required" required />
							<?php if ($error_telephone) { ?>
							<span class="error"><?php echo $error_telephone; ?></span>
							<?php } ?>
						</div>

						<div class="row">
							<div class="form-group col-md-8">
								<label for="order_id">
									<span class="required">*</span> <?php echo $entry_order_id; ?>
								</label>
								<input type="text" name="order_id" id="order_id" value="<?php echo $order_id; ?>" title="<?php echo $this->language->get('error_order_id'); ?>" class="form-control required" required />
								<?php if ($error_order_id) { ?>
								<span class="error"><?php echo $error_order_id; ?></span>
								<?php } ?>
							</div>
							
							<div class="form-group col-md-4">
								<label for="date_ordered"><?php echo $entry_date_ordered; ?></label>
								<input type="text" name="date_ordered" id="date_ordered" value="<?php echo $date_ordered; ?>" class="form-control date" />
							</div>
						</div>

					</fieldset>

					<fieldset class="subheading">
						
						<legend><?php echo $text_product; ?></legend>
								
							
							<div class="form-group">
								<label for="product">
									<span class="required">*</span> <?php echo $entry_product; ?>
								</label>
								<input type="text" name="product" id="product" value="<?php echo $product; ?>" title="<?php echo $this->language->get('error_product'); ?>" class="form-control required" required />
								<?php if ($error_product) { ?>
									<span class="error"><?php echo $error_product; ?></span>
								<?php } ?>
							</div>

							<div class="row">	
								<div class="form-group col-sm-8">
									<label for="model">
										<span class="required">*</span> <?php echo $entry_model; ?>
									</label>
									<input type="text" name="model" id="model" value="<?php echo $model; ?>" title="<?php echo $this->language->get('error_model'); ?>" class="form-control required" required />
									<?php if ($error_model) { ?>
									<span class="error"><?php echo $error_model; ?></span>
									<?php } ?>
								</div>
							
								<div class="form-group col-sm-4">
									<label for="quantity">
										<?php echo $entry_quantity; ?>
									</label>
									<input type="text" name="quantity" id="quantity" value="<?php echo $quantity; ?>" class="form-control" />
								</div>
						  	</div>
						  	<div class="form-group">

						  		<label>
						  			<span class="required">*</span> <?php echo $entry_reason; ?>
						  		</label>

					  			<?php foreach ($return_reasons as $return_reason) { ?>

					  				<div class="radio">
						  				<label>
										<?php if ($return_reason['return_reason_id'] == $return_reason_id) { ?>
											<input type="radio" name="return_reason_id" value="<?php echo $return_reason['return_reason_id']; ?>" id="return-reason-id<?php echo $return_reason['return_reason_id']; ?>" checked="checked" />
											<?php echo $return_reason['name']; ?>
										<?php } else { ?>
											<input type="radio" name="return_reason_id" value="<?php echo $return_reason['return_reason_id']; ?>" id="return-reason-id<?php echo $return_reason['return_reason_id']; ?>" />
											<?php echo $return_reason['name']; ?>
										<?php  } ?>
										</label>
									</div>
	
								<?php  } ?>
	
								<?php if ($error_reason) { ?>
									<span class="error"><?php echo $error_reason; ?></span>
								<?php } ?>

						  	</div>

						  	<div class="form-group">

						  		<label><?php echo $entry_opened; ?></label>

						  		<div class="clearfix">
						  			<label class="radio-inline">
										<?php if ($opened) { ?>
											<input type="radio" name="opened" value="1" checked="checked" />
										<?php } else { ?>
											<input type="radio" name="opened" value="1" />
										<?php } ?>
										<?php echo $text_yes; ?>
									</label>
									<label class="radio-inline">
										<?php if (!$opened) { ?>
											<input type="radio" name="opened" value="0" checked="checked" />
										<?php } else { ?>
											<input type="radio" name="opened" value="0" />
										<?php } ?>
										<?php echo $text_no; ?>
									</label>
								</div>

						  	</div>

						  	<div class="form-group">
						  		<label for="comment"><?php echo $entry_fault_detail; ?></label>
						  		<textarea name="comment" id="comment" cols="150" rows="6" class="form-control"><?php echo $comment; ?></textarea>	
						  	</div>

							<div class="form-group">
								<div class="row">
									<div class="col-sm-6">
										<label for="captcha">
											<span class="required">*</span> <?php echo $entry_captcha; ?>
										</label>
										<input type="text" name="captcha" id="captcha" value="<?php echo $captcha; ?>" class="form-control required" required />
										<br />
										<img src="index.php?route=account/return/captcha" alt="" />
										<?php if ($error_captcha) { ?>
										<span class="error"><?php echo $error_captcha; ?></span>
										<?php } ?>
									</div>
								</div>
							</div>

					</fieldset>

					<?php if ($text_agree) { ?>

						<div class="form-actions buttons">
							<?php if ($text_agree) { ?>
								<div class="checkbox">
									<label><input type="checkbox" name="agree" value="1" <?php if ($agree) { ?> checked="checked" <?php } ?> /> <?php echo $text_agree; ?></label>
								</div>
							<?php } ?>

							<a href="<?php echo $back; ?>" class="button btn btn-default"><?php echo $button_back; ?></a>
							<input type="submit" value="<?php echo $button_continue; ?>" class="button btn btn-default btn-inverse" />
						</div>

					<?php } else { ?>

						<div class="form-actions buttons">
							<a href="<?php echo $back; ?>" class="button btn btn-default"><?php echo $button_back; ?></a>
							<input type="submit" value="<?php echo $button_continue; ?>" class="button btn btn-default btn-inverse" />
						</div>

					<?php } ?>
					
				</form>

			</div>
			
		</section> <!-- #maincontent -->

		<?php echo $column_right; ?>

	</div> <!-- .row -->

	<?php echo $content_bottom; ?>
	

	<script type="text/javascript"><!--

		$(document).ready(function() {
			$('.date').datepicker({dateFormat: 'yy-mm-dd'});
		});
	
	//--></script>

	<script type="text/javascript"><!--
		$(document).ready(function() {
			$('.colorbox').colorbox({
				overlayClose: true,
				opacity: 0.5,
				maxHeight: 560,
				maxWidth: 560,
				width:'100%'
			});
		});
	//--></script> 

	<?php echo $footer; ?>