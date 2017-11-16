<?php $moduleid=1; if (!isset($sellegance_footer_modules)) $sellegance_footer_modules=3; ?>
<div class="footer_modules">
	<div class="container-inner">
		<div class="footer_modules_wrapper row">
			<?php foreach ($modules as $module) { ?>
				<div id="mod-<?php echo $moduleid; ?>" class="col-sm-<?php echo 12/$sellegance_footer_modules; ?>">
				<?php echo $module; ?>
				</div>
				<?php $moduleid++; ?>
			<?php } ?>
		</div>
	</div>
</div>