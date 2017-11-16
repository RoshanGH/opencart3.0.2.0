<?php echo $header; ?>
<div class="centralbox">
		<div class="container">
			<div class="container-inner">

	<?php echo $content_top; ?>
	
	<header class="page-header">
		<h1><?php echo $heading_title; ?></h1>
	</header>

	<ul class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
		<?php } ?>
	</ul>
	
	<?php 
	
	if ($column_left && $column_right) { 
		$class = "col-sm-6 middle sideleft"; }
	else if ($column_left || $column_right) { 
		$class = "col-sm-9";
		if($column_left) $class.=" sideleft"; else $class.= " sideright";
	} 
	else { $class = "col-sm-12"; } 

	?>

	<div class="row">

		<?php echo $column_left; ?>

		<div id="content" class="<?php echo $class; ?>" role="main">

			<div class="mainborder">

				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
					<fieldset>
						<legend><?php echo $text_password; ?></legend>
						<div class="form-group required">
							<label class="col-sm-2 control-label" for="input-password"><?php echo $entry_password; ?></label>
							<div class="col-sm-10">
								<input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
								<?php if ($error_password) { ?>
								<div class="text-danger"><?php echo $error_password; ?></div>
								<?php } ?>
							</div>
						</div>
						<div class="form-group required">
							<label class="col-sm-2 control-label" for="input-confirm"><?php echo $entry_confirm; ?></label>
							<div class="col-sm-10">
								<input type="password" name="confirm" value="<?php echo $confirm; ?>" placeholder="<?php echo $entry_confirm; ?>" id="input-confirm" class="form-control" />
								<?php if ($error_confirm) { ?>
								<div class="text-danger"><?php echo $error_confirm; ?></div>
								<?php } ?>
							</div>
						</div>
					</fieldset>
					<div class="buttons clearfix">
							<input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary" />
						</div>
				</form>

			</div>
			
		</div> <!-- #content -->

		<?php echo $column_right; ?>

	</div> <!-- .row -->

	<?php echo $content_bottom; ?>

<?php echo $footer; ?>