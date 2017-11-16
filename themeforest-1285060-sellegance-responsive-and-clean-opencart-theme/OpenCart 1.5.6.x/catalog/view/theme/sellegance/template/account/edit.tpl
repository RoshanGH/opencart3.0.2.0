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

				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="edit-account" class="form">
					
					<fieldset class="subheading">

						<legend><?php echo $text_your_details; ?></legend>

						<div class="row">
							<div class="form-group col-sm-6">
								<label for="firstname"><span class="required">*</span> <?php echo $entry_firstname; ?></label>
								<input type="text" name="firstname" id="firstname" value="<?php echo $firstname; ?>" title="<?php echo $this->language->get('error_firstname'); ?>" class="form-control required" required />
								<?php if ($error_firstname) { ?>
								<span class="error"><?php echo $error_firstname; ?></span>
								<?php } ?>
							</div>
									 	
							<div class="form-group col-sm-6">
								<label for="lastname"><span class="required">*</span> <?php echo $entry_lastname; ?>
								</label>
								<input type="text" name="lastname" id="lastname" value="<?php echo $lastname; ?>" title="<?php echo $this->language->get('error_lastname'); ?>" class="form-control required" required />
								<?php if ($error_lastname) { ?>
								<span class="error"><?php echo $error_lastname; ?></span>
								<?php } ?>
							</div>
						</div>

						<div class="form-group">
							<label for="email"><span class="required">*</span> <?php echo $entry_email; ?></label>
							<input type="email" name="email" id="email" value="<?php echo $email; ?>"  title="<?php echo $this->language->get('error_email'); ?>" class="form-control required email" required />
							<?php if ($error_email) { ?>
							<span class="error"><?php echo $error_email; ?></span>
							<?php } ?>
						</div>

						<div class="form-group">
							<label for="telephone" class="control-label"><span class="required">*</span> <?php echo $entry_telephone; ?></label>
							<input type="text" name="telephone" id="telephone" value="<?php echo $telephone; ?>" title="<?php echo $this->language->get('error_telephone'); ?>" class="form-control required" />
							<?php if ($error_telephone) { ?>
							<span class="error"><?php echo $error_telephone; ?></span>
							<?php } ?>
						</div>

						<div class="form-group">
							<label for="fax" class="control-label"><?php echo $entry_fax; ?></label>
							<input type="text" name="fax" id="fax" value="<?php echo $fax; ?>" class="form-control"/>
						</div>
					
					</fieldset>

					<div class="form-actions buttons">
						<a href="<?php echo $back; ?>" class="button btn btn-default"><span><?php echo $button_back; ?></span></a>
						<input type="submit" value="<?php echo $button_continue; ?>" class="button btn btn-default btn-inverse" />
					</div>
		  
				</form>

			</div>

		</section> <!-- #maincontent -->

		<?php echo $column_right; ?>

	</div>
  
	<?php echo $content_bottom; ?>
  
<?php echo $footer; ?>