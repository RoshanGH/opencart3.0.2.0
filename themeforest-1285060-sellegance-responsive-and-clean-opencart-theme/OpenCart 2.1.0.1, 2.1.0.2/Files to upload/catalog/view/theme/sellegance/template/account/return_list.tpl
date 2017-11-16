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

		<?php echo $column_left ?>

		<div id="content" class="<?php echo $class; ?>" role="main">

			<div class="mainborder">

				<?php if ($returns) { ?>

					<div class="return-list">

						<?php foreach ($returns as $return) { ?>

							<div class="contentset">
								<h4 class="inner">
									<span><b><?php echo $column_return_id; ?> <?php echo $return['return_id']; ?></b></span>
								</h4>
							</div>

							<div class="row">

								<div class="col-sm-3">
									<b><?php echo $column_order_id; ?></b> <?php echo $return['order_id']; ?> <br>
									<small><?php echo $return['date_added']; ?></small>
								</div>

								<div class="col-sm-3">
									<b><?php echo $column_status; ?></b> <?php echo $return['status']; ?>
								</div>

								<div class="col-sm-4">
									<b><?php echo $column_customer; ?></b> <?php echo $return['name']; ?>
								</div>

								<div class="col-sm-2 list-actions">
									<a href="<?php echo $return['href']; ?>" class="btn btn-default btn-sm" title="<?php echo $button_view; ?>"><?php echo $button_view; ?></a>
								</div>

							</div>

						<?php } ?>

					</div>
				
					<div class="pagination"><?php echo $pagination; ?></div>

					<div class="buttons">
						<a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a>
					</div>

				<?php } else { ?>
				
					<div class="content empty">
						<p><?php echo $text_empty; ?></p>
						<div class="buttons">
							<a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a>
						</div>
					</div>

				<?php } ?>

			</div>

		</div> <!-- #content -->

		<?php echo $column_right; ?>

	</div> <!-- .row -->

	<?php echo $content_bottom; ?>
	
<?php echo $footer; ?>