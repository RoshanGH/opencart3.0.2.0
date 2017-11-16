<?php echo $header; ?>

<?php 

global $session;

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

(!isset($aslider_delay)) ? $aslider_delay = 9 : '';
(!isset($aslider_slides_qty)) ? $aslider_slides_qty = 3 : '';
(!isset($aslider_elements_qty)) ? $aslider_elements_qty = 2 : '';
if(empty($aslider_height)) $aslider_height = 420;

?>
 
<style type="text/css">
	.box>.content h2 { border-bottom: 0; }
	.hey {color: #ff0000;}
	.pttrn {
		width:32px; 
		display: inline-block;
		text-align: center;
	}
	
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
	.nav-tabs { margin-bottom: 0; }
	.tab-content {
		border: 1px solid #ddd;
		border-top: 0;
		background: #fff;
		padding: 20px;
	}
	.tab-content.tab_slides,
	#tab_slides .active a {
		background: #f9f9f9;
	}
	#accordion .panel-default {border-top:1px solid #e8e8e8; }
	.alert {padding: 6px 10px;}

</style>

<?php echo $column_left; ?>

<div id="content">

	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<button type="submit" form="form-advslider" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
				<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
			<h1><?php echo $heading_title; ?></h1>
			<ul class="breadcrumb">
				<?php foreach ($breadcrumbs as $breadcrumb) { ?>
				<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php } ?>
			</ul>
		</div>
	</div>

	<div class="container-fluid">
		<?php if ($error_warning) { ?>
		<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
			<button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
		<?php } ?>
		<?php if ($success) { ?>
		<div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
			<button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
		<?php } ?>

		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $heading_title; ?></h3>
			</div>
			<div class="panel-body">

		<div class="row form-horizontal">
			<div class="col-sm-6 col-md-5 col-lg-4">

				<?php $strqty=count($stores); if ($strqty>1) { ?>

					<div class="form-group">
						<label class="col-sm-2 control-label" for="sellegance_main_layout"><?php echo $entry_store; ?></label>
						<div class="col-sm-10 ">
							<select name="aslider_store_id" id="aslider_store_id" class="form-control input">
								<?php foreach ($stores as $store): ?>
								<option value="<?php echo HTTPS_SERVER . 'index.php?route=module/advanced_slideshow&store_id=' . $store['store_id'] . '&token=' . $session->data['token']; ?>"<?php if($store_id == $store['store_id']) echo ' selected="selected"'; ?>><?php echo $store['name']; ?></option>
								<?php endforeach; ?>
							</select>
						</div>
					</div>					

					<script type="text/javascript">
						$(document).ready(function (){
							$("#aslider_store_id").bind("change", function() {
								window.location = $(this).val();
							});
						});
					</script>

				<?php } ?>

			</div>
		</div>
		
			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-advslider" class="form-horizontal">

				<input type="hidden" name="store_id" value="<?php echo $store_id; ?>" />

				<fieldset>
						
					<legend><?php echo $entry_general_settings_sub; ?></legend>

					<div class="form-group">
						<label class="col-sm-2 control-label" for="aslider_general_status"><?php echo $entry_module_status; ?></label>
						<div class="col-sm-10">
							<div class="btn-group btn-toggle" data-toggle="buttons">
								<?php if($aslider_general_status == 1) { ?>
									<label class="btn btn-success btn-sm active">
										<input type="radio" name="aslider_general_status" value="1" checked="checked">ON
									</label>
									<label class="btn btn-default btn-sm">
										<input type="radio" name="aslider_general_status" value="0">OFF
									</label>
								<?php } else { ?>
									<label class="btn btn-default btn-sm">
										<input type="radio" name="aslider_general_status" value="1">ON
									</label>
									<label class="btn btn-success btn-sm active">
										<input type="radio" name="aslider_general_status" value="0" checked="checked">OFF
									</label>
								<?php } ?>
							</div>
							<span class="help-block"><?php echo $entry_module_status_help; ?></span>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label" for="aslider_height"><?php echo $entry_slider_height; ?></label>
						<div class="col-sm-10">
							<input type="text" name="aslider_height" value="<?php echo $aslider_height; ?>" class="form-control"/>
							<span class="help-block"><?php echo $entry_slider_height_help; ?></span>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label" for="aslider_delay"><?php echo $entry_slider_delay; ?></label>
						<div class="col-sm-10">
							<select name="aslider_delay" class="form-control">
							<?php for ($sp=3; $sp < 13; $sp++) { ?>
								<option value="<?php echo $sp; ?>" <?php if($aslider_delay == $sp){echo ' selected="selected"';} ?>><?php echo $sp*1000; ?></option>
							<?php } ?>
							</select>
							<span class="help-block"><?php echo $entry_slider_delay_help; ?></span>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label" for="aslider_main_layout"><?php echo $entry_slider_layout; ?></label>
						<div class="col-sm-10">
							<select name="aslider_main_layout" class="form-control">
								<?php foreach ($slider_layout as $fv => $fc) { ?>
									<?php ($fv ==  $aslider_main_layout) ? $current = 'selected' : $current='tabs'; ?>
									<option value="<?php echo $fv; ?>" <?php echo $current; ?> ><?php echo $fc; ?></option>	
								<?php } ?>
							</select>
						</div>
					</div>

					<legend><?php echo $entry_slides_setup_sub; ?></legend>

					<div class="form-group">
						<div class="col-sm-2"></div>
						<div class="col-sm-10">
							<span class="alert alert-info"><?php echo $entry_quantity_note; ?></span>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label" for="aslider_slides_qty"><?php echo $entry_slides_quantity; ?> <i class="hey">*</i></label>
						<div class="col-sm-10">
							<select name="aslider_slides_qty" class="form-control">
								<?php for ($sp=1; $sp < 7; $sp++) { ?>
									<option value="<?php echo $sp; ?>" <?php if($aslider_slides_qty == $sp){echo ' selected="selected"';} ?>><?php echo $sp; ?></option>
								<?php } ?>
							</select>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label" for="aslider_elements_qty"><?php echo $entry_elements_quantity; ?> <i class="hey">*</i></label>
						<div class="col-sm-10">
							<select name="aslider_elements_qty" class="form-control">
								<?php for ($sp=1; $sp < 7; $sp++) { ?>
									<option value="<?php echo $sp; ?>" <?php if($aslider_elements_qty == $sp){echo ' selected="selected"';} ?>><?php echo $sp; ?></option>
								<?php } ?>
							</select>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label" for="aslider_shuffle_slides"><?php echo $entry_shuffle_slides; ?></label>
						<div class="col-sm-10">
							<div class="btn-group btn-toggle" data-toggle="buttons">
								<?php if($aslider_shuffle_slides == 1) { ?>
									<label class="btn btn-success btn-sm active">
										<input type="radio" name="aslider_shuffle_slides" value="1" checked="checked">ON
									</label>
									<label class="btn btn-default btn-sm">
										<input type="radio" name="aslider_shuffle_slides" value="0">OFF
									</label>
								<?php } else { ?>
									<label class="btn btn-default btn-sm">
										<input type="radio" name="aslider_shuffle_slides" value="1">ON
									</label>
									<label class="btn btn-success btn-sm active">
										<input type="radio" name="aslider_shuffle_slides" value="0" checked="checked">OFF
									</label>
								<?php } ?>
							</div>
							<span class="help-block"><?php echo $entry_shuffle_slides_help; ?></span>
						</div>
					</div>
					
					<ul id="tab_slides" class="nav nav-tabs">
						<?php for ($i = 1; $i <= $aslider_slides_qty; $i++) { ?>
						<li><a href="#tab_slider_<?php echo $i; ?>" data-toggle="tab"><?php echo $entry_slide_tab. " " .$i; ?></a></li>
						<?php } ?>
					</ul>

					<div class="tab-content tab_slides">
										
						<?php for ($i = 1; $i <= $aslider_slides_qty; $i++) { ?>
						
						<div id="tab_slider_<?php echo $i; ?>" class="tab-pane">
								
							<ul id="tabs_slider_<?php echo $i; ?>_language" class="nav nav-tabs">
								<?php foreach ($languages as $language) { ?>
								<li><a href="#tab_slider_<?php echo $i; ?>_language_<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" alt="<?php echo $language['name']; ?>" width="16px" height="11px" /> <?php echo $language['name']; ?></a></li>
								<?php } ?>
							</ul>

							<div class="tab-content">
								
							<?php foreach ($languages as $language) { ?>
								
								<?php $language_id = $language['language_id']; ?>
								
								<div id="tab_slider_<?php echo $i; ?>_language_<?php echo $language_id; ?>" class="tab-pane">

									<div class="form-group">
										<label class="col-sm-2 control-label" for="aslider[<?php echo $i; ?>][<?php echo $language_id; ?>][status]"><?php echo $entry_slide_status; ?></label>
										<div class="col-sm-10">
											<div class="btn-group btn-toggle" data-toggle="buttons">
												<?php if(isset($aslider[$i][$language_id]['status']) && $aslider[$i][$language_id]['status'] == 1) { ?>
													<label class="btn btn-success btn-sm active">
														<input type="radio" name="aslider[<?php echo $i; ?>][<?php echo $language_id; ?>][status]" value="1" checked="checked">ON
													</label>
													<label class="btn btn-default btn-sm">
														<input type="radio" name="aslider[<?php echo $i; ?>][<?php echo $language_id; ?>][status]" value="0">OFF
													</label>
												<?php } else { ?>
													<label class="btn btn-default btn-sm">
														<input type="radio" name="aslider[<?php echo $i; ?>][<?php echo $language_id; ?>][status]" value="1">ON
													</label>
													<label class="btn btn-success btn-sm active">
														<input type="radio" name="aslider[<?php echo $i; ?>][<?php echo $language_id; ?>][status]" value="0" checked="checked">OFF
													</label>
												<?php } ?>
											</div>

										</div>
									</div>

									<div class="form-group">
										<label class="col-sm-2 control-label" for="aslider[<?php echo $i; ?>][<?php echo $language_id; ?>][banner]"><?php echo $entry_banner; ?></label>
										<div class="col-sm-10">
											<a href="" id="thumb-image<?php echo $i; ?>_<?php echo $language_id; ?>" data-toggle="image" class="img-thumbnail">
												<img src="<?php echo (isset($aslider[$i][$language_id]['banner_preview'])) ? $aslider[$i][$language_id]['banner_preview'] : $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" />
											</a>
											<input type="hidden" name="aslider[<?php echo $i; ?>][<?php echo $language_id; ?>][banner]" value="<?php if(isset($aslider[$i][$language_id]['banner'])) echo $aslider[$i][$language_id]['banner']; ?>" id="input-image<?php echo $i; ?>_<?php echo $language_id; ?>" />
											<span class="help-block"><?php echo $entry_banner_help; ?></span>
										</div>
									</div>

									<div class="form-group">
										<label class="col-sm-2 control-label" for="aslider[<?php echo $i; ?>][<?php echo $language_id; ?>][link]"><?php echo $entry_link; ?></label>
										<div class="col-sm-10">
											<input type="text" name="aslider[<?php echo $i; ?>][<?php echo $language_id; ?>][link]" value="<?php echo isset($aslider[$i][$language_id]['link']) ? $aslider[$i][$language_id]['link'] : '' ; ?>" class="form-control" />
											<span class="help-block"><?php echo $entry_link_help; ?></span>
										</div>
									</div>

									<div class="form-group">
										<label class="col-sm-2 control-label" for="aslider[<?php echo $i; ?>][<?php echo $language_id; ?>][transition_effect]"><?php echo $entry_transition; ?></label>
										<div class="col-sm-10">
											<select name="aslider[<?php echo $i; ?>][<?php echo $language_id; ?>][transition_effect]" class="form-control">
													<?php foreach ($transition as $slv => $slc) { ?>
														<?php (isset($aslider[$i][$language_id]['transition_effect']) && $slv ==  $aslider[$i][$language_id]['transition_effect']) ? $current = 'selected' : $current = ''; ?>
														<option value="<?php echo $slv; ?>" <?php echo $current; ?> ><?php echo $slc; ?></option>	
													<?php } ?>
												</select>
										</div>
									</div>

									<legend><?php echo $entry_slide_components_sub; ?></legend>
									
									
										
									<ul id="tabs_slider_elements_<?php echo $i; ?>_<?php echo $language_id; ?>" class="nav nav-tabs">
										<?php for ($m = 1; $m <= $aslider_elements_qty; $m++) { ?>
										<li><a href="#tab_add_element_<?php echo $i; ?><?php echo $language_id ?>_<?php echo $m; ?>" data-toggle="tab"><?php echo $m; ?> <?php echo ($m==1) ? '<span class="hey">*</span>':''; ?></a></li>
										<?php } ?>
										<li class="alert alert-info"><?php echo $entry_components_status; ?></li>
									</ul>

									<div class="tab-content">
										
										<?php for ($m = 1; $m <= $aslider_elements_qty; $m++) { ?>
										
										<div id="tab_add_element_<?php echo $i; ?><?php echo $language_id ?>_<?php echo $m; ?>" class="tab-pane">

											<div class="form-group">
												<label class="col-sm-2 control-label" for="aslider[<?php echo $i; ?>][<?php echo $language_id; ?>][<?php echo $m; ?>][status]"><?php echo $entry_element_status; ?></label>
												<div class="col-sm-10">
													<div class="btn-group btn-toggle" data-toggle="buttons">
														<?php if(isset($aslider[$i][$language_id][$m]['status']) &&  $aslider[$i][$language_id][$m]['status'] == 1) { ?>
															<label class="btn btn-success btn-sm active">
																<input type="radio" name="aslider[<?php echo $i; ?>][<?php echo $language_id; ?>][<?php echo $m; ?>][status]" value="1" checked="checked">ON
															</label>
															<label class="btn btn-default btn-sm">
																<input type="radio" name="aslider[<?php echo $i; ?>][<?php echo $language_id; ?>][<?php echo $m; ?>][status]" value="0">OFF
															</label>
														<?php } else { ?>
															<label class="btn btn-default btn-sm">
																<input type="radio" name="aslider[<?php echo $i; ?>][<?php echo $language_id; ?>][<?php echo $m; ?>][status]" value="1">ON
															</label>
															<label class="btn btn-success btn-sm active">
																<input type="radio" name="aslider[<?php echo $i; ?>][<?php echo $language_id; ?>][<?php echo $m; ?>][status]" value="0" checked="checked">OFF
															</label>
														<?php } ?>
													</div>

												</div>
											</div>

											<div class="form-group">
												<div class="col-sm-2">
													<label class="control-label" style="display:block" for="aslider[<?php echo $i; ?>][<?php echo $language_id; ?>][<?php echo $m; ?>][status]"><?php echo $entry_html; ?></label>
												</div>
												
												<div class="col-sm-10">

													<div class="help-block"><?php echo $entry_html_advice; ?></div>

													<?php $sffx=$i.'_'.$language_id.'_'. $m;?>

													<?php
														$image_in = ''; $video_in = ''; $text_in = '';

														if (isset($aslider[$i][$language_id][$m]['extra_image']) && $aslider[$i][$language_id][$m]['extra_image']!='') {
															$image_in = 'in';
														} else if (isset($aslider[$i][$language_id][$m]['video']) && $aslider[$i][$language_id][$m]['video']!='') {
															$video_in = 'in';
														} else if (isset($aslider[$i][$language_id][$m]['text']) && $aslider[$i][$language_id][$m]['text']!='') {
															$text_in = 'in';
														} else {
															$image_in = 'in';
														}
													?>

													<div class="panel-group" id="accordion-<?php echo $sffx; ?>" role="tablist" aria-multiselectable="true">
													  
													  <div class="panel panel-default">
													    <div class="panel-heading" role="tab" id="heading1-<?php echo $sffx; ?>">
													      <h4 class="panel-title">
													        <a data-toggle="collapse" data-parent="#accordion-<?php echo $sffx; ?>" href="#collapse1-<?php echo $sffx; ?>" aria-expanded="true" aria-controls="collapse1-<?php echo $sffx; ?>">
													          a. <?php echo $entry_extra_image_help; ?>
													        </a>
													      </h4>
													    </div>
													    <div id="collapse1-<?php echo $sffx; ?>" class="panel-collapse collapse <?php echo $image_in;?>" role="tabpanel" aria-labelledby="heading1-<?php echo $sffx; ?>">
													      <div class="panel-body">
													        <a href="" id="slider_<?php echo $i; ?>_<?php echo $language_id; ?>_<?php echo $m; ?>_extra_image_link" data-toggle="image" class="img-thumbnail">
													        	<img src="<?php echo (isset($aslider[$i][$language_id][$m]['extra_image'])) ? $aslider[$i][$language_id][$m]['extra_image_preview'] : $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" />
													        </a>
													        <input type="hidden" name="aslider[<?php echo $i; ?>][<?php echo $language_id; ?>][<?php echo $m; ?>][extra_image]" value="<?php echo isset($aslider[$i][$language_id][$m]['extra_image']) ? $aslider[$i][$language_id][$m]['extra_image'] : ''; ?>" id="slider_<?php echo $i; ?>_<?php echo $language_id; ?>_<?php echo $m; ?>_extra_image" />
													      </div>
													    </div>
													  </div> <!-- .panel-default -->

													  <div class="panel panel-default">
													    <div class="panel-heading" role="tab" id="heading2-<?php echo $sffx; ?>">
													      <h4 class="panel-title">
													        <a data-toggle="collapse" data-parent="#accordion-<?php echo $sffx; ?>" href="#collapse2-<?php echo $sffx; ?>" aria-expanded="true" aria-controls="collapse2-<?php echo $sffx; ?>">
													          b. <?php echo $entry_video_help; ?>
													        </a>
													      </h4>
													    </div>
													    <div id="collapse2-<?php echo $sffx; ?>" class="panel-collapse collapse <?php echo $video_in;?>" role="tabpanel" aria-labelledby="headingOne">
													      <div class="panel-body">

														      <div class="col-sm-6">

														      	<div class="form-group">
																			<input type="text" name="aslider[<?php echo $i; ?>][<?php echo $language_id; ?>][<?php echo $m; ?>][video]" value="<?php echo isset($aslider[$i][$language_id][$m]['video']) ? $aslider[$i][$language_id][$m]['video'] : ''; ?>" class="form-control"/>
																		</div>

																		<div class="form-group">
																			<label class="control-label" for="aslider[<?php echo $i; ?>][<?php echo $language_id; ?>][<?php echo $m; ?>][autoplayvideo]"><?php echo $entry_autoplay_video; ?></label>
																			<div class="btn-group btn-toggle" data-toggle="buttons">
																				<?php if(isset($aslider[$i][$language_id][$m]['autoplayvideo']) && $aslider[$i][$language_id][$m]['autoplayvideo'] == 1) { ?>
																					<label class="btn btn-success btn-sm active">
																						<input type="radio" name="aslider[<?php echo $i; ?>][<?php echo $language_id; ?>][<?php echo $m; ?>][autoplayvideo]" value="1" checked="checked">ON
																					</label>
																					<label class="btn btn-default btn-sm">
																						<input type="radio" name="aslider[<?php echo $i; ?>][<?php echo $language_id; ?>][<?php echo $m; ?>][autoplayvideo]" value="0">OFF
																					</label>
																				<?php } else { ?>
																					<label class="btn btn-default btn-sm">
																						<input type="radio" name="aslider[<?php echo $i; ?>][<?php echo $language_id; ?>][<?php echo $m; ?>][autoplayvideo]" value="1">ON
																					</label>
																					<label class="btn btn-success btn-sm active">
																						<input type="radio" name="aslider[<?php echo $i; ?>][<?php echo $language_id; ?>][<?php echo $m; ?>][autoplayvideo]" value="0" checked="checked">OFF
																					</label>
																				<?php } ?>
																			</div>
																		</div>

																	</div>

																	<div class="col-sm-6">
																		<?php echo $entry_video_examples; ?>
																	</div>

													      </div>
													    </div>
												    </div> <!-- .panel-default -->

												    <div class="panel panel-default">
													    <div class="panel-heading" role="tab" id="heading3-<?php echo $sffx; ?>">
													      <h4 class="panel-title">
													        <a data-toggle="collapse" data-parent="#accordion-<?php echo $sffx; ?>" href="#collapse3-<?php echo $sffx; ?>" aria-expanded="true" aria-controls="collapse3-<?php echo $sffx; ?>">
													          c. <?php echo $entry_html_help; ?>
													        </a>
													      </h4>
													    </div>
													    <div id="collapse3-<?php echo $sffx; ?>" class="panel-collapse collapse <?php echo $text_in;?>" role="tabpanel" aria-labelledby="heading3">
													      <div class="panel-body">

														      <div class="col-sm-6">
														      	<div class="form-group">
																			<textarea rows="6" cols="60" name="aslider[<?php echo $i; ?>][<?php echo $language_id; ?>][<?php echo $m; ?>][text]" class="form-control"><?php echo isset($aslider[$i][$language_id][$m]['text']) ? $aslider[$i][$language_id][$m]['text'] : ''; ?></textarea>
																		</div>
																	</div>

																	<div class="col-sm-6">
																		<?php echo $entry_html_examples; ?>
																	</div>

													      </div>
												    	</div>

												  	</div> <!-- .panel-default -->

													</div>

												</div>

											</div>

											<div class="form-group">
												<label class="col-sm-2 control-label" for="aslider[<?php echo $i; ?>][<?php echo $language_id; ?>][<?php echo $m; ?>][style]"><?php echo $entry_style; ?></label>
												<div class="col-sm-10">
													<select name="aslider[<?php echo $i; ?>][<?php echo $language_id; ?>][<?php echo $m; ?>][style]" class="form-control" >
															<?php foreach ($caption_style as $slv => $slc) { ?>
																<?php (isset($aslider[$i][$language_id][$m]['style']) && $slv == $aslider[$i][$language_id][$m]['style']) ? $current = 'selected' : $current = ''; ?>
																<option value="<?php echo $slv; ?>" <?php echo $current; ?> ><?php echo $slc; ?></option>
															<?php } ?>
														</select>
												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-2 control-label" for=""><?php echo $entry_animation; ?></label>
												
												<div class="col-sm-5">
													<span class="help-block">Start:</span>
													<select name="aslider[<?php echo $i; ?>][<?php echo $language_id; ?>][<?php echo $m; ?>][animation_in]" class="form-control">
															<?php foreach ($animation_in as $slv => $slc) { ?>
																<?php (isset($aslider[$i][$language_id][$m]['animation_in']) && $slv == $aslider[$i][$language_id][$m]['animation_in']) ? $current = 'selected' : $current = ''; ?>
																<option value="<?php echo $slv; ?>" <?php echo $current; ?> ><?php echo $slc; ?></option>	
															<?php } ?>
														</select>
												</div>

												<div class="col-sm-5">
													<span class="help-block">End:</span>
													<select name="aslider[<?php echo $i; ?>][<?php echo $language_id; ?>][<?php echo $m; ?>][animation_out]" class="form-control">
															<?php foreach ($animation_out as $slv => $slc) { ?>
																<?php (isset($aslider[$i][$language_id][$m]['animation_out']) && $slv == $aslider[$i][$language_id][$m]['animation_out']) ? $current = 'selected' : $current = ''; ?>
																<option value="<?php echo $slv; ?>" <?php echo $current; ?> ><?php echo $slc; ?></option>	
															<?php } ?>
														</select>
												</div>

											</div>

											<div class="form-group">
												<label class="col-sm-2 control-label" for=""><?php echo $entry_easing; ?></label>
												
												<div class="col-sm-5">
													<span class="help-block">Start:</span>
													<select name="aslider[<?php echo $i; ?>][<?php echo $language_id; ?>][<?php echo $m; ?>][easing]" class="form-control" >
															<?php foreach ($easing as $slv => $slc) { ?>
																<?php (isset($aslider[$i][$language_id][$m]['easing']) && $slv == $aslider[$i][$language_id][$m]['easing']) ? $current = 'selected' : $current = ''; ?>
																<option value="<?php echo $slv; ?>" <?php echo $current; ?> ><?php echo $slc; ?></option>	
															<?php } ?>
														</select>
												</div>

												<div class="col-sm-5">
													<span class="help-block">End:</span>
													<select name="aslider[<?php echo $i; ?>][<?php echo $language_id; ?>][<?php echo $m; ?>][endeasing]" class="form-control" >
															<?php foreach ($easing as $slv => $slc) { ?>
																<?php (isset($aslider[$i][$language_id][$m]['endeasing']) && $slv == $aslider[$i][$language_id][$m]['endeasing']) ? $current = 'selected' : $current = ''; ?>
																<option value="<?php echo $slv; ?>" <?php echo $current; ?> ><?php echo $slc; ?></option>	
															<?php } ?>
														</select>
												</div>

											</div>

											<div class="form-group">
												<label class="col-sm-2 control-label" for="aslider[<?php echo $i; ?>][<?php echo $language_id; ?>][<?php echo $m; ?>][randomrotate]"><?php echo $entry_rotate; ?></label>
												<div class="col-sm-10">
													<div class="btn-group btn-toggle" data-toggle="buttons">
														<?php if(isset($aslider[$i][$language_id][$m]['randomrotate']) && $aslider[$i][$language_id][$m]['randomrotate'] == 1) { ?>
															<label class="btn btn-success btn-sm active">
																<input type="radio" name="aslider[<?php echo $i; ?>][<?php echo $language_id; ?>][<?php echo $m; ?>][randomrotate]" value="1" checked="checked">ON
															</label>
															<label class="btn btn-default btn-sm">
																<input type="radio" name="aslider[<?php echo $i; ?>][<?php echo $language_id; ?>][<?php echo $m; ?>][randomrotate]" value="0">OFF
															</label>
														<?php } else { ?>
															<label class="btn btn-default btn-sm">
																<input type="radio" name="aslider[<?php echo $i; ?>][<?php echo $language_id; ?>][<?php echo $m; ?>][randomrotate]" value="1">ON
															</label>
															<label class="btn btn-success btn-sm active">
																<input type="radio" name="aslider[<?php echo $i; ?>][<?php echo $language_id; ?>][<?php echo $m; ?>][randomrotate]" value="0" checked="checked">OFF
															</label>
														<?php } ?>
													</div>

												</div>
											</div>

											<div class="form-group">
												<div class="col-sm-2"></div>
												<div class="col-sm-10">
													<span class="alert alert-info"><?php echo $entry_video_note; ?></span>
												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-2 control-label" for="aslider[<?php echo $i; ?>][<?php echo $language_id; ?>][<?php echo $m; ?>][speed]"><?php echo $entry_speed; ?></label>
												<div class="col-sm-10">
													<input type="text" name="aslider[<?php echo $i; ?>][<?php echo $language_id; ?>][<?php echo $m; ?>][speed]" value="<?php echo isset($aslider[$i][$language_id][$m]['speed']) ? $aslider[$i][$language_id][$m]['speed'] : '300'; ?>" class="form-control"/>
													<span class="help-block"><?php echo $entry_speed_help; ?> <?php echo $entry_speed_recommended; ?></span>

												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-2 control-label" for="aslider[<?php echo $i; ?>][<?php echo $language_id; ?>][<?php echo $m; ?>][start]"><?php echo $entry_start; ?></label>
												<div class="col-sm-10">
													<input type="text" name="aslider[<?php echo $i; ?>][<?php echo $language_id; ?>][<?php echo $m; ?>][start]" value="<?php echo isset($aslider[$i][$language_id][$m]['start']) ? $aslider[$i][$language_id][$m]['start'] : '300'; ?>" class="form-control"/>
													<span class="help-block"><?php echo $entry_start_help; ?> <?php echo $entry_start_recommended; ?></span>

												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-2 control-label" for=""><?php echo $entry_position; ?></label>
												
												<div class="col-sm-5">
													<span class="help-block">X:</span>
													<input type="text" name="aslider[<?php echo $i; ?>][<?php echo $language_id; ?>][<?php echo $m; ?>][x]" value="<?php echo isset($aslider[$i][$language_id][$m]['x']) ? $aslider[$i][$language_id][$m]['x'] : '100'; ?>" class="form-control" />
													<span class="help-block"><?php echo $entry_position_recommended; ?></span>
												</div>

												<div class="col-sm-5">
													<span class="help-block">Y:</span>
													<input type="text" name="aslider[<?php echo $i; ?>][<?php echo $language_id; ?>][<?php echo $m; ?>][y]" value="<?php echo isset($aslider[$i][$language_id][$m]['y']) ? $aslider[$i][$language_id][$m]['y'] : '100'; ?>" class="form-control" />
												</div>

											</div>
										
										
										</div>


										
										<?php } ?>

									</div>

									<script type="text/javascript"><!--
											$('#tabs_slider_elements_<?php echo $i; ?>_<?php echo $language_id; ?> li:first-child a').tab('show');
									//--></script>
															
								</div>
								
							<?php } ?>

							</div>

							<script type="text/javascript"><!--
									$('#tabs_slider_<?php echo $i; ?>_language li:first-child a').tab('show');
							//--></script>
						
						</div>
						
						<?php } ?>

					</div>

					<script type="text/javascript"><!--
							$('#tab_slides li:first-child a').tab('show');
					//--></script> 

				<!-- End Tabs -->
			
			</form>
		
		</div>
	
	</div>
	

</div>

</div>


<?php echo $footer; ?>

<script type="text/javascript">

	$('.btn-toggle').click(function() {
			$(this).find('.btn').toggleClass('active');  
			
			if ($(this).find('.btn-primary').size()>0) {
				$(this).find('.btn').toggleClass('btn-primary');
			}
			if ($(this).find('.btn-danger').size()>0) {
				$(this).find('.btn').toggleClass('btn-danger');
			}
			if ($(this).find('.btn-success').size()>0) {
				$(this).find('.btn').toggleClass('btn-success');
			}
			if ($(this).find('.btn-info').size()>0) {
				$(this).find('.btn').toggleClass('btn-info');
			}
			
			$(this).find('.btn').toggleClass('btn-default');
				 
	});

</script>
