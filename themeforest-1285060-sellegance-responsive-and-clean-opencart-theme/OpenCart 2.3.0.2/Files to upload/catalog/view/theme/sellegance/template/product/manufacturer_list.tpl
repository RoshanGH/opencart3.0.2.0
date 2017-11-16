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

				<?php if ($categories) { ?>
					
					<ul class="pagination brands">
						<li><span><?php echo $text_index; ?></span></li>
						<?php foreach ($categories as $category) { ?>
							<li>
								<span><a href="index.php?route=product/manufacturer#<?php echo $category['name']; ?>"><?php echo $category['name']; ?></a></span>
							</li>
						<?php } ?>
					</ul>

					<div id="manufacturer-list">

					<?php foreach ($categories as $category) { ?>
						
						<div class="contentset">
							<h4 class="inner">
								<span><?php echo $category['name']; ?><a id="<?php echo $category['name']; ?>"></a></span>
							</h4>
						</div>

						<?php if ($category['manufacturer']) { ?>
							<?php foreach (array_chunk($category['manufacturer'], 4) as $manufacturers) { ?>
								<ul>
									<?php foreach ($manufacturers as $manufacturer) { ?>
									<li><a href="<?php echo $manufacturer['href']; ?>"><?php echo $manufacturer['name']; ?></a></li>
									<?php } ?>
								</ul>
							<?php } ?>
						<?php } ?>

					<?php } ?>

				<?php } else { ?>

					<div class="content empty">

						<p><?php echo $text_empty; ?></p>

						<div class="buttons">
							<a href="<?php echo $continue; ?>" class="button btn btn-default btn-inverse">
								<?php echo $button_continue; ?>
							</a>
						</div>

					</div>

				<?php } ?>

			</div>

		</div> <!-- #content -->
		
		<?php echo $column_right; ?>

	</div> <!-- .row -->

	<?php echo $content_bottom; ?>

<?php echo $footer; ?>