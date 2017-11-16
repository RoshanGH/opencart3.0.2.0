<?php 

// Nivo Slider

if ($this->config->get('sellegance_slider') == 'nivoslider') { ?>

	<div class="slideshow theme-ever">
		
		<div id="slideshow<?php echo $module; ?>" class="nivoSlider" >
			<?php foreach ($banners as $banner) { ?>
				<?php if ($banner['link']) { ?>
				<a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" /></a>
				<?php } else { ?>
				<img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" />
				<?php } ?>
			<?php } ?>
		</div>

	</div>

	<script type="text/javascript"><!--
		$(document).ready(function() {

			$('#slideshow<?php echo $module; ?>').nivoSlider({
				pauseTime: <?php echo $this->config->get('sellegance_slider_speed'); ?>, // How long each slide will show
				animSpeed: <?php echo $this->config->get('sellegance_slider_transition_time'); ?> // Slide transition speed
			});

		});
	--></script>

<?php } 

// Camera Slideshow

else if ($this->config->get('sellegance_slider') == 'camera') { ?>

	<div class="slideshow">
		
		<div id="slideshow<?php echo $module; ?>" class="camera_wrap camera_emboss " >
			<?php foreach ($banners as $banner) { ?>
			
				<div data-src="<?php echo $banner['image']; ?>" <?php if ($banner['link']) { ?>data-link="<?php echo $banner['link']; ?>" <?php } ?>>
					<!-- <div class="camera_caption fadeFromLeft"><?php echo $banner['title']; ?></div> -->
				</div>
				
			<?php } ?>
		</div>

	</div>

	<script type="text/javascript"><!--
		$(document).ready(function() {
			
			jQuery('#slideshow<?php echo $module; ?>').camera({
				loader: 'bar',
				height: '45%',
				barPosition: 'bottom',
				loaderColor: '#e05f49',
				loaderBgColor: '#ffffff',
				loaderPadding: '0',
				loaderStroke: '3',
				time: <?php echo $this->config->get('sellegance_slider_speed'); ?>, //milliseconds between the end of the sliding effect and the start of the nex one
				transPeriod: <?php echo $this->config->get('sellegance_slider_transition_time'); ?> //length of the sliding effect in milliseconds
			});

		});
	--></script>

<?php }

// Flexslider

else { ?>

	<div class="slideshow">
		
		<div id="slideshow<?php echo $module; ?>" class="flexslider">
		
			<ul class="slides">
		
			<?php foreach ($banners as $banner) { ?>
				
				<li>
		
					<?php if ($banner['link']) { ?>
		
						<a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" /></a>
						<div class="flex-caption">
							<a href="<?php echo $banner['link']; ?>"><?php echo $banner['title']; ?></a>
						</div>
		
					<?php } else { ?>
		
						<img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" />
		
						<div class="flex-caption"><?php echo $banner['title']; ?></div>
		
					<?php } ?>
		
				</li>
		
			<?php } ?>
		
			</ul>
		
		</div>

	</div>

	<?php 
	($this->config->get('sellegance_slider_speed')) ? $speed = $this->config->get('sellegance_slider_speed') : $speed = "5000";
	($this->config->get('sellegance_slider_transition_time')) ? $transition = $this->config->get('sellegance_slider_transition_time') : $transition = "900";
	 ?>

	<script type="text/javascript"><!--
		$(document).ready(function() {

			$('#slideshow<?php echo $module; ?>').flexslider({
				animation: "fade",            //String: Select your animation type, "fade" or "slide"
				slideDirection: "horizontal", //String: Select the sliding direction, "horizontal" or "vertical"
				slideshowSpeed: <?php echo $speed; ?>,         //Integer: Set the speed of the slideshow cycling, in milliseconds
				animationSpeed: <?php echo $transition; ?>,       //Integer: Set the speed of animations, in milliseconds
				animationLoop: true,          //Boolean: Should the animation loop? If false, directionNav will received "disable" classes at either end
				pauseOnAction: true,          //Boolean: Pause the slideshow when interacting with control elements, highly recommended.
			});
		});
	--></script>

<?php } ?>