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

		<?php echo $column_left; ?>

		<section id="maincontent" class="<?php echo $main; ?> contact" role="main">

			<div class="mainborder">

				<?php if ($column_left || $column_right) { ?>
					<div id="toggle_sidebar"></div>
				<?php } ?>

				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="contact-form" class="form">

					<fieldset class="subheading">
						
						<legend><?php echo $text_location; ?></legend>

						<div class="row">
							
							<address class="col-sm-6">
								<div class="contentset"><div class="inner">
									<span><i class="fa fa-map-marker"></i> <?php echo $text_address; ?></span>
								</div></div>
								<?php echo $store; ?><br />
								<?php echo $address; ?>
							</address>
						
							<address class="col-sm-6">
								<?php if ($telephone) { ?>
									<div class="contentset"><div class="inner"><span><i class="fa fa-phone"></i> <?php echo $text_telephone; ?></div></span></div>
									<?php echo $telephone; ?><br />
									<br />
								<?php } ?>
								<?php if ($fax) { ?>
									<b><?php echo $text_fax; ?></b><br />
									<?php echo $fax; ?>
								<?php } ?>
							</address>

						</div>

					</fieldset>

					<fieldset class="subheading">

						<legend><?php echo $text_contact; ?></legend>

						<div class="row">

							<div class="col-md-6">

								<div class="form-group">
									<label for="name">
										<span class="required">*</span> <?php echo $entry_name; ?>
									</label>
									<input type="text" name="name" id="name" value="<?php echo $name; ?>" title="<?php echo $this->language->get('error_name'); ?>" class="form-control required" required />
									<?php if ($error_name) { ?>
									<span class="error"><?php echo $error_name; ?></span>
									<?php } ?>
								</div>

								<div class="form-group">
									<label for="email">
										<span class="required">*</span> <?php echo $entry_email; ?>
									</label>
									<input type="email" name="email" id="email" value="<?php echo $email; ?>"  title="<?php echo $this->language->get('error_email'); ?>" class="form-control required email" required/>
									<?php if ($error_email) { ?>
									<span class="error"><?php echo $error_email; ?></span>
									<?php } ?>
								</div>

								<div class="form-group">
									<label for="enquiry">
										<span class="required">*</span> <?php echo $entry_enquiry; ?>
									</label>
									<textarea name="enquiry" id="enquiry" cols="52" rows="8" title="<?php echo $this->language->get('error_enquiry'); ?>" class="form-control required" required><?php echo $enquiry; ?></textarea>
									<?php if ($error_enquiry) { ?>
									<span class="error"><?php echo $error_enquiry; ?></span>
									<?php } ?>
								</div>

								<div class="form-group">
									<label for="captcha">
										<span class="required">*</span> <?php echo $entry_captcha; ?>
									</label>
									<input type="text" name="captcha" id="captcha" value="<?php echo $captcha; ?>" class="form-control required" required /><br /><br />
									<img src="index.php?route=information/contact/captcha" alt="" />
									<?php if ($error_captcha) { ?>
									<span class="error"><?php echo $error_captcha; ?></span>
									<?php } ?>
								</div>

							</div>

						</div>
					
					</fieldset>

					<div class="form-actions">
						<input type="submit" value="<?php echo $button_continue; ?>" class="button btn btn-default btn-inverse" />
					</div>
		  
				</form>
			
			</div>
			
		</section> <!-- #maincontent -->

		<?php echo $column_right; ?>

	</div>

	<?php echo $content_bottom; ?>

<?php echo $footer; ?>