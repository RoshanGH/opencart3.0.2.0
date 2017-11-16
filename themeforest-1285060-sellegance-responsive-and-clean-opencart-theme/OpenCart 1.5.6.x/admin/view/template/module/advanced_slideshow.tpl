<?php echo $header; ?>

<?php 

$transition = array(
	'random'               => 'Random',
	'boxslide'             => 'Box Slide',
	'boxfade'              => 'Box Fade',
	'slotzoom-horizontal'  => 'Slot Zoom Horizontal',
	'slotslide-horizontal' => 'Slot Slide Horizontal',
	'slotfade-horizontal'  => 'Slot Fade Horizontal',
	'slotzoom-vertical'    => 'Slot Zoom Vertical',
	'slotslide-vertical'   => 'Slot Slide Vertical',
	'slotfade-vertical'    => 'Slot Fade Vertical',
	'curtain-1'            => 'Curtain One',
	'curtain-2'            => 'Curtain Two',
	'curtain-3'            => 'Curtain Three',
	'slideleft'            => 'Slide Left',
	'slideright'           => 'Slide Right',
	'slideup'              => 'Slide Up',
	'slidedown'            => 'Slide down',
	'fade'                 => 'Fade',
	'slidehorizontal'      => 'Slide Horizontal',
	'slidevertical'        => 'Slide Vertical',
	'papercut'             => 'Paper Cut',
	'flyin'                => 'Fly In',
	'turnoff'              => 'Turn Off',
	'cube'                 => 'Cube',
	'3dcurtain-vertical'   => '3D Curtain Vertical',
	'3dcurtain-horizontal' => '3D Curtain Horizontal'
);

$animation_style = array(
	'small_header'             => 'small header',
	'small_header_right'       => 'small header right align',
	'medium_description'       => 'medium description',
	'medium_description_right' => 'medium description right align',
	'large_description'        => 'large description'
);

$animation_in = array(
	'sft' => 'Short from Top',
	'sfb' => 'Short from Bottom',
	'sfr' => 'Short from Right',
	'sfl' => 'Short from Left',
	'lft' => 'Long from Top',
	'lfb' => 'Long from Bottom',
	'lfr' => 'Long from Right',
	'lfl' => 'Long from Left',
	'fade' => 'Fading',
	'randomrotate' => 'Random animation'
);

$animation_out = array(
	'stt' => 'Short to Top',
	'stb' => 'Short to Bottom',
	'str' => 'Short to Right',
	'stl' => 'Short to Left',
	'ltt' => 'Long to Top',
	'ltb' => 'Long to Bottom',
	'ltr' => 'Long to Right',
	'ltl' => 'Long to Left',
	'fadeout' => 'Fading Out',
	'randomrotateout' => 'Random animation'
);

$easing = array(
	'easeOutBack'      => 'easeOutBack',
	'easeInQuad'       => 'easeInQuad',
	'easeOutQuad'      => 'easeOutQuad',
	'easeInOutQuad'    => 'easeInOutQuad',
	'easeInCubic'      => 'easeInCubic',
	'easeOutCubic'     => 'easeOutCubic',
	'easeInOutCubic'   => 'easeInOutCubic',
	'easeInQuart'      => 'easeInQuart',
	'easeOutQuart'     => 'easeOutQuart',
	'easeInOutQuart'   => 'easeInOutQuart',
	'easeInQuint'      => 'easeInQuint',
	'easeOutQuint'     => 'easeOutQuint',
	'easeInOutQuint'   => 'easeInOutQuint',
	'easeInSine'       => 'easeInSine',
	'easeOutSine'      => 'easeOutSine',
	'easeInOutSine'    => 'easeInOutSine',
	'easeInExpo'       => 'easeInExpo',
	'easeOutExpo'      => 'easeOutExpo',
	'easeInOutExpo'    => 'easeInOutExpo',
	'easeInCirc'       => 'easeInCirc',
	'easeOutCirc'      => 'easeOutCirc',
	'easeInOutCirc'    => 'easeInOutCirc',
	'easeInElastic'    => 'easeInElastic',
	'easeOutElastic'   => 'easeOutElastic',
	'easeInOutElastic' => 'easeInOutElastic',
	'easeInBack'       => 'easeInBack',
	'easeOutBack'      => 'easeOutBack',
	'easeInOutBack'    => 'easeInOutBack',
	'easeInBounce'     => 'easeInBounce',
	'easeOutBounce'    => 'easeOutBounce',
	'easeInOutBounce'  => 'easeInOutBounce'
	);

$caption_style = array (
	'small_text'            => 'Small Text',
	'finewide_medium_white'   => 'Fine Wide Medium White',
	'finewide_large_white'    => 'Fine Wide Large White',
	'middle_yellow'           => 'Middle Yellow',
	'medium_dark'             => 'Medium Dark',
	'medium_grey'             => 'Medium Grey',
	'medium_text'           => 'Medium Text',
	'medium_text_shadow'      => 'Medium Text Shadow',
	'medium_bold_grey'        => 'Medium Bold Grey',
	'big_dark'                => 'Big Dark',
	'large_bold_white_25'     => 'Large Bold White 25',
	'large_text'              => 'Large Text',
	'very_large_text'         => 'Very Large Text',
	'very_big_white'        => 'Very Big White',
	'very_big_black'        => 'Very Big Black',
	'huge_red'                => 'Huge Red',
	'huge_thin_yellow'        => 'Huge Thin Yellow',
	'thinheadline_dark'       => 'Thin Headline Dark',
	'thintext_dark'           => 'Thin Text Dark',
	'modern_medium_fat'       => 'Modern Medium Fat',
	'modern_medium_fat_white' => 'Modern Medium Fat White',
	'modern_medium_light'     => 'Modern Medium Light',
	'modern_big_bluebg'       => 'Modern Big Blue Background',
	'modern_big_redbg'        => 'Modern Big Red Background',
	'modern_small_text_dark'  => 'Modern Small Text Dark',
	'medium_thin_grey'        => 'Medium Thin Grey',
	'small_thin_grey'         => 'Small Thin Grey',	
	'medium_bg_red'           => 'Medium Red Background',
	'medium_bg_darkblue'      => 'Medium Darkblue Background',
	'medium_bold_red'         => 'Medium Bold Red',
	'medium_light_red'        => 'Medium Light Red',
	'medium_bg_red'           => 'Medium Red Background',
	'medium_bg_orange'        => 'Medium Orange Background',
	'largeblackbg'            => 'Large Black Background',
	'largepinkbg'             => 'Large Pink Background',
	'largewhitebg'            => 'Large White Background',
	'largegreenbg'            => 'Large Green Background'
	);

$slider_layout = array(
	'boxed'      => 'Boxed',
	'fullwidth' => 'Full width'
);

(!isset($slider_delay)) ? $slider_delay = 9 : '';
(!isset($slides_quantity)) ? $slides_quantity = 3 : '';
(!isset($elements_quantity)) ? $elements_quantity = 2 : '';
if(empty($slider_height)) $slider_height = 420;

?>
 
<style type="text/css">
	.box>.content h2 { border-bottom: 0; }
	.customhelp { color: #777; font-size:0.9em; }
	.hey {color: #ff0000;}
	.pttrn {
		width:32px; 
		display: inline-block;
		text-align: center;
	}
	.vtabs { min-height: 700px; }
	.small_field { width: 60px; }
	.large_field { width: 330px; }
	.slideitem { padding: 10px 25px; }
	.status {
		width:48px;
		height:18px;
		float: left;
		cursor:pointer;
	}
	.status-on { background:url(view/image/on.png) top left no-repeat; }
	.status-off { background:url(view/image/off.png) top left no-repeat; }
	.randomrotate {
		display: inline-block;
		white-space: nowrap;
		width: 200px;
		margin-left: 20px;
		border-left: 1px solid #ccc;
		padding-left: 20px;
	}
	.contentset {
		margin: 22px 0 12px;
		text-align:left;
		padding-left: 10px;
		text-transform:uppercase;
		color:#000;
		border-top:1px solid #DDD;
	}
		.contentset.center { text-align:center; padding:0; }
			.contentset .inner { margin: -0.8em auto 0; font-weight: normal; font-size: 1em; }
			.contentset span { background:#FFF; padding: 0 12px; color: #5fbf00; }
	code { background: #f2f2f2; padding: 0 3px; color: #444;}
	.imagepreview {
		border: 1px solid #eee;
		padding: 5px;
		margin: 5px 10px 5px 0;
		width: 320px;
	}
	.extraimage { text-align: center; }

</style>

<div id="content">

<div class="breadcrumb">
<?php foreach ($breadcrumbs as $breadcrumb) { ?>
<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
<?php } ?>
</div>

<?php if ($error_warning): ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php endif ?>
<?php if ($success): ?>
<div class="success"><?php echo $success; ?></div>
<?php endif; ?>

<div class="box">
	
	<div class="heading">
		<h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
		<div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
	</div>

	<div class="content">
	
		<div>
		
			<?php $strqty=count($stores); if ($strqty>1) { ?>

				<table class="form">
					<tr>
						<td>
							<span class="hey"><?php echo $entry_store; ?></span>
							
							<select name="aslider_store_id" id="aslider_store_id">
								<?php foreach ($stores as $store): ?>
									<option value="<?php echo HTTPS_SERVER . 'index.php?route=module/advanced_slideshow&store_id=' . $store['store_id'] . '&token=' . $this->session->data['token']; ?>"<?php if($store_id == $store['store_id']) echo ' selected="selected"'; ?>><?php echo $store['name']; ?></option>
								<?php endforeach; ?>
							</select>
						</td>
					</tr>
				</table>
								
				<script type="text/javascript">
					$(document).ready(function (){

						$("#aslider_store_id").bind("change", function() {
							window.location = $(this).val();
						});

					});
				</script>
				
			<?php } ?>
		
			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">

				<input type="hidden" name="store_id" value="<?php echo $store_id; ?>" />

				<h3><?php echo $entry_general_settings_sub; ?></h3>

				<table class="form">

					<tr>
						<td><?php echo $entry_module_status; ?></td>
						<td>
						<?php if($slider_general_status == 1) { echo '<div class="status status-on" title="1" rel="slider_general_status"></div>'; } else { echo '<div class="status status-off" title="0" rel="slider_general_status"></div>'; } ?>
						<input name="slider_general_status" value="<?php echo $slider_general_status; ?>" id="slider_general_status" type="hidden" />
						<span class="customhelp"><?php echo $entry_module_status_help; ?></span>
						</td>
					</tr>
					
					<tr>
						<td><?php echo $entry_slider_height; ?><br><span class="customhelp"><?php echo $entry_slider_height_help; ?></span></td>
						<td>
							<input type="text" name="slider_height" value="<?php echo $slider_height; ?>" class="small_field"/> <span class="customhelp">px</span>
						</td>
					</tr>

					<tr>
						<td><?php echo $entry_slider_delay; ?><br><span class="customhelp"><?php echo $entry_slider_delay_help; ?></span></td>
						<td>
							<select name="slider_delay">
							<?php for ($sp=3; $sp < 13; $sp++) { ?>
								<option value="<?php echo $sp; ?>" <?php if($slider_delay == $sp){echo ' selected="selected"';} ?>><?php echo $sp*1000; ?></option>
							<?php } ?>
							</select> <span class="customhelp"><?php echo $entry_slider_delay_mili; ?></span>
						</td>
					</tr>

					<tr>
						<td><?php echo $entry_slider_layout; ?></td>
						<td>
							<select name="slider_main_layout">
								<?php foreach ($slider_layout as $fv => $fc) { ?>
									<?php ($fv ==  $slider_main_layout) ? $current = 'selected' : $current='tabs'; ?>
									<option value="<?php echo $fv; ?>" <?php echo $current; ?> ><?php echo $fc; ?></option>	
								<?php } ?>
							</select>
						</td>
					</tr>

				</table>
				
					<h3><?php echo $entry_slides_setup_sub; ?></h3>

					<table class="form">
						<tr>
							<td><?php echo $entry_slides_quantity; ?></td>
							<td>
								<select name="slides_quantity">
								<?php for ($sp=1; $sp < 7; $sp++) { ?>
									<option value="<?php echo $sp; ?>" <?php if($slides_quantity == $sp){echo ' selected="selected"';} ?>><?php echo $sp; ?></option>
								<?php } ?>
								</select> <span class="hey">*</span>
							</td>
						</tr>

						<tr>
							<td><?php echo $entry_elements_quantity; ?></td>
							<td>
								<select name="elements_quantity">
								<?php for ($sp=1; $sp < 7; $sp++) { ?>
									<option value="<?php echo $sp; ?>" <?php if($elements_quantity == $sp){echo ' selected="selected"';} ?>><?php echo $sp; ?></option>
								<?php } ?>
								</select> <span class="hey">*</span>
							</td>
						</tr>
						<tr>
							<td></td>
							<td><span class="customhelp"><?php echo $entry_quantity_note; ?></span></td>
						</tr>
						<tr>
						<td><?php echo $entry_shuffle_slides; ?></td>
						<td>
						<?php if($shuffle_slides == 1) { echo '<div class="status status-on" title="1" rel="shuffle_slides"></div>'; } else { echo '<div class="status status-off" title="0" rel="shuffle_slides"></div>'; } ?>
						<input name="shuffle_slides" value="<?php echo $shuffle_slides; ?>" id="shuffle_slides" type="hidden" />
						<span class="customhelp"><?php echo $entry_shuffle_slides_help; ?></span>
							</td>
						</tr>
					</table>
					
					<div id="tabs" class="htabs">
						<?php for ($i = 1; $i <= $slides_quantity; $i++) { ?>
						<a href="#tab_slider_<?php echo $i; ?>"><?php echo $entry_slide_tab. " " .$i; ?></a>
						<?php } ?>
					</div>
										
					<?php for ($i = 1; $i <= $slides_quantity; $i++) { ?>
					
					<div id="tab_slider_<?php echo $i; ?>" class="divtabs slideitem">
							
						<div id="tabs_slider_<?php echo $i; ?>_language" class="htabs">
							<?php foreach ($languages as $language) { ?>
							<a href="#tab_slider_<?php echo $i; ?>_language_<?php echo $language['language_id']; ?>"><img src="../image/flags/<?php echo $language['image'] ?>" alt="<?php echo $language['name']; ?>" width="16px" height="11px" /> <?php echo $language['name']; ?></a>
							<?php } ?>
						</div>
							
						<?php foreach ($languages as $language) { ?>
							
							<?php $language_id = $language['language_id']; ?>
							
							<div id="tab_slider_<?php echo $i; ?>_language_<?php echo $language_id; ?>" class="divtabs">

								<table class="form">
									<tr>
										<td><?php echo $entry_slide_status; ?></td>
										<td>
											<?php if(isset($slider[$i][$language_id]['status'])) { ?>
											<?php if($slider[$i][$language_id]['status'] == 1) { echo '<div class="status status-on" title="1" rel="slider_'.$i.'_'.$language_id.'_status"></div>'; } else { echo '<div class="status status-off" title="0" rel="slider_'.$i.'_'.$language_id.'_status"></div>'; } ?>
											
											<input name="slider[<?php echo $i; ?>][<?php echo $language_id; ?>][status]" value="<?php echo $slider[$i][$language_id]['status']; ?>" id="slider_<?php echo $i; ?>_<?php echo $language_id; ?>_status" type="hidden" />
											<?php } else { ?>
											<?php echo '<div class="status status-off" title="0" rel="slider_'.$i.'_'.$language_id.'_status"></div>'; ?>
											<input name="slider[<?php echo $i; ?>][<?php echo $language_id; ?>][status]" value="0" id="slider_<?php echo $i; ?>_<?php echo $language_id; ?>_status" type="hidden" />
											<?php } ?>
										</td>
									</tr>

									<tr>
										<td><?php echo $entry_banner; ?></td>
										<td>
											<table>
												<tr>
													<td>
														<input type="hidden" name="slider[<?php echo $i; ?>][<?php echo $language_id; ?>][banner]" value="<?php if(isset($slider[$i][$language_id]['banner'])) echo $slider[$i][$language_id]['banner']; ?>" id="slider_<?php echo $i; ?>_<?php echo $language_id; ?>_banner" />

														<?php $bannerimage="slider[" . $i ."][". $language_id ."][banner]"; 
														if (isset($slider[$i][$language_id]['banner']) && $slider[$i][$language_id]['banner'] != "" && file_exists(DIR_IMAGE . $slider[$i][$language_id]['banner'])) {
																$previmage = $this->model_tool_image->resize($slider[$i][$language_id]['banner'], 320, 140);
														} else {
																$previmage = $this->model_tool_image->resize('no_image.jpg', 90, 90);
														}
														?>
														<div class="extraimage">
															<div class="imagepreview"><img src="<?php echo $previmage; ?>" id="preview_<?php echo $i; ?>_<?php echo $language_id; ?>" /></div>

															<div class="controls"><a onclick="image_upload('slider_<?php echo $i; ?>_<?php echo $language_id; ?>_banner', 'preview_<?php echo $i; ?>_<?php echo $language_id; ?>');"><?php echo $text_select; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#preview_<?php echo $i; ?>_<?php echo $language_id; ?>').attr('src', '<?php echo $no_image; ?>'); $('#slider_<?php echo $i; ?>_<?php echo $language_id; ?>_banner').attr('value', '');"><?php echo $text_clear; ?></a></div>
														</div>
													</td>
													<td><span class="customhelp"><?php echo $entry_banner_help; ?></span></td>
												</tr>
											</table>
										</td>
										
									</tr>
									<tr>
										<td><?php echo $entry_link; ?></td>
										<td>
											<input type="text" name="slider[<?php echo $i; ?>][<?php echo $language_id; ?>][link]" value="<?php echo isset($slider[$i][$language_id]['link']) ? $slider[$i][$language_id]['link'] : '' ; ?>" class="large_field" />
											<br><span class="customhelp"><?php echo $entry_link_help; ?></span>
										</td>
									</tr>

									<tr>
										<td><?php echo $entry_transition; ?></td>
										<td>
											<select name="slider[<?php echo $i; ?>][<?php echo $language_id; ?>][transition_effect]" >
												<?php foreach ($transition as $slv => $slc) { ?>
													<?php (isset($slider[$i][$language_id]['transition_effect']) && $slv ==  $slider[$i][$language_id]['transition_effect']) ? $current = 'selected' : $current = ''; ?>
													<option value="<?php echo $slv; ?>" <?php echo $current; ?> ><?php echo $slc; ?></option>	
												<?php } ?>
											</select>
										</td>
									</tr>

								</table>

								<h3><?php echo $entry_slide_components_sub; ?></h3>
								<p>
									<span class="customhelp"><?php echo $entry_components_status; ?></span>
								</p>
									
								<div id="tabs_slider_elements_<?php echo $i; ?>_<?php echo $language_id; ?>" class="htabs">
									<?php for ($m = 1; $m <= $elements_quantity; $m++) { ?>
									<a href="#tab_add_element_<?php echo $i; ?><?php echo $language_id ?>_<?php echo $m; ?>"><?php echo $m; ?></a>
									<?php } ?>
								</div>
									
								<?php for ($m = 1; $m <= $elements_quantity; $m++) { ?>
								
								<div id="tab_add_element_<?php echo $i; ?><?php echo $language_id ?>_<?php echo $m; ?>" class="divtab">
								
									<table class="form">

										<tr>
											<td><?php echo $entry_element_status; ?></td>
											<td>
												<?php if(isset($slider[$i][$language_id][$m]['status'])) { ?>
												<?php if($slider[$i][$language_id][$m]['status'] == 1) { echo '<div class="status status-on" title="1" rel="slider_'.$i.'_'.$language_id.'_'.$m.'_status"></div>'; } else { echo '<div class="status status-off" title="0" rel="slider_'.$i.'_'.$language_id.'_'.$m.'_status"></div>'; } ?>
												
												<input name="slider[<?php echo $i; ?>][<?php echo $language_id; ?>][<?php echo $m; ?>][status]" value="<?php echo $slider[$i][$language_id][$m]['status']; ?>" id="slider_<?php echo $i; ?>_<?php echo $language_id; ?>_<?php echo $m; ?>_status" type="hidden" />
												<?php } else { ?>
												<?php echo '<div class="status status-off" title="0" rel="slider_'.$i.'_'.$language_id.'_'.$m.'_status"></div>'; ?>
												<input name="slider[<?php echo $i; ?>][<?php echo $language_id; ?>][<?php echo $m; ?>][status]" value="0" id="slider_<?php echo $i; ?>_<?php echo $language_id; ?>_<?php echo $m; ?>_status" type="hidden" />
												<?php } ?>

											</td>
										</tr>

										<tr>
											<td><?php echo $entry_html; ?><br><span class="customhelp"><?php echo $entry_html_advice; ?></span></td>
											<td>
											<table>
												<tr>
													<td>
														<div class="customhelp"><?php echo $entry_extra_image_help; ?></div>
															<input type="hidden" name="slider[<?php echo $i; ?>][<?php echo $language_id; ?>][<?php echo $m; ?>][extra_image]" value="<?php echo isset($slider[$i][$language_id][$m]['extra_image']) ? $slider[$i][$language_id][$m]['extra_image'] : ''; ?>" id="slider_<?php echo $i; ?>_<?php echo $language_id; ?>_<?php echo $m; ?>_extra_image" />

															<?php $bannerimage="slider[" . $i ."][". $language_id ."][extra_image]"; 
															if (isset($slider[$i][$language_id][$m]['extra_image']) && $slider[$i][$language_id][$m]['extra_image'] != "" && file_exists(DIR_IMAGE . $slider[$i][$language_id][$m]['extra_image'])) {
																	$prevextraimage = $this->model_tool_image->resize($slider[$i][$language_id][$m]['extra_image'], 90, 90);
															} else {
																	$prevextraimage = $this->model_tool_image->resize('no_image.jpg', 90, 90);
															}
															?>
															<div class="extraimage">

																<div class="imagepreview"><img src="<?php echo $prevextraimage; ?>" id="preview_<?php echo $i; ?>_<?php echo $language_id; ?>_<?php echo $m; ?>" /></div>
															
																<div class="controls"><a onclick="image_upload('slider_<?php echo $i; ?>_<?php echo $language_id; ?>_<?php echo $m; ?>_extra_image', 'preview_<?php echo $i; ?>_<?php echo $language_id; ?>_<?php echo $m; ?>');"><?php echo $text_select; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#preview_<?php echo $i; ?>_<?php echo $language_id; ?>_<?php echo $m; ?>').attr('src', '<?php echo $no_image; ?>'); $('#slider_<?php echo $i; ?>_<?php echo $language_id; ?>_<?php echo $m; ?>_extra_image').attr('value', '');"><?php echo $text_clear; ?></a>
																</div>

															</div>
														</td>
														<td></td>
													</tr>

													<tr><td>
															<div class="contentset center">
																<div class="inner"><span>OR</span></div>
															</div>
														</td>
														<td></td>
													</tr>

													<tr>
														<td>
															<span class="customhelp" id="videolink"><?php echo $entry_video_help; ?></span><br>
															<input type="text" name="slider[<?php echo $i; ?>][<?php echo $language_id; ?>][<?php echo $m; ?>][video]" value="<?php echo isset($slider[$i][$language_id][$m]['video']) ? $slider[$i][$language_id][$m]['video'] : ''; ?>" class="large_field"/>

														</td>
														<td>
															<div class="customhelp"><?php echo $entry_video_examples; ?></div>
														</td>
													</tr>

													<tr>
														<td><?php echo $entry_autoplay_video; ?>
															<?php if(isset($slider[$i][$language_id][$m]['autoplayvideo'])) { ?>
																<?php if($slider[$i][$language_id][$m]['autoplayvideo'] == 1) { echo '<div class="status status-on" title="1" rel="slider_'.$i.'_'.$language_id.'_'.$m.'_autoplayvideo"></div>'; } else { echo '<div class="status status-off" title="0" rel="slider_'.$i.'_'.$language_id.'_'.$m.'_autoplayvideo"></div>'; } ?>
																
																<input name="slider[<?php echo $i; ?>][<?php echo $language_id; ?>][<?php echo $m; ?>][autoplayvideo]" value="<?php echo $slider[$i][$language_id][$m]['autoplayvideo']; ?>" id="slider_<?php echo $i; ?>_<?php echo $language_id; ?>_<?php echo $m; ?>_autoplayvideo" type="hidden" />
																<?php } else { ?>
																<?php echo '<div class="status status-off" title="0" rel="slider_'.$i.'_'.$language_id.'_'.$m.'_status"></div>'; ?>
																<input name="slider[<?php echo $i; ?>][<?php echo $language_id; ?>][<?php echo $m; ?>][autoplayvideo]" value="0" id="slider_<?php echo $i; ?>_<?php echo $language_id; ?>_<?php echo $m; ?>_autoplayvideo" type="hidden" />
															<?php } ?>
														</td>
													</tr>

													<tr><td>
															<div class="contentset center">
																<div class="inner"><span>OR</span></div>
															</div>
														</td>
														<td></td>
													</tr>

													<tr>
														<td>
															<div class="customhelp"><?php echo $entry_html_help; ?></div>
															<textarea rows="6" cols="60" name="slider[<?php echo $i; ?>][<?php echo $language_id; ?>][<?php echo $m; ?>][text]"><?php echo isset($slider[$i][$language_id][$m]['text']) ? $slider[$i][$language_id][$m]['text'] : ''; ?></textarea>
														</td>
														<td>
															<div class="customhelp"><?php echo $entry_html_examples; ?></div>
														</td>
													</tr>

												</table>
											</td>
										</tr>

										<tr>
											<td><?php echo $entry_style; ?></td>
											<td>
												<select name="slider[<?php echo $i; ?>][<?php echo $language_id; ?>][<?php echo $m; ?>][style]" >
													<?php foreach ($caption_style as $slv => $slc) { ?>
														<?php (isset($slider[$i][$language_id][$m]['style']) && $slv == $slider[$i][$language_id][$m]['style']) ? $current = 'selected' : $current = ''; ?>
														<option value="<?php echo $slv; ?>" <?php echo $current; ?> ><?php echo $slc; ?></option>
													<?php } ?>
												</select>
											</td>
										</tr>

										<tr>
											<td><?php echo $entry_animation; ?></td>
											<td>
												<span class="customhelp">Start:</span>
												<select name="slider[<?php echo $i; ?>][<?php echo $language_id; ?>][<?php echo $m; ?>][animation_in]" >
													<?php foreach ($animation_in as $slv => $slc) { ?>
														<?php (isset($slider[$i][$language_id][$m]['animation_in']) && $slv == $slider[$i][$language_id][$m]['animation_in']) ? $current = 'selected' : $current = ''; ?>
														<option value="<?php echo $slv; ?>" <?php echo $current; ?> ><?php echo $slc; ?></option>	
													<?php } ?>
												</select>

												<span class="customhelp">End:</span>
												<select name="slider[<?php echo $i; ?>][<?php echo $language_id; ?>][<?php echo $m; ?>][animation_out]" >
													<?php foreach ($animation_out as $slv => $slc) { ?>
														<?php (isset($slider[$i][$language_id][$m]['animation_out']) && $slv == $slider[$i][$language_id][$m]['animation_out']) ? $current = 'selected' : $current = ''; ?>
														<option value="<?php echo $slv; ?>" <?php echo $current; ?> ><?php echo $slc; ?></option>	
													<?php } ?>
												</select>
											</td>
										</tr>

										<tr>
											<td><?php echo $entry_easing; ?></td>
											<td>
												<span class="customhelp">Start:</span>
												<select name="slider[<?php echo $i; ?>][<?php echo $language_id; ?>][<?php echo $m; ?>][easing]" >
													<?php foreach ($easing as $slv => $slc) { ?>
														<?php (isset($slider[$i][$language_id][$m]['easing']) && $slv == $slider[$i][$language_id][$m]['easing']) ? $current = 'selected' : $current = ''; ?>
														<option value="<?php echo $slv; ?>" <?php echo $current; ?> ><?php echo $slc; ?></option>	
													<?php } ?>
												</select>

												<span class="customhelp">End:</span>
												<select name="slider[<?php echo $i; ?>][<?php echo $language_id; ?>][<?php echo $m; ?>][endeasing]" >
													<?php foreach ($easing as $slv => $slc) { ?>
														<?php (isset($slider[$i][$language_id][$m]['endeasing']) && $slv == $slider[$i][$language_id][$m]['endeasing']) ? $current = 'selected' : $current = ''; ?>
														<option value="<?php echo $slv; ?>" <?php echo $current; ?> ><?php echo $slc; ?></option>	
													<?php } ?>
												</select>
											</td>
										</tr>

										<tr>
											<td><?php echo $entry_rotate; ?></td>
											<td>
												<span class="customhelp"><?php echo $entry_rotate_help; ?></span>
												<?php if(isset($slider[$i][$language_id][$m]['randomrotate'])) { ?>
													<?php if($slider[$i][$language_id][$m]['randomrotate'] == 1) { echo '<div class="status status-on" title="1" rel="slider_'.$i.'_'.$language_id.'_'.$m.'_randomrotate"></div>'; } else { echo '<div class="status status-off" title="0" rel="slider_'.$i.'_'.$language_id.'_'.$m.'_randomrotate"></div>'; } ?>
													
													<input name="slider[<?php echo $i; ?>][<?php echo $language_id; ?>][<?php echo $m; ?>][randomrotate]" value="<?php echo $slider[$i][$language_id][$m]['randomrotate']; ?>" id="slider_<?php echo $i; ?>_<?php echo $language_id; ?>_<?php echo $m; ?>_randomrotate" type="hidden" />
													<?php } else { ?>
													<?php echo '<div class="status status-off" title="0" rel="slider_'.$i.'_'.$language_id.'_'.$m.'_status"></div>'; ?>
													<input name="slider[<?php echo $i; ?>][<?php echo $language_id; ?>][<?php echo $m; ?>][randomrotate]" value="0" id="slider_<?php echo $i; ?>_<?php echo $language_id; ?>_<?php echo $m; ?>_randomrotate" type="hidden" />
												<?php } ?>
											</td>
										</tr>

										<tr>
											<td></td>
											<td><span class="customhelp"><?php echo $entry_video_note; ?></span></td>
										</tr>

										<tr>
											<td><?php echo $entry_speed; ?><br><span class="customhelp"><?php echo $entry_speed_help; ?></span></td>
											<td>
												<input type="text" name="slider[<?php echo $i; ?>][<?php echo $language_id; ?>][<?php echo $m; ?>][speed]" value="<?php echo isset($slider[$i][$language_id][$m]['speed']) ? $slider[$i][$language_id][$m]['speed'] : '300'; ?>" class="small_field"/>
												<span class="customhelp"><?php echo $entry_speed_recommended; ?></span>

											</td>
										</tr>

										<tr>
											<td><?php echo $entry_start; ?><br><span class="customhelp"><?php echo $entry_start_help; ?></span></td>
											<td>
												<input type="text" name="slider[<?php echo $i; ?>][<?php echo $language_id; ?>][<?php echo $m; ?>][start]" value="<?php echo isset($slider[$i][$language_id][$m]['start']) ? $slider[$i][$language_id][$m]['start'] : '300'; ?>" class="small_field"/>
												<span class="customhelp"><?php echo $entry_start_recommended; ?></span>
												
											</td>
										</tr>

										<tr>
											<td><?php echo $entry_position; ?></td>
											<td>
												<span class="customhelp">X:</span>
												<input type="text" name="slider[<?php echo $i; ?>][<?php echo $language_id; ?>][<?php echo $m; ?>][x]" value="<?php echo isset($slider[$i][$language_id][$m]['x']) ? $slider[$i][$language_id][$m]['x'] : '100'; ?>" class="small_field" />

												<span class="customhelp">Y:</span>
												<input type="text" name="slider[<?php echo $i; ?>][<?php echo $language_id; ?>][<?php echo $m; ?>][y]" value="<?php echo isset($slider[$i][$language_id][$m]['y']) ? $slider[$i][$language_id][$m]['y'] : '100'; ?>" class="small_field" />

												<span class="customhelp"><?php echo $entry_position_recommended; ?></span>
											</td>
										</tr>


									</table>
								
								</div>
								
								<?php } ?>

								<script type="text/javascript"><!--
								$('#tabs_slider_elements_<?php echo $i; ?>_<?php echo $language_id; ?> a').tabs();
								</script> 
														
							</div>
							
							<?php } ?>

						<script type="text/javascript"><!--
						$('#tabs_slider_<?php echo $i; ?>_language a').tabs();
						//--></script> 
					
					</div>
					

					<?php } ?>

				<!-- End Tabs -->
			
			</form>
		
		</div>
	
	</div>
	

</div>

</div>

<script type="text/javascript"><!--
function image_upload(field, preview) {
	$('#dialog').remove();
	
	$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');
	
	$('#dialog').dialog({
		title: '<?php echo $text_image_manager; ?>',
		close: function (event, ui) {
			if ($('#' + field).attr('value')) {
				$.ajax({
					url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).val()),
					dataType: 'text',
					success: function(data) {
						$('#' + preview).replaceWith('<img src="' + data + '" alt="" id="' + preview + '" />');
					}
				});
			}
		},  
		bgiframe: false,
		width: 700,
		height: 400,
		resizable: false,
		modal: false
	});
};
//--></script> 

<script type="text/javascript"><!--
	$('#tabs a').tabs();
//--></script> 

<script type="text/javascript">
jQuery(document).ready(function($) {

	$(".status").click(function () {
		var styl = $(this).attr("rel");
		var co = $(this).attr("title");
		
		if(co == 1) {
			$(this).removeClass('status-on');
			$(this).addClass('status-off');
			$(this).attr("title", "0");
			$("#"+styl+"").val(0);
		}
		if(co == 0) {
			$(this).addClass('status-on');
			$(this).removeClass('status-off');
			$(this).attr("title", "1");
			$("#"+styl+"").val(1);
		}
	});
});	
</script>

<?php echo $footer; ?>
