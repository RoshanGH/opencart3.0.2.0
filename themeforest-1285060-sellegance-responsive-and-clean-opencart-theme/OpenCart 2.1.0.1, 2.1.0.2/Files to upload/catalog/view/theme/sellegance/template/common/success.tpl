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

		<div id="content" class="<?php echo $class; ?> success-page" role="main">

			<div class="mainborder">

				<?php echo $text_message; ?>
				
				<div class="buttons">
					<a href="<?php echo $continue; ?>" class="btn btn-primary">
						<?php echo $button_continue; ?>
					</a>
				</div>

			</div>
			
		</div> <!-- #content -->

		<?php echo $column_right; ?>

	</div> <!-- .row -->

	<?php echo $content_bottom; ?>
	
<?php echo $footer; ?>