<div class="box">

	<div class="contentset center">
		<h4 class="inner"><span><?php echo $heading_title; ?></span></h4>
	</div>

	<div class="box-content">

		<p><?php echo $text_store; ?></p>

		<?php foreach ($stores as $store) { ?>
			<?php if ($store['store_id'] == $store_id) { ?>
			<a href="<?php echo $store['url']; ?>"><b><?php echo $store['name']; ?></b></a><br />
			<?php } else { ?>
			<a href="<?php echo $store['url']; ?>"><?php echo $store['name']; ?></a><br />
			<?php } ?>
		<?php } ?>

	</div> <!-- .box-content -->

</div>
