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

				<table class="table table-bordered table-hover">
					<thead>
						<tr>
							<td class="text-left" colspan="2"><?php echo $text_return_detail; ?></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="text-left" style="width: 50%;"><b><?php echo $text_return_id; ?></b> #<?php echo $return_id; ?><br />
								<b><?php echo $text_date_added; ?></b> <?php echo $date_added; ?></td>
							<td class="text-left" style="width: 50%;"><b><?php echo $text_order_id; ?></b> #<?php echo $order_id; ?><br />
								<b><?php echo $text_date_ordered; ?></b> <?php echo $date_ordered; ?></td>
						</tr>
					</tbody>
				</table>
							
				<div class="contentset center">
					<h4 class="inner"><span><?php echo $text_product; ?></span></h4>
				</div>
					
				<table class="table table-bordered table-hover">
					<thead>
						<tr>
							<td class="text-left" style="width: 33.3%;"><?php echo $column_product; ?></td>
							<td class="text-left" style="width: 33.3%;"><?php echo $column_model; ?></td>
							<td class="text-right" style="width: 33.3%;"><?php echo $column_quantity; ?></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="text-left"><?php echo $product; ?></td>
							<td class="text-left"><?php echo $model; ?></td>
							<td class="text-right"><?php echo $quantity; ?></td>
						</tr>
					</tbody>
				</table>
				<table class="list table table-bordered table-hover">
					<thead>
						<tr>
							<td class="text-left" style="width: 33.3%;"><?php echo $column_reason; ?></td>
							<td class="text-left" style="width: 33.3%;"><?php echo $column_opened; ?></td>
							<td class="text-left" style="width: 33.3%;"><?php echo $column_action; ?></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="text-left"><?php echo $reason; ?></td>
							<td class="text-left"><?php echo $opened; ?></td>
							<td class="text-left"><?php echo $action; ?></td>
						</tr>
					</tbody>
				</table>
				<?php if ($comment) { ?>
				<table class="table table-bordered table-hover">
					<thead>
						<tr>
							<td class="text-left"><?php echo $text_comment; ?></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="text-left"><?php echo $comment; ?></td>
						</tr>
					</tbody>
				</table>
				<?php } ?>

				<div class="contentset center">
					<h4 class="inner"><span><?php echo $text_history; ?></span></h4>
				</div>

				<table class="table table-bordered table-hover">
					<thead>
						<tr>
							<td class="text-left" style="width: 33.3%;"><?php echo $column_date_added; ?></td>
							<td class="text-left" style="width: 33.3%;"><?php echo $column_status; ?></td>
							<td class="text-left" style="width: 33.3%;"><?php echo $column_comment; ?></td>
						</tr>
					</thead>
					<tbody>
					<?php if ($histories) { ?>
						<?php foreach ($histories as $history) { ?>
						<tr>
							<td class="text-left"><?php echo $history['date_added']; ?></td>
							<td class="text-left"><?php echo $history['status']; ?></td>
							<td class="text-left"><?php echo $history['comment']; ?></td>
						</tr>
						<?php } ?>
					<?php } else { ?>
						<tr>
							<td colspan="3" class="text-center"><?php echo $text_no_results; ?></td>
						</tr>
					<?php } ?>
					</tbody>
				</table>

				<div class="buttons">
					<a href="<?php echo $continue; ?>" class="button btn btn-primary"><?php echo $button_continue; ?></a>
				</div>

			</div>

		</div> <!-- #content -->

		<?php echo $column_right; ?>

	</div> <!-- .row -->

	<?php echo $content_bottom; ?>

<?php echo $footer; ?> 