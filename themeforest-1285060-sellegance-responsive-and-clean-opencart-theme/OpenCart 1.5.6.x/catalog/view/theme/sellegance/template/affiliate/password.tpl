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

		<section id="maincontent" class="<?php echo $main; ?>" role="main">

			<div class="mainborder">

				<?php if ($column_left || $column_right) { ?>
					<div id="toggle_sidebar"></div>
				<?php } ?>

				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="password-form" class="form" role="form">
			
					<fieldset class="subheading">
								
						<legend><?php echo $text_password; ?></legend>

						<div class="row">

							<div class="col-sm-6">

								<div class="form-group">
									<label for="password">
										<span class="required">*</span> <?php echo $entry_password; ?>
									</label>
									<input type="password" name="password" id="password" value="<?php echo $password; ?>" title="<?php echo $this->language->get('error_password'); ?>" class="form-control password" required />
									<?php if ($error_password) { ?>
										<span class="error"><?php echo $error_password; ?></span>
									<?php } ?>
								</div>

							</div><!-- .col-sm-6 -->
							<div class="col-sm-6">

								<div class="form-group">
									<label for="confirm">
										<span class="required">*</span> <?php echo $entry_confirm; ?>
									</label>
									<input type="password" name="confirm" id="confirm" value="<?php echo $confirm; ?>"  title="<?php echo $this->language->get('error_password'); ?>" class="form-control password" required />
									<?php if ($error_confirm) { ?>
										<span class="error"><?php echo $error_confirm; ?></span>
									<?php } ?>
								</div>

							</div><!-- .col-sm-6 -->

						</div><!-- .row -->

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

<?php echo $footer; ?>