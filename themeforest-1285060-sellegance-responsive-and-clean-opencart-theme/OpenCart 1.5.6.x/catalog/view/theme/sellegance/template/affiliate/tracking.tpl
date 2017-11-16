<?php echo $header; ?>

	<?php echo $content_top; ?>

	<div class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
			<?php echo $breadcrumb['separator']; ?>
			<a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
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

				<div class="form">

					<p><?php echo $text_description; ?></p>
						
					<div class="form-group">
						<label for="code">
							<?php echo $text_code; ?>
						</label>
						<textarea name="code" id="code" rows="3" class="form-control"><?php echo $code; ?></textarea>	
					</div>

					<div class="form-group">
						<label for="product">
							<?php echo $text_generator; ?>
						</label>
						<input type="text" name="product" id="product" value="" class="form-control" />	
					</div>

					<div class="form-group">
						<label for="link">
							<?php echo $text_link; ?>
						</label>
						<textarea name="link" id="link" rows="5" class="form-control"></textarea>	
					</div>
					
					<div class="form-actions buttons">
						<a href="<?php echo $continue; ?>" class="button btn btn-default btn-inverse"><?php echo $button_continue; ?></a>
					</div>

				</div>

			</div>

		</section> <!-- #maincontent -->

		<?php echo $column_right; ?>

	</div> <!-- .row -->
	
	<?php echo $content_bottom; ?>
	
	<script type="text/javascript"><!--

		$('input[name=\'product\']').autocomplete({
			delay: 500,
			source: function(request, response) {
				$.ajax({
					url: 'index.php?route=affiliate/tracking/autocomplete&filter_name=' +  encodeURIComponent(request.term),
					dataType: 'json',
					success: function(json) {		
						response($.map(json, function(item) {
							return {
								label: item.name,
								value: item.link
							}
						}));
					}
				});
				
			},
			select: function(event, ui) {
				$('input[name=\'product\']').attr('value', ui.item.label);
				$('textarea[name=\'link\']').attr('value', ui.item.value);
								
				return false;
			}
		});
	
	//--></script>
	
<?php echo $footer; ?>