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

				<?php if ($recurrings) { ?>

					<table class="table table-bordered table-hover">

						<thead>
							<tr>
								<td class="left"><?php echo $column_recurring_id; ?></td>
								<td class="left"><?php echo $column_date_added; ?></td>
								<td class="left"><?php echo $column_status; ?></td>
								<td class="left"><?php echo $column_product; ?></td>
								<td class="right"><?php echo $column_action; ?></td>
							</tr>
						</thead>
						
						<tbody>
							<?php foreach ($recurrings as $recurring) { ?>
							<tr>
								<td class="left">#<?php echo $recurring['id']; ?></td>
								<td class="left"><?php echo $recurring['date_added']; ?></td>
								<td class="left"><?php echo $status_types[$recurring['status']]; ?></td>
								<td class="left"><?php echo $recurring['name']; ?></td>
								<td class="right"><a href="<?php echo $recurring['href']; ?>" class="btn btn-info"><?php echo $button_view; ?></a></td>
							</tr>
							<?php } ?>
						</tbody>

					</table>

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