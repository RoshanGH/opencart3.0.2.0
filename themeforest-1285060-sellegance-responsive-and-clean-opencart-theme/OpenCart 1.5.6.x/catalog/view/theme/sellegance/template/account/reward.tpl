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

				<p><?php echo $text_total; ?><b> <?php echo $total; ?></b>.</p>
			
				<table class="table table-bordered">
					<thead>
						<tr>
							<td class="left"><?php echo $column_date_added; ?></td>
							<td class="left"><?php echo $column_description; ?></td>
							<td class="right"><?php echo $column_points; ?></td>
						</tr>
					</thead>
					<tbody>
						<?php if ($rewards) { ?>
						<?php foreach ($rewards  as $reward) { ?>
						<tr>
							<td class="left"><?php echo $reward['date_added']; ?></td>
							<td class="left"><?php if ($reward['order_id']) { ?>
								<a href="<?php echo $reward['href']; ?>"><?php echo $reward['description']; ?></a>
								<?php } else { ?>
								<?php echo $reward['description']; ?>
								<?php } ?></td>
							<td class="right"><?php echo $reward['points']; ?></td>
						</tr>
						<?php } ?>
						<?php } else { ?>
						<tr>
							<td class="center" colspan="5"><?php echo $text_empty; ?></td>
						</tr>
						<?php } ?>
					</tbody>
				</table>

				<div class="pagination"><?php echo $pagination; ?></div>
			
				<div class="form-actions">
							<a href="<?php echo $continue; ?>" class="button btn btn-default btn-inverse"><?php echo $button_continue; ?></a>
				</div>

			</div>

		</section> <!-- #maincontent -->
		
		<?php echo $column_right; ?>

	</div>
	
	<?php echo $content_bottom; ?>

<?php echo $footer; ?>