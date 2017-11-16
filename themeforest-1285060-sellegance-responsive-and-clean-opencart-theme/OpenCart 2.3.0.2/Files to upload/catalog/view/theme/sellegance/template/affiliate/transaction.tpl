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

				<p><?php echo $text_balance; ?><b> <?php echo $balance; ?></b>.</p>

				<div class="table-responsive">
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<td class="text-left"><?php echo $column_date_added; ?></td>
								<td class="text-left"><?php echo $column_description; ?></td>
								<td class="text-right"><?php echo $column_amount; ?></td>
							</tr>
						</thead>
						<tbody>
							<?php if ($transactions) { ?>
							<?php foreach ($transactions  as $transaction) { ?>
							<tr>
								<td class="text-left"><?php echo $transaction['date_added']; ?></td>
								<td class="text-left"><?php echo $transaction['description']; ?></td>
								<td class="text-right"><?php echo $transaction['amount']; ?></td>
							</tr>
							<?php } ?>
							<?php } else { ?>
							<tr>
								<td class="text-center" colspan="5"><?php echo $text_empty; ?></td>
							</tr>
							<?php } ?>
						</tbody>
					</table>
				</div>
				<div class="text-right"><?php echo $pagination; ?></div>
				<div class="buttons clearfix">
					<a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a>
				</div>

			</div>

		</div> <!-- #content -->
		
		<?php echo $column_right; ?>

	</div> <!-- .row -->
	
	<?php echo $content_bottom; ?>
	
<?php echo $footer; ?>