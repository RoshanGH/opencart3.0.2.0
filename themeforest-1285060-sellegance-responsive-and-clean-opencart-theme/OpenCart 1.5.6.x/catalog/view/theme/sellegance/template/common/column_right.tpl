<?php if ($modules) { ?>

<aside id="column-right" class="col-sm-3 hidden-xs sidebar" role="complementary" >
	<div class="inner">
		<?php foreach ($modules as $module) { ?>
		<?php echo $module; ?>
		<?php } ?>
	</div>
</aside>

<?php } ?>
