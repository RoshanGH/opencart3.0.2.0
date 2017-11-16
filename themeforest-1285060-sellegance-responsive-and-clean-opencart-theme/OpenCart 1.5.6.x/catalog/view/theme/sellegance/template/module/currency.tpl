<?php if (count($currencies) > 1) { ?>

	<form action="<?php echo $action; ?>" method="post"  enctype="multipart/form-data" id="currency_form">

		<div id="currency_selector" class="dropd">
			<?php foreach ($currencies as $currency) { ?>
				<?php if ($currency['code'] == $currency_code) { ?>
					<span class="selected"><?php echo $currency['title']; ?></span>
				<?php } ?>
			<?php } ?>
			<ul class="options">
				<?php foreach ($currencies as $currency){ ?>
				<li>
					<a href="javascript:;" onclick="$('input[name=\'currency_code\']').attr('value', '<?php echo $currency['code']; ?>'); $('#currency_form').submit();">
						<?php echo $currency['title']; ?>
					</a>
				</li>
				<?php } ?>
			</ul>
		</div>

		<div>
			<input type="hidden" name="currency_code" value="" />
			<input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
		</div>

	</form>

<?php } ?>