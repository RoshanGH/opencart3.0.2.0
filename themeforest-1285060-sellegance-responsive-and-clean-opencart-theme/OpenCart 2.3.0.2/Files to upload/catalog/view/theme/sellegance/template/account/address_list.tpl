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
	<?php if ($error_warning) { ?>
	<div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
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

				<div class="contentset">
					<h4 class="inner">
						<span><?php echo $text_address_book; ?></span>
					</h4>
				</div>

				<div id="address-list">

					<?php if ($addresses) { ?>
						
						<table class="table table-hover">
							<?php foreach ($addresses as $result) { ?>
							<tr>
								<td class="text-left"><?php echo $result['address']; ?></td>
								<td class="text-right"><a href="<?php echo $result['update']; ?>" class="btn btn-default"><?php echo $button_edit; ?></a> &nbsp; <a href="<?php echo $result['delete']; ?>" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-remove">&times;</a></td>
							</tr>
							<?php } ?>
						</table>
					 
					<?php } else { ?>

						<div class="content empty">
							<p><?php echo $text_empty; ?></p>
						</div>

					<?php } ?>

				</div>

				<div class="buttons clearfix">
					<a href="<?php echo $add; ?>" class="btn btn-primary"><?php echo $button_new_address; ?></a>
				</div>
			
			</div>

		</div> <!-- #content -->

		<?php echo $column_right; ?>

	</div> <!-- .row -->

	<?php echo $content_bottom; ?>
	
<?php echo $footer; ?>