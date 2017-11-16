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

				<p><?php echo $text_description; ?></p>

				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="voucher" class="form">

					<div class="form-group">
						<label for="to_name">
							<span class="required">*</span> <?php echo $entry_to_name; ?>
						</label>
						<input type="text" name="to_name" id="to_name" value="<?php echo $to_name; ?>" title="<?php echo $this->language->get('error_to_name'); ?>" class="form-control required" required />
						<?php if ($error_to_name) { ?>
						<span class="error"><?php echo $error_to_name; ?></span>
						<?php } ?>
					</div>
					<div class="form-group">
						<label for="to_email">
							<span class="required">*</span> <?php echo $entry_to_email; ?>
						</label>
						<input type="email" name="to_email" id="to_email" value="<?php echo $to_email; ?>"  title="<?php echo $this->language->get('error_to_email'); ?>" class="form-control required email" required />
						<?php if ($error_to_email) { ?>
						<span class="error"><?php echo $error_to_email; ?></span>
						<?php } ?>
					</div>

					<div class="row">
						<div class="form-group col-sm-6">
							<label for="from_name">
								<span class="required">*</span> <?php echo $entry_from_name; ?>
							</label>
							<input type="text" name="from_name" id="from_name" value="<?php echo $from_name; ?>" title="<?php echo $this->language->get('error_from_name'); ?>" class="form-control required" required />
							<?php if ($error_from_name) { ?>
							<span class="error"><?php echo $error_from_name; ?></span>
							<?php } ?>
						</div>
						<div class="form-group col-sm-6">
							<label for="from_email">
								<span class="required">*</span> <?php echo $entry_from_email; ?>
							</label>
							<input type="email" name="from_email" id="from_email" value="<?php echo $from_email; ?>"  title="<?php echo $this->language->get('error_from_email'); ?>" class="form-control required email" required />
							<?php if ($error_from_email) { ?>
							<span class="error"><?php echo $error_from_email; ?></span>
							<?php } ?>
						</div>
					</div>

					<div class="form-group">

						<label>
							<span class="required">*</span> <?php echo $entry_theme; ?>
						</label>

						<?php foreach ($voucher_themes as $voucher_theme) { ?>

						<div class="radio">
							<label>
							<?php if ($voucher_theme['voucher_theme_id'] == $voucher_theme_id) { ?>
								<input type="radio" name="voucher_theme_id" value="<?php echo $voucher_theme['voucher_theme_id']; ?>" id="voucher-<?php echo $voucher_theme['voucher_theme_id']; ?>" checked="checked" class="radio inline"/>
								<?php echo $voucher_theme['name']; ?>
							<?php } else { ?>
								<input type="radio" name="voucher_theme_id" value="<?php echo $voucher_theme['voucher_theme_id']; ?>" id="voucher-<?php echo $voucher_theme['voucher_theme_id']; ?>" class="radio inline" />
								<?php echo $voucher_theme['name']; ?>
							<?php } ?>
							</label>
						</div>
						
						<?php } ?>
						
						<?php if ($error_theme) { ?>
							<span class="error"><?php echo $error_theme; ?></span>
						<?php } ?>

					</div>

					<div class="form-group">
						<label for="message"><?php echo $entry_message; ?></label>
						<textarea name="message" id="message" cols="34" rows="5" class="form-control"><?php echo $message; ?></textarea>
					</div>

					<div class="form-group">
						<label for="amount">
							<span class="required">*</span> <?php echo $entry_amount; ?>
						</label>
						<input type="text" name="amount" id="amount" value="<?php echo $amount; ?>"  title="<?php echo $this->language->get('error_amount'); ?>" class="form-control required" required />
						<?php if ($error_amount) { ?>
						<span class="error"><?php echo $error_amount; ?></span>
						<?php } ?>
					</div>

					<div class="form-actions buttons">

						<?php if ($text_agree) { ?>
							<div class="checkbox">
								<label><input type="checkbox" name="agree" value="1" <?php if ($agree) { ?> checked="checked" <?php } ?> /> <?php echo $text_agree; ?></label>
							</div>
						<?php } ?>

						<input type="submit" value="<?php echo $button_continue; ?>" class="button btn btn-default btn-inverse" />

					</div>
					
				</form>

			</div>
			
		</section> <!-- #maincontent -->

		<?php echo $column_right; ?>

	</div> <!-- .row -->

	<?php echo $content_bottom; ?>

<?php echo $footer; ?>