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

				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="newsletter" class="form">

					<div class="form-group">
						<label class="col-sm-2 control-label"><?php echo $entry_newsletter; ?></label>
						<div class="col-sm-10">
						  <?php if ($newsletter) { ?>
						  <label class="radio-inline">
							<input type="radio" name="newsletter" value="1" checked="checked" />
							<?php echo $text_yes; ?> </label>
						  <label class="radio-inline">
							<input type="radio" name="newsletter" value="0" />
							<?php echo $text_no; ?></label>
						  <?php } else { ?>
						  <label class="radio-inline">
							<input type="radio" name="newsletter" value="1" />
							<?php echo $text_yes; ?> </label>
						  <label class="radio-inline">
							<input type="radio" name="newsletter" value="0" checked="checked" />
							<?php echo $text_no; ?></label>
						  <?php } ?>
						</div>
					  </div>
					
					<div class="buttons">
						<input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary" />
					</div>

				</form>

			</div>
			
		</div>

		<?php echo $column_right; ?>

	</div> <!-- .row -->
	
	<?php echo $content_bottom; ?>

<?php echo $footer; ?>