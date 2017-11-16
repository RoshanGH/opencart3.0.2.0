<?php if ($languages && count($languages) > 1){ ?>

	<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="language-form">

		<div id="language_selector" class="dropd">

			<?php foreach ($languages as $language) { ?>

				<?php if ($language['code'] == $language_code) { ?>
					
					<span class="selected">
						<img src="image/flags/<?php echo $language['image']; ?>" alt="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?>
					</span>

				<?php } ?>

			<?php } ?>

			<ul class="options">

				<?php foreach ($languages as $language) { ?>

					<li>
						<a href="javascript:;" onclick="$('input[name=\'language_code\']').attr('value', '<?php echo $language['code']; ?>'); $('#language-form').submit();">
							<img src="image/flags/<?php echo $language['image']; ?>" alt="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?>
						</a>
					</li>

				<?php } ?>

			</ul>

		</div>

		<input type="hidden" name="language_code" value="" />
		<input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />

	</form>

<?php } ?>