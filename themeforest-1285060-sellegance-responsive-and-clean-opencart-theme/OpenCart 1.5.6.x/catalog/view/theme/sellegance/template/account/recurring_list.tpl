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

				<?php if ($profiles) { ?>

					<table class="table table-bordered">

						<thead>
							<tr>
								<td class="left"><?php echo $column_profile_id; ?></td>
								<td class="left"><?php echo $column_created; ?></td>
								<td class="left"><?php echo $column_status; ?></td>
								<td class="left"><?php echo $column_product; ?></td>
								<td class="right"><?php echo $column_action; ?></td>
							</tr>
						</thead>
						
						<tbody>
							<?php if ($profiles) { ?>
							<?php foreach ($profiles as $profile) { ?>
							<tr>
								<td class="left">#<?php echo $profile['id']; ?></td>
								<td class="left"><?php echo $profile['created']; ?></td>
								<td class="left"><?php echo $status_types[$profile['status']]; ?></td>
								<td class="left"><?php echo $profile['name']; ?></td>
								<td class="right"><a href="<?php echo $profile['href']; ?>"><img src="catalog/view/theme/clearshop/images/info.png" alt="<?php echo $button_view; ?>" title="<?php echo $button_view; ?>" /></a></td>
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

					<div class="form-actions buttons">
						<a href="<?php echo $continue; ?>" class="button btn btn-default btn-inverse"><?php echo $button_continue; ?></a>
					</div>

				<?php } else { ?>

					<div class="content empty">
						<p><?php echo $text_empty; ?></p>
						<div class="form-actions buttons">
							<a href="<?php echo $continue; ?>" class="button btn btn-default btn-inverse"><?php echo $button_continue; ?></a>
						</div>
					</div>

				<?php } ?>

			</div>

		</section> <!-- #maincontent -->

		<?php echo $column_right; ?>

	</div> <!-- .row -->

	<?php echo $content_bottom; ?>

<?php echo $footer; ?>