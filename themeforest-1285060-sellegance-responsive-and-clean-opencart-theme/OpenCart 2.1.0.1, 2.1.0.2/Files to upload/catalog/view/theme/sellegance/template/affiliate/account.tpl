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

	<?php if ($success) { ?>
		<div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
	<?php } ?>

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

				<div class="row">

					<div class="col-sm-6">

						<div class="contentset">
							<h4 class="inner"><span><fa class="fa fa-user"></fa> <?php echo $text_my_account; ?></span></h4>
						</div>

						<ul class="list">
							<li><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
							<li><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
							<li><a href="<?php echo $payment; ?>"><?php echo $text_payment; ?></a></li>
						</ul>

					</div>
					
					<div class="col-sm-6">

						<div class="contentset">
							<h4 class="inner"><span><i class="fa fa-map-marker"></i> <?php echo $text_my_tracking; ?></span></h4>
						</div>

						<ul class="list">
							<li><a href="<?php echo $tracking; ?>"><?php echo $text_tracking; ?></a></li>
						</ul>

					</div>
					
				</div>

				<div class="contentset">
					<h4 class="inner"><span><i class="fa fa-line-chart"></i> <?php echo $text_my_transactions; ?></span></h4>
				</div>

				<ul class="list">
					<li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
				</ul>

			</div>

		</div> <!-- #content -->

	<?php echo $column_right; ?>

	</div> <!-- .row -->

	<?php echo $content_bottom; ?>

<?php echo $footer; ?>