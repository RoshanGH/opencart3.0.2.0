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

				<p><?php echo $text_total; ?><b> <?php echo $total; ?></b>.</p>
			
				<table class="table">
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

				<div class="row">
					<div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
					<div class="col-sm-6 text-right"><?php echo $results; ?></div>
				</div>
			
				<div class="buttons clearfix">
					<a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a>
				</div>

			</div>

		</div> <!-- #content -->
		
		<?php echo $column_right; ?>

	</div>
	
	<?php echo $content_bottom; ?>

<?php echo $footer; ?>