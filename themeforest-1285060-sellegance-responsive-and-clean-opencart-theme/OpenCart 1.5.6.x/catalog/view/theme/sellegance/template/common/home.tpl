<?php echo $header; ?>

	<?php 	
		if ($column_left && $column_right) { 
			$main = "col-sm-6 middle sideleft"; }
		else if ($column_left || $column_right) { 
			$main = "col-sm-9"; 
			if($column_left) $main.=" sideleft"; else $main.= " sideright";
		} 
		else { $main = "col-sm-12"; } 
	?>

	<div class="row">

		<?php echo $column_left; ?>
		
		<section id="maincontent" class="<?php echo $main; ?> home">

		<?php echo $content_top; ?>
		
			<div class="mainborder">
	
			<?php 
		
			if(isset($language_id)) { 
						
				if($this->config->get('slider_general_status') == '1') { ?>
				
				<div id="revolution-slider" class="slider-fixed slideshow">
				
				<div class="fullwidthbanner-container">
					<div class="fullwidthbanner">
						<ul>
						
						<?php 
			
							for ($i = 1; $i <= $this->config->get('slides_quantity'); $i++) { 
												
								$slider = $this->config->get('slider'); 
								
								if(isset($slider[$i][$language_id]['status'])) {
																
									if($slider[$i][$language_id]['status'] == '1') {
										
										$image = false; $description = false; $link = false;

										if(isset($slider[$i][$language_id]['banner'])) {
											if($slider[$i][$language_id]['banner'] != '') {
												$image = $slider[$i][$language_id]['banner'];
											}
										}
										
										for ($m = 1; $m <= $this->config->get('elements_quantity'); $m++) {
										
											if($slider[$i][$language_id][$m]['status'] == '1') {
												$style = false;
												$extraclass = false;

													if (isset($slider[$i][$language_id][$m]['extra_image']) && $slider[$i][$language_id][$m]['extra_image']!='') {
													$element = '<img src="image/'. $slider[$i][$language_id][$m]['extra_image'].'" >'; }
												
																else if (isset($slider[$i][$language_id][$m]['video']) && $slider[$i][$language_id][$m]['video']!='') {

													$videoURL = $slider[$i][$language_id][$m]['video'];
													$parsed = parse_url($videoURL);
													$hostname = $parsed['host'];  // www.youtube.com
													if (isset($parsed['query'])) {
														$query = $parsed['query']; // v=5sRDHnTApSw&feature=youtu.be..
														$Arr = explode('v=',$query);
														$videoIDwithString = $Arr[1];
														$videoID = substr($videoIDwithString,0,11); // 5sRDHnTApSw
													}
													$path = $parsed['path']; // for vimeo.com

													if( (isset($videoID)) && (isset($hostname)) && ($hostname=='www.youtube.com' || $hostname=='youtube.com')){
													$element = '<iframe width="100%" height="100%" src="https://www.youtube.com/embed/'. $videoID .'?enablejsapi=1&amp;html5=1&amp;rel=0" frameborder="0" allowfullscreen></iframe>';
													} else if((isset($hostname)) && $hostname=='vimeo.com'){
														$ArrV = explode('://vimeo.com/',$path); // from ID to end of the string
													    $videoID = substr($ArrV[0],1,8); // get video ID
													    $vimdeoIDInt = intval($videoID); // ID must be integer

														$element = '<iframe src="http://player.vimeo.com/video/'. $vimdeoIDInt .'?title=0&amp;byline=0&amp;portrait=0" width="100%" height="100%"></iframe>';
													}
													$extraclass= 'fullscreenvideo';
												}

												else {
													$element = html_entity_decode($slider[$i][$language_id][$m]['text']); }

													($slider[$i][$language_id][$m]['randomrotate']==1) ? $rotate='randomrotate' : $rotate='';

												$description .= '<div class="caption '. $rotate .' '.$slider[$i][$language_id][$m]['style'].' '. $extraclass.' '.$slider[$i][$language_id][$m]['animation_in'].' '.$slider[$i][$language_id][$m]['animation_out'].'" data-x="'.$slider[$i][$language_id][$m]['x'].'" data-y="'.$slider[$i][$language_id][$m]['y'].'" data-speed="'.$slider[$i][$language_id][$m]['speed'].'" data-start="'.$slider[$i][$language_id][$m]['start'].'" data-easing="'.$slider[$i][$language_id][$m]['easing'].'" data-endspeed="'.$slider[$i][$language_id][$m]['speed'].'" data-endeasing="'.$slider[$i][$language_id][$m]['endeasing'].'" data-autoplay="'.$slider[$i][$language_id][$m]['autoplayvideo'].'" data-nextslideatend="true">'.$element.'</div>';
											}
										
										}
										
										if(isset($slider[$i][$language_id]['link'])) {
											if($slider[$i][$language_id]['link'] != '') {
												$link = ' data-link="'.$slider[$i][$language_id]['link'].'"';
											}
										}
										
										if (isset($slider[$i][$language_id][$m]['video']) && $slider[$i][$language_id][$m]['video']!='') { //do nothing 
										} else {
										if($image!='') {
											$bgslide = '';
										} else {
											$image = 'transparent.png';
											$bgslide = 'style="background-color:none"';
										}
											$sldimg = '<img src="image/'.$image.'" '.$bgslide.' data-fullwidthcentering="on">';
										}

										echo '<li data-transition="'.$slider[$i][$language_id]['transition_effect'].'" data-slotamount="10" data-masterspeed="300"'.$link.'>'.$sldimg.$description.'</li>';
									
									}
								
								}
					
							}	?>
	
						</ul>

						<div class="tp-bannertimer"></div>
					</div>
				</div>
				
				<style type="text/css">
					.fullwidthbanner-container { width:100% !important;position:relative;padding:0;max-height:428px !important;overflow:hidden; }
					.fullwidthbanner-container { max-height:<?php echo $this->config->get('slider_height'); ?>px !important; }
				</style>
					
			 </div>
				
			<script type="text/javascript">

				$(document).ready(function() {

				if ($.fn.cssOriginal!=undefined)
					$.fn.css = $.fn.cssOriginal;

					$('.fullwidthbanner').revolution({
						delay:<?php echo $this->config->get('slider_delay')*1000; ?>,
						<?php $layout = $this->config->get('sellegance_main_layout'); ?>

						startwidth:<?php echo ($layout=='large') ? '1140' : '960';  ?>,
						startheight:<?php echo $this->config->get('slider_height'); ?>,

						onHoverStop:"on",// Stop Banner Timet at Hover on Slide on/off

						thumbWidth:100,// Thumb With and Height and Amount (only if navigation Tyope set to thumb !)
						thumbHeight:50,
						thumbAmount:3,
						hideThumbs:0,

						navigationType:"bullet", //bullet, thumb, none, both	 (No Shadow in Fullwidth Version !)
						navigationArrows:"verticalcentered", //nexttobullets, verticalcentered, none
						navigationStyle:"round", //round,square,navbar

						touchenabled:"on", // Enable Swipe Function : on/off
						navOffsetHorizontal:0,
						navOffsetVertical:20,

						stopAtSlide:-1, // Stop Timer if Slide "x" has been Reached. If stopAfterLoops set to 0, then it stops already in the first Loop at slide X which defined. -1 means do not stop at any slide. stopAfterLoops has no sinn in this case.
						stopAfterLoops:-1, // Stop Timer if All slides has been played "x" times. IT will stop at THe slide which is defined via stopAtSlide:x, if set to -1 slide never stop automatic

						hideCaptionAtLimit:0, // It Defines if a caption should be shown under a Screen Resolution ( Basod on The Width of Browser)
						hideAllCaptionAtLilmit:0, // Hide all The Captions if Width of Browser is less then this value
						hideSliderAtLimit:0, // Hide the whole slider, and stop also functions if Width of Browser is less than this value

						fullWidth:"on",
						
						shuffle:"<?php echo ($this->config->get('shuffle_slides')==1) ? 'on' : 'off'; ?>",

						shadow:0 //0 = no Shadow, 1,2,3 = 3 Different Art of Shadows -  (No Shadow in Fullwidth Version !)

						});

			});
			</script>
				
	<?php			
				}
			}
	?>
				<h1 style="display:none"><?php echo $heading_title; ?></h1>
					
			</div>
			
		</section>
		
		<?php echo $column_right; ?>

	</div>

	<?php echo $content_bottom; ?>

<?php echo $footer; ?>