<?php echo $header; ?>

	<?php echo $content_top; ?>
	
	<div class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
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

				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="newsletter" class="form">

					<div class="form-group">
						
						<label><?php echo $entry_newsletter; ?></label>

						<?php if ($newsletter) { ?>
							<div class="radio">
								<label><input type="radio" name="newsletter" value="1" checked="checked" /><?php echo $text_yes; ?></label>
							</div>
							<div class="radio">
								<label><input type="radio" name="newsletter" value="0" /><?php echo $text_no; ?></label>
							</div>
						<?php } else { ?>
							<div class="radio">
								<label><input type="radio" name="newsletter" value="1" /><?php echo $text_yes; ?></label>
							</div>
							<div class="radio">
								<label><input type="radio" name="newsletter" value="0" checked="checked" /><?php echo $text_no; ?></label>
							</div>
						<?php } ?>
						
					</div>
					
					<div class="form-actions">
						<a href="<?php echo $back; ?>" class="button btn btn-default"><?php echo $button_back; ?></a>
						<input type="submit" value="<?php echo $button_continue; ?>" class="button btn btn-default btn-inverse" />
					</div>

				</form>

			</div>
			
		</section>

		<?php echo $column_right; ?>

	</div> <!-- .row -->
	
	<?php echo $content_bottom; ?>

<?php echo $footer; ?>