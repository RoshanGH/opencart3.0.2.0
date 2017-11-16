<?php global $config; $moduleid=1; ?>
<div class="footer_modules">
	<div class="container-inner">
		<div class="footer_modules_wrapper row">
			<?php foreach ($modules as $module) { ?>
				<div id="mod-<?php echo $moduleid; ?>" class="col-sm-<?php echo 12/$config->get('sellegance_footer_modules'); ?>">
				<?php echo $module; ?>
				</div>
				<?php $moduleid++; ?>
			<?php } ?>
		</div>
	</div>
</div>