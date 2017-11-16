<?php $columns=3; $moduleid=1; ?>
<div class="footer_modules">
	<div class="container">
		<div class="footer_modules_wrapper row" id="foot">
			<?php foreach ($modules as $module) { ?>
				<div id="mod-<?php echo $moduleid; ?>" class="col-sm-<?php echo 12/$columns; ?>">
				<?php echo $module; ?>
				</div>
				<?php $moduleid++; ?>
			<?php } ?>
		</div>
	</div>
</div>