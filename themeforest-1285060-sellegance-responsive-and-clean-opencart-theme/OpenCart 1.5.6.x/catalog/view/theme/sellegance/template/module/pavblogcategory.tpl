<div class="box ">
	<div class="contentset center">
		<h4 class="inner"><span><?php echo $heading_title; ?></span></h4>
	</div>
	<div class="box-content" id="pav-categorymenu" >
		 <?php echo $tree;?>
	</div>
 </div>
<script>
$(document).ready(function(){
		// applying the settings
		$("#pav-categorymenu li.active span.head").addClass("selected");
			$('#pav-categorymenu ul').Accordion({
				active: 'span.selected',
				header: 'span.head',
				alwaysOpen: false,
				animated: true,
				showSpeed: 400,
				hideSpeed: 800,
				event: 'click'
			});
});

</script>