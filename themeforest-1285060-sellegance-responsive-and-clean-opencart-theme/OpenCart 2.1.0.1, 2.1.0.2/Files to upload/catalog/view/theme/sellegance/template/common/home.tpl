<?php echo $header; ?>

	<?php 

		global $config;

		if ($column_left && $column_right) { 
			$class = "col-sm-6 middle sideleft"; }
		else if ($column_left || $column_right) { 
			$class = "col-sm-9"; 
			if($column_left) $class.=" sideleft"; else $class.= " sideright";
		} 
		else { $class = "col-sm-12"; } 
	?>

	<div class="centralbox home">

		<?php if($config->get('sellegance_main_layout')=='fullwidth') { 
				echo $home_top;
				include(DIR_TEMPLATE . 'sellegance/template/common/aslider.tpl');
			} ?>

		<div class="container">
		
			<?php if($config->get('sellegance_main_layout')!='fullwidth') { 
				echo $home_top;
				include(DIR_TEMPLATE . 'sellegance/template/common/aslider.tpl');
			} ?>

			<div class="container-inner">

				<div class="row">

					<?php echo $column_left; ?>
					
					<div id="content" class="<?php echo $class; ?>">

						<div class="mainborder">
				
						<?php echo $content_top; ?>
						<?php echo $content_bottom; ?>
								
						</div>
						
					</div>
					
					<?php echo $column_right; ?>

				</div>

<?php echo $footer; ?>