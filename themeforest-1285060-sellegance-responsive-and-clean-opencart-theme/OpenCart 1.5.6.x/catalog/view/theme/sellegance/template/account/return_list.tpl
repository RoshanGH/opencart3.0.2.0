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

		<?php echo $column_left ?>

		<section id="maincontent" class="<?php echo $main; ?>" role="main">

			<div class="mainborder">

				<?php if ($column_left || $column_right) { ?>
					<div id="toggle_sidebar"></div>
				<?php } ?>

				<?php if ($returns) { ?>

					<div class="return-list">

						<?php foreach ($returns as $return) { ?>

							<div class="contentset">
								<h4 class="inner">
									<span><b><?php echo $text_return_id; ?> <?php echo $return['return_id']; ?></b></span>
								</h4>
							</div>

							<div class="row">

								<div class="col-sm-3">
									
									<b><?php echo $text_order_id; ?></b> <?php echo $return['order_id']; ?> <br>
									<small><?php echo $return['date_added']; ?></small>
								</div>

								<div class="col-sm-3">
									<b><?php echo $text_status; ?></b> <?php echo $return['status']; ?>
								</div>

								<div class="col-sm-4">
									<b><?php echo $text_customer; ?></b> <?php echo $return['name']; ?>
								</div>

								<div class="col-sm-2 list-actions">
									<a href="<?php echo $return['href']; ?>" class="button btn btn-default btn-sm" title="<?php echo $button_view; ?>"><?php echo $button_view; ?></a>
								</div>

							</div>

						<?php } ?>

					</div>
				
					<div class="pagination"><?php echo $pagination; ?></div>

					<div class="form-actions buttons">
						<a href="<?php echo $continue; ?>" class="button btn btn-default btn-inverse"><?php echo $button_continue; ?></a>
					</div>

				<?php } else { ?>
				
					<div class="content empty">
						<p><?php echo $text_empty; ?></p>
						<div class="form-actions buttons">
							<a href="<?php echo $continue; ?>" class="button btn btn-default btn-inverse"><?php echo $button_continue; ?></a>
						</div>
					</div>

				<?php } ?>

			</div>

		</section> <!-- #maincontent -->

		<?php echo $column_right; ?>

	</div> <!-- .row -->

	<?php echo $content_bottom; ?>
	
<?php echo $footer; ?>