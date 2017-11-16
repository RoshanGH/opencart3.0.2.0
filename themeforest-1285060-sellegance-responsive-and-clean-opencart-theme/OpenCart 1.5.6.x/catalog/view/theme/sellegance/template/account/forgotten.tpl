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

				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="forgotten" class="form" role="form">

					<p><?php echo $text_email; ?></p>

					<div class="contentset">
						<h4 class="inner">
							<span><?php echo $text_your_email; ?></span>
						</h4>
					</div>

					<div class="form-group">
						<label for="email"><?php echo $entry_email; ?></label>
						<input type="email" name="email" id="email" value="" class="required form-control" required />
					</div>

					<div class="form-actions">
						<a href="<?php echo $back; ?>" class="button btn btn-default"><span><?php echo $button_back; ?></span></a>
						<input type="submit" value="<?php echo $button_continue; ?>" class="button btn btn-default btn-inverse" />
					</div>

				</form>

			</div>

		</section> <!-- #maincontent -->

		<?php echo $column_right; ?>

	</div> <!-- .row -->

	<?php echo $content_bottom; ?>

<?php echo $footer; ?>