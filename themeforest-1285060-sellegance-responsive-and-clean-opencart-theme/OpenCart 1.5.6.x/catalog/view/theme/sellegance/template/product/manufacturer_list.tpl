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

				<?php if ($categories) { ?>
					
					<ul class="pagination pagination-sm brands">
						<?php foreach ($categories as $category) { ?>
							<li>
								<a href="index.php?route=product/manufacturer#<?php echo $category['name']; ?>"><?php echo $category['name']; ?></a>
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

						<div class="manufacturer-content row">
							
							<?php if ($category['manufacturer']) { ?>
							
								<?php for ($i = 0; $i < count($category['manufacturer']);) { ?>

									<ul class="col-sm-3 unstyled">

										<?php $j = $i + ceil(count($category['manufacturer']) / 4); ?>

										<?php for (; $i < $j; $i++) { ?>
											
											<?php if (isset($category['manufacturer'][$i])) { ?>
											
											<li>
												<a href="<?php echo $category['manufacturer'][$i]['href']; ?>">
													<b><?php echo $category['manufacturer'][$i]['name']; ?></b>
												</a>
											</li>

											<?php } ?>

										<?php } ?>

									</ul>

								<?php } ?>

							<?php } ?>
					
						</div>
					
					<?php } ?>

					</div>

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

		</section> <!-- #maincontent -->
		
		<?php echo $column_right; ?>

	</div> <!-- .row -->

	<?php echo $content_bottom; ?>

<?php echo $footer; ?>