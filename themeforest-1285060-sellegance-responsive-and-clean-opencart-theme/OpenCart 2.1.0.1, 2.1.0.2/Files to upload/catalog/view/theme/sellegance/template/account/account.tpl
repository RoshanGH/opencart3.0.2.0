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
							<h4 class="inner"><span><i class="fa fa-user"></i>	<?php echo $text_my_account; ?></span></h4>
						</div>

						<ul class="list-unstyled">
							<li><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
							<li><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
							<li><a href="<?php echo $address; ?>"><?php echo $text_address; ?></a></li>
							<li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
						</ul>

					</div>

					<div class="col-sm-6">
						
						<div class="contentset">
							<h4 class="inner"><span><fa class="fa fa-bookmark"></fa> <?php echo $text_my_orders; ?></span></h4>
						</div>

						<ul class="list-unstyled">
							<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
							<li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
							<?php if ($reward) { ?>
							<li><a href="<?php echo $reward; ?>"><?php echo $text_reward; ?></a></li>
							<?php } ?>
							<li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
							<li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
							<li><a href="<?php echo $recurring; ?>"><?php echo $text_recurring; ?></a></li>
						</ul>

					</div>
				
				</div>

				<div class="row">
					<div class="col-sm-12">
						<div class="contentset">
							<h4 class="inner"><span><i class="fa fa-envelope"></i> <?php echo $text_my_newsletter; ?></span></h4>
						</div>
						<ul class="list-unstyled">
							<li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
						</ul>
					</div>
					
				</div>

			</div>

		</div> <!-- #content -->

		<?php echo $column_right; ?>

	</div>

	<?php echo $content_bottom; ?>
	
<?php echo $footer; ?> 