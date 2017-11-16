<script type="text/javascript" src="catalog/view/theme/sellegance/js/jquery.dcjqaccordion.js"></script> 

<div class="box category-accordion">

	<a class="btn btn-default visible-xs" role="button" data-toggle="collapse" href="#category_accordion" aria-expanded="false" aria-controls="collapseCategoryAccordion"><?php echo $heading_title; ?> <i class="fa fa-angle-right"></i></a>

	<div class="contentset center hidden-xs">
		<h4 class="inner"><span><?php echo $heading_title; ?></span></h4>
	</div>

	<div class="box-content box-category collapse" id="category_accordion"><?php echo $category_accordion; ?></div>
	
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
