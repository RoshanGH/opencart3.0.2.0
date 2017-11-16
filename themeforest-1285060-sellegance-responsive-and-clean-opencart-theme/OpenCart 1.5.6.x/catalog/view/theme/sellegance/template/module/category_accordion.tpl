<script type="text/javascript" src="catalog/view/theme/sellegance/js/jquery.dcjqaccordion.js"></script> 

<div class="box">

	<div class="contentset center">
		<h4 class="inner"><span><?php echo $heading_title; ?></span></h4>
	</div>

	<div class="box-content box-category"><?php echo $category_accordion; ?></div>
	
</div>

<script type="text/javascript">
$(document).ready(function() {
	$('#cat_accordion').dcAccordion({
		classExpand : 'cid<?php echo $category_accordion_cid; ?>',
		menuClose: false,
		autoClose: true,
		saveState: false,
		disableLink: false,		
		autoExpand: true
	});
});
</script>
