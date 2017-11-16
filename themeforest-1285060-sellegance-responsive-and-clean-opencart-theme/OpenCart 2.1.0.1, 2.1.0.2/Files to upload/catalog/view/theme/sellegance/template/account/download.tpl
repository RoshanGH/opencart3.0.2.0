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

				<div id="download-list">
				<?php if ($downloads) { ?>
					<table class="table table-bordered table-hover">
						<thead>
						  <tr>
							<td class="text-right"><?php echo $column_order_id; ?></td>
							<td class="text-left"><?php echo $column_name; ?></td>
							<td class="text-left"><?php echo $column_size; ?></td>
							<td class="text-left"><?php echo $column_date_added; ?></td>
							<td></td>
						  </tr>
						</thead>
						<tbody>
						  <?php foreach ($downloads as $download) { ?>
						  <tr>
							<td class="text-right"><?php echo $download['order_id']; ?></td>
							<td class="text-left"><?php echo $download['name']; ?></td>
							<td class="text-left"><?php echo $download['size']; ?></td>
							<td class="text-left"><?php echo $download['date_added']; ?></td>
							<td><a href="<?php echo $download['href']; ?>" data-toggle="tooltip" title="<?php echo $button_download; ?>" class="btn btn-primary"><i class="fa fa-cloud-download"></i></a></td>
						  </tr>
						  <?php } ?>
						</tbody>
					  </table>

					<div class="row">
					  <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
					  <div class="col-sm-6 text-right"><?php echo $results; ?></div>
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

			</div>

		</div> <!-- #content -->

		<?php echo $column_right; ?>

	</div> <!-- .row -->
	
	<?php echo $content_bottom; ?>

<?php echo $footer; ?>