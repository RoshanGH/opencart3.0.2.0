<div class="newsletter">
	<h3><?php echo $heading_title; ?></h3>
	<div class="box-content">
		<p class="contrast_font intro"><?php echo $entry_email; ?></p>

		<div class="input-group">
			<input type="text" value="" placeholder="<?php echo $text_email; ?>" name="email" id="newsletter_email<?php echo $module; ?>" class="form-control">
			<span class="input-group-btn">
				<button class="btn btn-default" type="button" id="button-newsletter<?php echo $module; ?>" data-toggle="tooltip" data-placement="top" title="<?php echo $button_join; ?>"><i class="fa fa-envelope"></i></button>
			</span>
		</div>

	</div>
</div>

<script type="text/javascript"><!--
$('#newsletter_email<?php echo $module; ?>').on('keydown', function(e) {
	if (e.keyCode == 13) {
		$('#button-newsletter<?php echo $module; ?>').trigger('click');
	}
});
$('#button-newsletter<?php echo $module; ?>').on('click', function() {
	$.ajax({
		url: 'index.php?route=extension/module/newsletter/validate',
		type: 'post',
		data: $('#newsletter_email<?php echo $module; ?>'),
		dataType: 'json',
		success: function(json) {
			if (json['error']) {
				alert(json['error']['warning']);
			} else {
				alert(json['success']);
				$('#newsletter_email').val('');
			}
		}
	});	
});
//--></script> 