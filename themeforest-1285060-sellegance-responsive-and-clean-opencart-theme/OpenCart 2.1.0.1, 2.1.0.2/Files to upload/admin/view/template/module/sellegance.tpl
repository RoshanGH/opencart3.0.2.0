<?php echo $header; ?>

<?php /* regular and Google fonts array*/
	
	global $session;

	$fonts = array(
		'Arial'                 => 'Arial',
		'Verdana'               => 'Verdana',
		'Helvetica'             => 'Helvetica',
		'Lucida+Grande'         => 'Lucida Grande',
		'Trebuchet+MS'          => 'Trebuchet MS',
		'Times+New+Roman'       => 'Times New Roman',
		'Tahoma'                => 'Tahoma',
		'Georgia'               => 'Georgia',
		''                      => '-- GOOGLE FONTS --',
		'Abel'                  => 'Abel',
		'Abril+Fatface'         => 'Abril Fatface',
		'Acme'                  => 'Acme',
		'Adamina'               => 'Adamina',
		'Advent+Pro'            => 'Advent Pro',
		'Alfa+Slab+One'         => 'Alfa Slab One',
		'Alice'                 => 'Alice',
		'Allan'                 => 'Allan',
		'Amaranth'              => 'Amaranth',
		'Amatic+SC'             => 'Amatic SC',
		'Andika'                => 'Andika',
		'Anonymous+Pro'         => 'Anonymous Pro',
		'Anton'                 => 'Anton',
		'Arimo'                 => 'Arimo',
		'Bangers'               => 'Bangers',
		'Basic'                 => 'Basic',
		'Baumans'               => 'Baumans',
		'Belgrano'              => 'Belgrano',
		'Berkshire+Swash'       => 'Berkshire Swash',
		'Bitter'                => 'Bitter',
		'Boogaloo'              => 'Boogaloo',
		'Brawler'               => 'Brawler',
		'Bree+Serif'            => 'Bree Serif',
		'Bubblegum+Sans'        => 'Bubblegum Sans',
		'Buda'                  => 'Buda',
		'Cabin+Condensed'       => 'Cabin Condensed',
		'Cabin+Sketch'          => 'Cabin Sketch',
		'Caudex'                => 'Caudex',
		'Cinzel'                => 'Cinzel',
		'Comfortaa'             => 'Comfortaa',
		'Contrail+One'          => 'Contrail One',
		'Courgette'             => 'Courgette',
		'Coustard'              => 'Coustard',
		'Crushed'               => 'Crushed',
		'Cuprum'                => 'Cuprum',
		'Damion'                => 'Damion',
		'Days+One'              => 'Days One',
		'Didact+Gothic'         => 'Didact Gothic',
		'Dorsa'                 => 'Dorsa',
		'Droid+Sans'            => 'Droid Sans',
		'Droid+Serif'           => 'Droid Serif',
		'Duru+Sans'             => 'Duru Sans',
		'Enriqueta'             => 'Enriqueta',
		'Exo'                   => 'Exo',
		'Exo+2'                 => 'Exo 2',
		'Federo'                => 'Federo',
		'Francois+One'          => 'Francois One',
		'Fredericka+the+Great'  => 'Fredericka the Great',
		'Fredoka+One'           => 'Fredoka One',
		'Goudy+Bookletter+1911' => 'Goudy Bookletter 1911',
		'Gruppo'                => 'Gruppo',
		'Homenaje'              => 'Homenaje',
		'Imprima'               => 'Imprima',
		'Inder'                 => 'Inder',
		'Istok+Web'             => 'Istok Web',
		'Jockey+One'            => 'Jockey One',
		'Josefin+Slab'          => 'Josefin Slab',
		'Just+Another+Hand'     => 'Just Another Hand',
		'Kaushan+Script'        => 'Kaushan Script',
		'Kotta+One'             => 'Kotta One',
		'Lato'                  => 'Lato',
		'Lemon'                 => 'Lemon',
		'Lobster+Two'           => 'Lobster Two',
		'Lobster'               => 'Lobster',
		'Maiden+Orange'         => 'Maiden Orange',
		'Marvel'                => 'Marvel',
		'Merienda+One'          => 'Merienda One',
		'Molengo'               => 'Molengo',
		'Montserrat'            => 'Montserrat',
		'News+Cycle'            => 'News Cycle',
		'Niconne'               => 'Niconne',
		'Nixie+One'             => 'Nixie One',
		'Nobile'                => 'Nobile',
		'Oleo+Script'           => 'Oleo Script',
		'Open+Sans'             => 'Open Sans',
		'Overlock'              => 'Overlock',
		'Ovo'                   => 'Ovo',
		'PT+Sans'               => 'PT Sans',
		'Passion+One'           => 'Passion One',
		'Philosopher'           => 'Philosopher',
		'Playball'              => 'Playball',
		'Poiret+One'            => 'Poiret One',
		'Quando'                => 'Quando',
		'Quattrocento+Sans'     => 'Quattrocento Sans',
		'Quicksand'             => 'Quicksand',
		'Raleway'               => 'Raleway',
		'Righteous'             => 'Righteous',
		'Roboto'                => 'Roboto',
		'Roboto+Slab'           => 'Roboto Slab',
		'Rokkitt'               => 'Rokkitt',
		'Ropa+Sans'             => 'Ropa Sans',
		'Sansita+One'           => 'Sansita One',
		'Sofia'                 => 'Sofia',
		'Source+Sans+Pro'       => 'Source Sans Pro',
		'Stoke'                 => 'Stoke',
		'Ubuntu'                => 'Ubuntu',
		'Wire+One'              => 'Wire One',
		'Yanone+Kaffeesatz'     => 'Yanone Kaffeesatz',
		'Yellowtail'            => 'Yellowtail'
		); 
	
	$skins = array(
		''  => 'Default',
		'dark'   => 'Dark'
	);

	$product_details = array(
		'tabs'      => 'Tabs',
		'accordion' => 'Accordion'
	);

	$title_position = array(
		'title_top'      => 'Top',
		'title_right' => 'Right'
	);

	$layouts = array(
		'boxed' => 'Boxed',
		'fullwidth'  => 'Full Width',
		'framed'  => 'Framed'
	);
	$visibility = array(
		'all'     => 'All',
		'desktop' => 'Desktop',
		'mobile'  => 'Mobiles'
	);
	$responsive = array(
		'large'  => 'Responsive large (>1200px)',
		'normal' => 'Responsive regular (960px)'
	);
	$zoom = array(
		'right'  => 'Right',
		'inside' => 'Inside'
	);
	$category_style = array(
		'grid' => 'Grid',
		'list' => 'List'
	);
	$logo_position = array(
		'center'  => 'Center',
		'left' => 'Left'
	);
	$homepage_link = array(
		'icon'  => 'Icon',
		'text' => 'Text',
		'hidden' => 'Don\'t show'
	);
	$menu_category_style = array(
		'inline'  => 'Inline',
		'vertical' => 'Vertical',
		'table' => 'Dropdown Table',
		'hidden' => 'Don\'t show'
	);
	$menu_infopages_style = array(
		'inline'  => 'Inline',
		'vertical' => 'Vertical',
		'hidden' => 'Don\'t show'
	);
	$menu_brands_style = array(
		'logo' => 'Logo',
		'name' => 'Name',
		'logoname' => 'Logo & Name',
		'hidden' => 'Don\'t show'
	);
	$menu_target = array(
		'_self' => 'Same tab/window',
		'_blank' => 'New tab/window'
	);
	$menu_style = array(
		'light'  => 'Light',
		'dark' => 'Dark',
		'transparent' => 'Transparent'
	);
	$social_media = array(
		'facebook'    => 'Facebook',
		'twitter'     => 'Twitter',
		'google-plus' => 'Google+',
		'rss'         => 'RSS',
		'pinterest'   => 'Pinterest',
		'instagram'   => 'Instagram',
		'linkedin'    => 'Linkedin',
		'vimeo'       => 'Vimeo',
		'youtube'     => 'YouTube',
		'flickr'      => 'Flickr',
		'vk'          => 'VK',
		'dribbble'    => 'Dribbble',
		'spotify'     => 'Spotify',
		'tumblr'      => 'Tumblr',
		'xing'        => 'Xing',
		'wordpress'   => 'WordPress',
	);

// Default values

if(empty($sellegance_title_font)) $sellegance_title_font                           = "Lato";
if(empty($sellegance_body_font)) $sellegance_body_font                             = "Lato";
if(empty($sellegance_small_font)) $sellegance_small_font                           = "Lato";

if(empty($sellegance_title_font_size)) $sellegance_title_font_size                 = "35";
if(empty($sellegance_body_font_size)) $sellegance_body_font_size                   = "13";
if(empty($sellegance_small_font_size)) $sellegance_small_font_size                 = "11";

if(empty($sellegance_pattern_overlay)) $sellegance_pattern_overlay                 = "5";

if(empty($sellegance_zoom_width)) $sellegance_zoom_width                           = "360";
if(empty($sellegance_zoom_height)) $sellegance_zoom_height                         = "360";

if(empty($sellegance_subcat_thumb_width)) $sellegance_subcat_thumb_width           = "90";
if(empty($sellegance_subcat_thumb_height)) $sellegance_subcat_thumb_height         = "90";

(!isset($sellegance_footer_modules)) ? $sellegance_footer_modules               = 3 : '';

if(empty($sellegance_menu_style)) $sellegance_menu_style         = "light";

// Switches

(!isset($sellegance_subcat_status)) ? $sellegance_subcat_status               = 1 : '';
(!isset($sellegance_subcat_thumbnails_status)) ? $sellegance_subcat_thumbnails_status = 1 : '';
(!isset($sellegance_rollover_images)) ? $sellegance_rollover_images           = 1 : '';
(!isset($sellegance_zoom_autosize)) ? $sellegance_zoom_autosize               = 1 : '';
(!isset($sellegance_toggle_sidebar)) ? $sellegance_toggle_sidebar             = 1 : '';
(!isset($sellegance_show_wishlist)) ? $sellegance_show_wishlist               = 1 : '';
(!isset($sellegance_show_compare)) ? $sellegance_show_compare                 = 1 : '';
(!isset($sellegance_show_sale_bubble)) ? $sellegance_show_sale_bubble         = 1 : '';
(!isset($sellegance_quickview_categories)) ? $sellegance_quickview_categories = 1 : '';
(!isset($sellegance_quickview_modules)) ? $sellegance_quickview_modules       = 1 : '';
(!isset($sellegance_quickview_zoom)) ? $sellegance_quickview_zoom             = 0 : '';
(!isset($sellegance_quickview_mobile)) ? $sellegance_quickview_mobile         = 0 : '';
(!isset($sellegance_searchbox_regular)) ? $sellegance_searchbox_regular       = 0 : '';
(!isset($sellegance_sticky_menu)) ? $sellegance_sticky_menu                   = 1 : '';

?>

<style type="text/css">
	.nav-pills {margin-bottom: 25px;}
	.input-group + .input-group { margin-top: 5px; }

	.box>.content h2 { border-bottom: 0; }
	.customhelp { color: #666; }
	.hey {color: #ff0000;}

	.pttrn {
		width:32px; 
		display: inline-block;
		text-align: center;
	}
	.small_field { width: 40px; }
	.large_field { width: 330px; }
	.slideitem { padding: 10px 25px; }
	.status-on { width:56px;height:24px;background:url(view/image/on.png) top left no-repeat;cursor:pointer;margin-top:5px; }
	.status-off { width:56px;height:24px;background:url(view/image/off.png) top left no-repeat;cursor:pointer;margin-top:5px; }
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

	#title_font_preview {
		font-size: <?php echo $sellegance_title_font_size; ?>px; 
		font-family: "<?php echo str_replace("+", " ", $sellegance_title_font); ?>";
	}
	#body_font_preview {
		font-size: <?php echo $sellegance_body_font_size; ?>px; 
		font-family: "<?php echo str_replace("+", " ", $sellegance_body_font); ?>";
	}
	#small_font_preview {
		font-size: <?php echo $sellegance_small_font_size; ?>px; 
		font-family: "<?php echo str_replace("+", " ", $sellegance_small_font); ?>";
	}
	input.color {
		height: 35px;
		padding: 8px 13px;
		display: inline-block;
		width: 78px;
		margin-right: 12px;
		font-size: 12px;
		line-height: 1.42857143;
		border: 1px solid #cccccc;
		border-radius: 3px;
		-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
		box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
		-webkit-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
		-o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
		transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
	}
	.list {border:0;}
	.list td {border-right: 0;}
	.list th {font-weight: normal; color: #777; text-transform: uppercase; border-bottom: 2px solid #ccc;}

	.menu-style label.btn {
		margin-right: 3px;
		font-weight: bold;
		padding: 16px 8px;
		background: #e6e6e6;
		border-radius: 0;
		border-color: transparent;
	}
	.menu-style label.btn.active {
		border: 4px solid #1e91cf;
		margin-top: -3px;
	}
	label.btn span {
		padding: 6px 13px;
		border: 1px solid #ccc;
	}
	label.btn.light span {
		background-color: #fff;
		color: #555;
		border-top: 4px solid #333;
	}
	label.btn.dark span {
		background-color: #333;
		border-color: #333;
		color: #fff;
	}
	label.btn.transparent span {
		border: 0;
		border-bottom: 4px solid #333;
	}

	span.badge:after { display: none; }

</style>

<?php echo $column_left; ?>

<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<button type="submit" form="form-sellegance" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
				<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $heading_title; ?> <span class="label label-default"><?php echo $theme_version; ?></span></h3>
			</div>
			<div class="panel-body">

				<div class="row form-horizontal">
					<div class="col-sm-6 col-md-5 col-lg-4">

						<?php $strqty=count($stores); if ($strqty>1) { ?>

							<div class="form-group">
								<label class="col-sm-2 control-label" for="sellegance_store_id"><?php echo $entry_store; ?></label>
								<div class="col-sm-10 ">
									<select name="sellegance_store_id" id="sellegance_store_id" class="form-control input">
										<?php foreach ($stores as $store): ?>
										<option value="<?php echo HTTPS_SERVER . 'index.php?route=module/sellegance&store_id=' . $store['store_id'] . '&token=' . $session->data['token']; ?>"<?php if($store_id == $store['store_id']) echo ' selected="selected"'; ?>><?php echo $store['name']; ?></option>
										<?php endforeach; ?>
									</select>
								</div>
							</div>					

							<script type="text/javascript">
								$(document).ready(function (){
									$("#sellegance_store_id").bind("change", function() {
										window.location = $(this).val();
									});
								});
							</script>

						<?php } ?>

					</div>
				</div>

				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-sellegance" class="form-horizontal">

					<input type="hidden" name="store_id" value="<?php echo $store_id; ?>" />

					<ul class="nav nav-tabs">
						<li class="active"><a href="#layout_settings" data-toggle="tab"><i class="fa fa-cog"></i> <?php echo $entry_tab_layout; ?></a></li>
						<li><a href="#design_settings" data-toggle="tab"><i class="fa fa-pencil"></i> <?php echo $entry_tab_design; ?></a></li>
						<li><a href="#menu_settings" data-toggle="tab"><i class="fa fa-bars"></i> <?php echo $entry_tab_menu; ?></a></li>
						<li><a href="#header_settings" data-toggle="tab"><i class="fa fa-level-up"></i> <?php echo $entry_tab_header; ?></a></li>
						<li><a href="#footer_settings" data-toggle="tab"><i class="fa fa-level-down"></i> <?php echo $entry_tab_footer; ?></a></li>
						<li><a href="#social_settings" data-toggle="tab"><i class="fa fa-share-alt"></i> <?php echo $entry_social_sub; ?></a></li>
						<li><a href="#custom_code_settings" data-toggle="tab"><i class="fa fa-code"></i> <?php echo $entry_tab_custom_code; ?></a></li>
					</ul>
					<div class="tab-content">

						<div class="tab-pane fade in active" id="layout_settings">

							<ul class="nav nav-pills">
								<li class="active"><a href="#general-layout" data-toggle="tab"><?php echo $entry_layout_sub; ?></a></li>
								<li><a href="#category-layout" data-toggle="tab"><?php echo $entry_category_layout_sub; ?></a></li>
								<li><a href="#product-layout" data-toggle="tab"><?php echo $entry_product_layout_sub; ?></a></li>
								<li><a href="#quickview-layout" data-toggle="tab"><?php echo $entry_quickview_layout_sub; ?></a></li>
								<li><a href="#extras-layout" data-toggle="tab"><?php echo $entry_extras_sub; ?></a></li>
								<li><a href="#effects-carousel" data-toggle="tab"><?php echo $entry_carousel_sub; ?></a></li>
							</ul>

							<div class="tab-content">
								<div class="tab-pane fade in active" id="general-layout">

									<fieldset>
											
										<legend><?php echo $entry_layout_sub; ?></legend>

										<div class="form-group">
											<label class="col-sm-2 control-label" for="sellegance_main_layout"><?php echo $entry_main_layout; ?></label>
											<div class="col-sm-10">
												<select name="sellegance_main_layout" id="sellegance_main_layout" class="form-control">
													<?php foreach ($layouts as $fv => $fc) { ?>
														<?php ($fv ==  $sellegance_main_layout) ? $current = 'selected' : $current=''; ?>
														<option value="<?php echo $fv; ?>" <?php echo $current; ?> ><?php echo $fc; ?></option>	
													<?php } ?>
												</select>
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label" for="sellegance_responsiv_layout"><?php echo $entry_responsive_layout; ?></label>
											<div class="col-sm-10">
												<select name="sellegance_responsive_layout" id="sellegance_responsive_layout" class="form-control">
													<?php foreach ($responsive as $fv => $fc) { ?>
														<?php ($fv ==  $sellegance_responsive_layout) ? $current = 'selected' : $current=''; ?>
														<option value="<?php echo $fv; ?>" <?php echo $current; ?> ><?php echo $fc; ?></option>	
													<?php } ?>
												</select><br />
												<span class="help-block"><?php echo $entry_responsive_layout_help; ?></span>
											</div>
										</div>

									</fieldset>

								</div>

								<div class="tab-pane fade" id="category-layout">
									
									<fieldset>

										<legend><?php echo $entry_category_layout_sub; ?></legend>

										
										<div class="form-group">
											<label class="col-sm-2 control-label" for="sellegance_rollover_images"><?php echo $entry_rollover_images; ?> <span title="<?php echo $entry_rollover_images_help; ?>" data-toggle="tooltip"></span></label>
											<div class="col-sm-10">
												<div class="btn-group btn-toggle" data-toggle="buttons">
													<?php if($sellegance_rollover_images == 1) { ?>
														<label class="btn btn-success btn-sm active">
															<input type="radio" name="sellegance_rollover_images" value="1" checked="checked">ON
														</label>
														<label class="btn btn-default btn-sm">
															<input type="radio" name="sellegance_rollover_images" value="0">OFF
														</label>
													<?php } else { ?>
														<label class="btn btn-default btn-sm">
															<input type="radio" name="sellegance_rollover_images" value="1">ON
														</label>
														<label class="btn btn-success btn-sm active">
															<input type="radio" name="sellegance_rollover_images" value="0" checked="checked">OFF
														</label>
													<?php } ?>
												</div>
												<span class="help-block"><?php echo $entry_rollover_images_help; ?></span>

											</div>
										</div>
										
										<?php 
											$subcat_thumb = 1;
											if ($subcat_thumb == 1) { 
										?>

											<legend><?php echo $entry_subcategory; ?></legend>

						
											<div class="form-group">
												<label for="sellegance_subcat_status" class="col-sm-2 control-label"><?php echo $entry_subcategory_show; ?></label>
												<div class="col-sm-10">

													<div class="btn-group btn-toggle" data-toggle="buttons">
														<?php if($sellegance_subcat_status == 1) { ?>
															<label class="btn btn-success btn-sm active">
																<input type="radio" name="sellegance_subcat_status" value="1" checked="checked">ON
															</label>
															<label class="btn btn-default btn-sm">
																<input type="radio" name="sellegance_subcat_status" value="0">OFF
															</label>
														<?php } else { ?>
															<label class="btn btn-default btn-sm">
																<input type="radio" name="sellegance_subcat_status" value="1">ON
															</label>
															<label class="btn btn-success btn-sm active">
																<input type="radio" name="sellegance_subcat_status" value="0" checked="checked">OFF
															</label>
														<?php } ?>
													</div>

												</div>
											</div>

											<div class="form-group">
												<label for="sellegance_subcat_thumbnails_status" class="col-sm-2 control-label"><?php echo $entry_subcategory_thumb_show; ?></label>
												<div class="col-sm-10">

													<div class="btn-group btn-toggle" data-toggle="buttons">
														<?php if($sellegance_subcat_thumbnails_status == 1) { ?>
															<label class="btn btn-success btn-sm active">
																<input type="radio" name="sellegance_subcat_thumbnails_status" value="1" checked="checked">ON
															</label>
															<label class="btn btn-default btn-sm">
																<input type="radio" name="sellegance_subcat_thumbnails_status" value="0">OFF
															</label>
														<?php } else { ?>
															<label class="btn btn-default btn-sm">
																<input type="radio" name="sellegance_subcat_thumbnails_status" value="1">ON
															</label>
															<label class="btn btn-success btn-sm active">
																<input type="radio" name="sellegance_subcat_thumbnails_status" value="0" checked="checked">OFF
															</label>
														<?php } ?>
													</div>

												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-2 control-label"><?php echo $entry_subcategory_thumb_size; ?></label>
												<div class="col-sm-10">

													<div class="row">
														<div class="col-sm-3">
															<span class="help-block"><?php echo $entry_width_caption; ?></span>
															<div class="input-group">
																<input type="text" class="form-control" name="sellegance_subcat_thumb_width" value="<?php echo $sellegance_subcat_thumb_width; ?>" class="small_field" />
																<span class="input-group-addon">px</span>
															</div>
														</div>
														<div class="col-sm-3">
															<span class="help-block"><?php echo $entry_height_caption; ?></span>
															<div class="input-group">
																<input type="text" class="form-control" name="sellegance_subcat_thumb_height" value="<?php echo $sellegance_subcat_thumb_height; ?>" class="small_field" />
																<span class="input-group-addon">px</span>
															</div>
														</div>
													</div>
													
												</div>
											</div>

										<?php } ?>

									</fieldset>
								</div>

								<div class="tab-pane fade" id="product-layout">

									<fieldset>

										<legend><?php echo $entry_product_layout_sub; ?></legend>

										<div class="form-group">
											<label class="col-sm-2 control-label" for="sellegance_product_details_layout"><?php echo $entry_product_layout; ?></label>
											<div class="col-sm-10">
												<select name="sellegance_product_details_layout" id="sellegance_product_details_layout" class="form-control">
													<?php foreach ($product_details as $fv => $fc) { ?>
														<?php ($fv == $sellegance_product_details_layout) ? $current = 'selected' : $current=''; ?>
														<option value="<?php echo $fv; ?>" <?php echo $current; ?> ><?php echo $fc; ?></option>	
													<?php } ?>
												</select>
												<span class="help-block"><?php echo $entry_product_layout_help; ?></span>
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label" for="sellegance_product_title_position"><?php echo $entry_product_layout; ?></label>
											<div class="col-sm-10">
												<select name="sellegance_product_title_position" id="sellegance_product_title_position" class="form-control">
													<?php foreach ($title_position as $fv => $fc) { ?>
														<?php ($fv == $sellegance_product_title_position) ? $current = 'selected' : $current=''; ?>
														<option value="<?php echo $fv; ?>" <?php echo $current; ?> ><?php echo $fc; ?></option>	
													<?php } ?>
												</select>
												<span class="help-block"><?php echo $entry_product_layout_help; ?></span>
											</div>
										</div>

									</fieldset>

									<fieldset>

										<legend><?php echo $entry_zoom_sub; ?></legend>

										<div class="form-group">
											<label for="sellegance_cloud_zoom" class="col-sm-2 control-label"><?php echo $entry_cloud_zoom; ?></label>
											<div class="col-sm-10">
												<div class="btn-group btn-toggle" data-toggle="buttons">
													<?php if($sellegance_cloud_zoom == 1) { ?>
														<label class="btn btn-success btn-sm active">
															<input type="radio" name="sellegance_cloud_zoom" value="1" checked="checked">ON
														</label>
														<label class="btn btn-default btn-sm">
															<input type="radio" name="sellegance_cloud_zoom" value="0">OFF
														</label>
													<?php } else { ?>
														<label class="btn btn-default btn-sm">
															<input type="radio" name="sellegance_cloud_zoom" value="1">ON
														</label>
														<label class="btn btn-success btn-sm active">
															<input type="radio" name="sellegance_cloud_zoom" value="0" checked="checked">OFF
														</label>
													<?php } ?>
												</div>
												<span class="help-block"><?php echo $entry_cloud_zoom_help; ?></span>
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label" for="sellegance_zoom_position"><?php echo $entry_zoom_position; ?></label>
											<div class="col-sm-10">
												<select name="sellegance_zoom_position" id="sellegance_zoom_position" class="form-control">
													<?php foreach ($zoom as $fv => $fc) { ?>
														<?php ($fv == $sellegance_zoom_position) ? $current = 'selected' : $current=''; ?>
														<option value="<?php echo $fv; ?>" <?php echo $current; ?> ><?php echo $fc; ?></option>	
													<?php } ?>
												</select>
												<span class="help-block"><?php echo $entry_zoom_position_help; ?></span>
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label"><?php echo $entry_zoom_size; ?></label>
											<div class="col-sm-10">

												<div class="row">
													<div class="col-sm-3">
														<span class="help-block"><?php echo $entry_width_caption; ?></span>
														<div class="input-group">
															<input type="text" class="form-control" name="sellegance_zoom_width" value="<?php echo $sellegance_zoom_width; ?>" class="small_field" />
															<span class="input-group-addon">px</span>
														</div>
													</div>
													<div class="col-sm-3">
														<span class="help-block"><?php echo $entry_height_caption; ?></span>
														<div class="input-group">
															<input type="text" class="form-control" name="sellegance_zoom_height" value="<?php echo $sellegance_zoom_height; ?>" class="small_field" />
															<span class="input-group-addon">px</span>
														</div>
													</div>
												</div><br />

												<div class="well">

													<div class="btn-group btn-toggle" data-toggle="buttons">
														<?php if($sellegance_zoom_autosize == 1) { ?>
															<label class="btn btn-success btn-sm active">
																<input type="radio" name="sellegance_zoom_autosize" value="1" checked="checked">ON
															</label>
															<label class="btn btn-default btn-sm">
																<input type="radio" name="sellegance_zoom_autosize" value="0">OFF
															</label>
														<?php } else { ?>
															<label class="btn btn-default btn-sm">
																<input type="radio" name="sellegance_zoom_autosize" value="1">ON
															</label>
															<label class="btn btn-success btn-sm active">
																<input type="radio" name="sellegance_zoom_autosize" value="0" checked="checked">OFF
															</label>
														<?php } ?>
													</div>

													<span><?php echo $entry_zoom_auto; ?></span>
												</div>

											</div>
										</div>

									</fieldset>

								</div>

								<div class="tab-pane fade" id="quickview-layout">

									<fieldset>
											
										<legend><?php echo $entry_quickview_layout_sub; ?></legend>

										<div class="form-group">
											<label class="col-sm-2 control-label" for="sellegance_quickview_categories"><?php echo $entry_quickview_categories; ?></label>
											<div class="col-sm-10">

												<div class="btn-group btn-toggle" data-toggle="buttons">
													<?php if($sellegance_quickview_categories == 1) { ?>
														<label class="btn btn-success btn-sm active">
															<input type="radio" name="sellegance_quickview_categories" value="1" checked="checked">ON
														</label>
														<label class="btn btn-default btn-sm">
															<input type="radio" name="sellegance_quickview_categories" value="0">OFF
														</label>
													<?php } else { ?>
														<label class="btn btn-default btn-sm">
															<input type="radio" name="sellegance_quickview_categories" value="1">ON
														</label>
														<label class="btn btn-success btn-sm active">
															<input type="radio" name="sellegance_quickview_categories" value="0" checked="checked">OFF
														</label>
													<?php } ?>
												</div>

											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label" for="sellegance_quickview_modules"><?php echo $entry_quickview_modules; ?></label>
											<div class="col-sm-10">

												<div class="btn-group btn-toggle" data-toggle="buttons">
													<?php if($sellegance_quickview_modules == 1) { ?>
														<label class="btn btn-success btn-sm active">
															<input type="radio" name="sellegance_quickview_modules" value="1" checked="checked">ON
														</label>
														<label class="btn btn-default btn-sm">
															<input type="radio" name="sellegance_quickview_modules" value="0">OFF
														</label>
													<?php } else { ?>
														<label class="btn btn-default btn-sm">
															<input type="radio" name="sellegance_quickview_modules" value="1">ON
														</label>
														<label class="btn btn-success btn-sm active">
															<input type="radio" name="sellegance_quickview_modules" value="0" checked="checked">OFF
														</label>
													<?php } ?>
												</div>
												<span class="help-block"><?php echo $entry_quickview_help; ?></span>

											</div>
										</div>

										<!-- <div class="form-group">
											<label class="col-sm-2 control-label" for="sellegance_quickview_zoom"><?php echo $entry_quickview_zoom; ?></label>
											<div class="col-sm-10">

												<div class="btn-group btn-toggle" data-toggle="buttons">
													<?php if($sellegance_quickview_zoom == 1) { ?>
														<label class="btn btn-success btn-sm active">
															<input type="radio" name="sellegance_quickview_zoom" value="1" checked="checked">ON
														</label>
														<label class="btn btn-default btn-sm">
															<input type="radio" name="sellegance_quickview_zoom" value="0">OFF
														</label>
													<?php } else { ?>
														<label class="btn btn-default btn-sm">
															<input type="radio" name="sellegance_quickview_zoom" value="1">ON
														</label>
														<label class="btn btn-success btn-sm active">
															<input type="radio" name="sellegance_quickview_zoom" value="0" checked="checked">OFF
														</label>
													<?php } ?>
												</div>

											</div>
										</div> -->

										<div class="form-group">
											<label class="col-sm-2 control-label" for="sellegance_quickview_mobile"><?php echo $entry_quickview_mobile; ?></label>
											<div class="col-sm-10">
												<div class="btn-group btn-toggle" data-toggle="buttons">
													<?php if($sellegance_quickview_mobile == 1) { ?>
														<label class="btn btn-success btn-sm active">
															<input type="radio" name="sellegance_quickview_mobile" value="1" checked="checked">ON
														</label>
														<label class="btn btn-default btn-sm">
															<input type="radio" name="sellegance_quickview_mobile" value="0">OFF
														</label>
													<?php } else { ?>
														<label class="btn btn-default btn-sm">
															<input type="radio" name="sellegance_quickview_mobile" value="1">ON
														</label>
														<label class="btn btn-success btn-sm active">
															<input type="radio" name="sellegance_quickview_mobile" value="0" checked="checked">OFF
														</label>
													<?php } ?>
												</div>
											</div>
										</div>

									</fieldset>

								</div>

								<div class="tab-pane fade" id="extras-layout">

									<fieldset>
											
										<legend><?php echo $entry_extras_sub; ?></legend>
										
										<div class="form-group">
											<label class="col-sm-2 control-label" for="sellegance_show_wishlist"><?php echo $entry_wishlist; ?></label>
											<div class="col-sm-10">

												<div class="btn-group btn-toggle" data-toggle="buttons">
													<?php if($sellegance_show_wishlist == 1) { ?>
														<label class="btn btn-success btn-sm active">
															<input type="radio" name="sellegance_show_wishlist" value="1" checked="checked">ON
														</label>
														<label class="btn btn-default btn-sm">
															<input type="radio" name="sellegance_show_wishlist" value="0">OFF
														</label>
													<?php } else { ?>
														<label class="btn btn-default btn-sm">
															<input type="radio" name="sellegance_show_wishlist" value="1">ON
														</label>
														<label class="btn btn-success btn-sm active">
															<input type="radio" name="sellegance_show_wishlist" value="0" checked="checked">OFF
														</label>
													<?php } ?>
												</div>

											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label" for="sellegance_show_compare"><?php echo $entry_compare; ?></label>
											<div class="col-sm-10">

												<div class="btn-group btn-toggle" data-toggle="buttons">
													<?php if($sellegance_show_compare == 1) { ?>
														<label class="btn btn-success btn-sm active">
															<input type="radio" name="sellegance_show_compare" value="1" checked="checked">ON
														</label>
														<label class="btn btn-default btn-sm">
															<input type="radio" name="sellegance_show_compare" value="0">OFF
														</label>
													<?php } else { ?>
														<label class="btn btn-default btn-sm">
															<input type="radio" name="sellegance_show_compare" value="1">ON
														</label>
														<label class="btn btn-success btn-sm active">
															<input type="radio" name="sellegance_show_compare" value="0" checked="checked">OFF
														</label>
													<?php } ?>
												</div>

											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label" for="sellegance_show_sale_bubble"><?php echo $entry_sale_bubble; ?></label>
											<div class="col-sm-10">

												<div class="btn-group btn-toggle" data-toggle="buttons">
													<?php if($sellegance_show_sale_bubble == 1) { ?>
														<label class="btn btn-success btn-sm active">
															<input type="radio" name="sellegance_show_sale_bubble" value="1" checked="checked">ON
														</label>
														<label class="btn btn-default btn-sm">
															<input type="radio" name="sellegance_show_sale_bubble" value="0">OFF
														</label>
													<?php } else { ?>
														<label class="btn btn-default btn-sm">
															<input type="radio" name="sellegance_show_sale_bubble" value="1">ON
														</label>
														<label class="btn btn-success btn-sm active">
															<input type="radio" name="sellegance_show_sale_bubble" value="0" checked="checked">OFF
														</label>
													<?php } ?>
												</div>

											</div>
										</div>

									</fieldset>

								</div>

								<div class="tab-pane fade" id="effects-carousel">

									<fieldset>
										
										<legend><?php echo $entry_slider_sub; ?></legend>
										<p class="help-block"><?php echo $entry_carousel_sub_help; ?></p>

										<div class="form-group">
											<label class="col-sm-2 control-label" for="sellegance_featured_carousel" class="form-control"><?php echo $entry_featured; ?></label>
											<div class="col-sm-10">
												<input type="checkbox" name="sellegance_featured_carousel"<?php if ($sellegance_featured_carousel) echo 'checked="checked"';?> class="form-control">
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label" for="sellegance_bestseller_carousel" class="form-control"><?php echo $entry_bestseller; ?></label>
											<div class="col-sm-10">
												<input type="checkbox" name="sellegance_bestseller_carousel"<?php if ($sellegance_bestseller_carousel) echo 'checked="checked"';?> class="form-control">
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label" for="sellegance_latest_carousel" class="form-control"><?php echo $entry_latest; ?></label>
											<div class="col-sm-10">
												<input type="checkbox" name="sellegance_latest_carousel"<?php if ($sellegance_latest_carousel) echo 'checked="checked"';?> class="form-control">
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label" for="sellegance_special_carousel" class="form-control"><?php echo $entry_special; ?></label>
											<div class="col-sm-10">
												<input type="checkbox" name="sellegance_special_carousel"<?php if ($sellegance_special_carousel) echo 'checked="checked"';?> class="form-control">
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label" for="sellegance_related_carousel" class="form-control"><?php echo $entry_related; ?></label>
											<div class="col-sm-10">
												<input type="checkbox" name="sellegance_related_carousel"<?php if ($sellegance_related_carousel) echo 'checked="checked"';?> class="form-control">
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label" for="sellegance_ebay_carousel" class="form-control"><?php echo $entry_ebay; ?></label>
											<div class="col-sm-10">
												<input type="checkbox" name="sellegance_ebay_carousel"<?php if ($sellegance_ebay_carousel) echo 'checked="checked"';?> class="form-control">
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label" for="sellegance_carousel_autoplay"><?php echo $entry_carousel_autoplay; ?></label>
											<div class="col-sm-10">

												<div class="btn-group btn-toggle" data-toggle="buttons">
													<?php if($sellegance_carousel_autoplay == 1) { ?>
														<label class="btn btn-success btn-sm active">
															<input type="radio" name="sellegance_carousel_autoplay" value="1" checked="checked">ON
														</label>
														<label class="btn btn-default btn-sm">
															<input type="radio" name="sellegance_carousel_autoplay" value="0">OFF
														</label>
													<?php } else { ?>
														<label class="btn btn-default btn-sm">
															<input type="radio" name="sellegance_carousel_autoplay" value="1">ON
														</label>
														<label class="btn btn-success btn-sm active">
															<input type="radio" name="sellegance_carousel_autoplay" value="0" checked="checked">OFF
														</label>
													<?php } ?>
												</div>

											</div>
										</div>

									</fieldset>

								</div>

							</div>

						</div>

						<div class="tab-pane fade" id="design_settings">

							<ul class="nav nav-pills">
								<li class="active"><a href="#design-colors" data-toggle="tab"><?php echo $entry_design_colors; ?></a></li>
								<li><a href="#design-background" data-toggle="tab"><?php echo $entry_pattern_sub; ?></a></li>
								<li><a href="#design-fonts" data-toggle="tab"><?php echo $entry_fonts_sub; ?></a></li>
							</ul>
							<div class="tab-content">

								<div class="tab-pane fade in active" id="design-colors">

									<fieldset>
										<legend><?php echo $entry_skins_sub; ?></legend>
										<p class="help-block"><?php echo $entry_skins_sub_help; ?></p>

										<div class="form-group">
											<label class="col-sm-2 control-label" for="sellegance_skins"><?php echo $entry_skin; ?></label>
											<div class="col-sm-10">
												<select name="sellegance_skins" class="form-control">
													<?php foreach ($skins as $sv => $sc) { ?>
														<?php ($sv ==  $sellegance_skins) ? $currentskin = 'selected' : $currentskin=''; ?>
														<option value="<?php echo $sv; ?>" <?php echo $currentskin; ?> ><?php echo $sc; ?></option>	
													<?php } ?>
												</select>
											</div>
										</div>
									</fieldset>

										<div class="well">

										<div class="form-group">
											<label class="col-sm-2 control-label" for="sellegance_main_layout">Main menu style</label>
											<div class="col-sm-10">

												<div class="btn-group menu-style" data-toggle="buttons">

													<?php foreach ($menu_style as $fv => $fc) { ?>
														<label class="btn btn-default <?php echo $fv; ?> <?php if($fv==$sellegance_menu_style) echo 'active'; ?>">
															<span>
														  <input type="radio" name="sellegance_menu_style" value="<?php echo $fv; ?>" autocomplete="off" <?php if($fv==$sellegance_menu_style) echo 'checked="checked"'; ?>> <?php echo $fc; ?>
														  </span>
														</label>
													<?php } ?>
												  
												</div>

											</div>
										</div>

										</div>

										<div class="form-group">
			                <label class="col-sm-2 control-label"><?php echo $entry_custom_colors_help; ?></label>
			                <div class="col-sm-10">
			                	<div class="btn-group btn-toggle" data-toggle="buttons">
													<?php if($sellegance_custom_colors == 1) { ?>
														<label class="btn btn-success btn-sm active">
															<input type="radio" name="sellegance_custom_colors" value="1" checked="checked">ON
														</label>
														<label class="btn btn-default btn-sm">
															<input type="radio" name="sellegance_custom_colors" value="0">OFF
														</label>
													<?php } else { ?>
														<label class="btn btn-default btn-sm">
															<input type="radio" name="sellegance_custom_colors" value="1">ON
														</label>
														<label class="btn btn-success btn-sm active">
															<input type="radio" name="sellegance_custom_colors" value="0" checked="checked">OFF
														</label>
													<?php } ?>
												</div>
												<span class="alert alert-warning"><i class="fa fa-info-circle"></i> <?php echo $entry_colors_sub_help; ?></span>
			                </div>
			            	</div>

			            	
											
										<fieldset id="colors-header">

											<legend><?php echo $entry_header_bold; ?></legend>

											<div class="form-group">
												<label class="col-sm-2 control-label"><?php echo $entry_menu_accent; ?></label>
			                	<div class="col-sm-10">
			                		<input type="text" name="sellegance_menu_accent" value="<?php echo $sellegance_menu_accent; ?>" size="6" class="color {required:false,hash:true}"  />
													<span class="help-block"><?php echo $entry_menu_accent_help; ?></span>
							          </div>
											</div>

											<div class="form-group">
												<label class="col-sm-2 control-label"><?php echo $entry_menu_color; ?></label>
				                	<div class="col-sm-10">
				                		<span>Normal:</span>
				                		<input type="text" name="sellegance_menu_color" value="<?php echo $sellegance_menu_color; ?>" size="6" class="color {required:false,hash:true}"  />
				                		<span>Hover:</span> <input type="text" name="sellegance_menu_hover" value="<?php echo $sellegance_menu_hover; ?>" size="6" class="color {required:false,hash:true}" />
				                		<span class="help-block"><b>Default</b> Normal:<code>#000000</code>, Hover:<code>#000000</code></span>
				                	</div>
											</div>

											<div class="form-group">
												<label class="col-sm-2 control-label"><?php echo $entry_dropdown_color; ?></label>
			                	<div class="col-sm-10">
			                		<span class="customhelp">Normal</span>
			                		<input type="text" name="sellegance_dropdown_color" value="<?php echo $sellegance_dropdown_color; ?>" size="6" class="color {required:false,hash:true}"  />
			                		<span class="customhelp">Hover:</span> <input type="text" name="sellegance_dropdown_hover" value="<?php echo $sellegance_dropdown_hover; ?>" size="6" class="color {required:false,hash:true}" />
			                		<span class="help-block"><b>Default</b> Normal:<code>#777777</code>, Hover:<code>#333333</code></span>
			                	</div>
											</div>

										</fieldset>

										<fieldset id="colors-body">

											<legend><?php echo $entry_body_bold; ?></legend>

											<div class="form-group">
												<label class="col-sm-2 control-label"><?php echo $entry_background_color; ?></label>
												<div class="col-sm-10">
													<input type="text" name="sellegance_background_color" value="<?php echo $sellegance_background_color; ?>" size="6" class="color {required:false,hash:true}"  />
													<span class="help-block"><b>Default</b> <code>#FFFFFF</code></span>
												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-2 control-label"><?php echo $entry_title_color; ?></label>
												<div class="col-sm-10">
													<input type="text" name="sellegance_title_color" value="<?php echo $sellegance_title_color; ?>" size="6" class="color {required:false,hash:true}"  />
													<span class="help-block"><?php echo $entry_title_color_help; ?></span>
												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-2 control-label"><?php echo $entry_textcolor_caption; ?></label>
												<div class="col-sm-10">
													<input type="text" name="sellegance_bodytext_color" value="<?php echo $sellegance_bodytext_color; ?>" size="6" class="color {required:false,hash:true}"  />
													<span class="help-block"><?php echo $entry_body_color_help; ?></span>
												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-2 control-label"><?php echo $entry_links_caption; ?></label>
												<div class="col-sm-10">
													<input type="text" name="sellegance_content_links_color" value="<?php echo $sellegance_content_links_color; ?>" size="6" class="color {required:false,hash:true}" />
													<span class="help-block"><b>Default</b> <code>#111111</code></span>
												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-2 control-label"><?php echo $entry_light_color; ?></label>
												<div class="col-sm-10">
													<input type="text" name="sellegance_lighttext_color" value="<?php echo $sellegance_lighttext_color; ?>" size="6" class="color {required:false,hash:true}"  />
														<span class="help-block"><?php echo $entry_light_color_help; ?></span>
												</div>
											</div>

										</fieldset>

										<fieldset id="colors-footer">

											<legend><?php echo $entry_footer_bold; ?></legend>

											<div class="form-group">
												<label class="col-sm-2 control-label"><?php echo $entry_textcolor_caption; ?></label>
												<div class="col-sm-10">
													<input type="text" name="sellegance_footer_text_color" value="<?php echo $sellegance_footer_text_color; ?>" size="6" class="color {required:false,hash:true}" />
													<span class="help-block"><b>Default</b> <code>#333333</code></span>
												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-2 control-label"><?php echo $entry_links_caption; ?></label>
												<div class="col-sm-10">
													<input type="text" name="sellegance_footer_links_color" value="<?php echo $sellegance_footer_links_color; ?>" size="6" class="color {required:false,hash:true}" />
													<span class="help-block"><b>Default</b> <code>#777777</code></span>
												</div>
											</div>

										</fieldset>

										<fieldset id="colors-buttons">

											<legend><?php echo $entry_buttons_bold; ?></legend>

											<div class="form-group">
												<label class="col-sm-2 control-label"><?php echo $entry_button_color; ?></label>
												<div class="col-sm-10">
													<span class="customhelp">Normal:</span> <input type="text" name="sellegance_button_normal_bg" value="<?php echo $sellegance_button_normal_bg; ?>" size="6" class="color {required:false,hash:true}" />
													<span class="customhelp"><?php echo $entry_hover_caption; ?></span> <input type="text" name="sellegance_button_hover_bg" value="<?php echo $sellegance_button_hover_bg; ?>" size="6" class="color {required:false,hash:true}" />
													<span class="customhelp"><?php echo $entry_textcolor_caption; ?></span> <input type="text" name="sellegance_button_text_color" value="<?php echo $sellegance_button_text_color; ?>" size="6" class="color {required:false,hash:true}" />
													<span class="help-block"><b>Default</b> Normal:<code>#333333</code>, Hover:<code>#333333</code>, Text:<code>#FFFFFF</code></span>
												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-2 control-label"><?php echo $entry_2button_color; ?></label>
												<div class="col-sm-10">
													<span class="customhelp">Normal:</span> <input type="text" name="sellegance_2button_normal_bg" value="<?php echo $sellegance_2button_normal_bg; ?>" size="6" class="color {required:false,hash:true}" />
													<span class="customhelp"><?php echo $entry_hover_caption; ?></span> <input type="text" name="sellegance_2button_hover_bg" value="<?php echo $sellegance_2button_hover_bg; ?>" size="6" class="color {required:false,hash:true}" />
													<span class="help-block"><p>Colors will be applied to border and text. Background is transparent.</p><b>Default</b> Normal:<code>#555555</code>, Hover:<code>#555555</code></span>
												</div>
											</div>

										</fieldset>

										<fieldset id="colors-products">

											<legend><?php echo $entry_products_bold; ?></legend>

											<div class="form-group">
												<label class="col-sm-2 control-label"><?php echo $entry_product_name; ?></label>
												<div class="col-sm-10">
													<input type="text" name="sellegance_product_name_color" value="<?php echo $sellegance_product_name_color; ?>" size="6" class="color {required:false,hash:true}" />
													<span class="help-block"><?php echo $entry_product_name_help; ?>. <b>Default</b>:<code>#333333</code></span>
												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-2 control-label"><?php echo $entry_product_price; ?></label>
												<div class="col-sm-10">
													<span class="customhelp"><?php echo $entry_normal_price; ?></span> <input type="text" name="sellegance_normal_price_color" value="<?php echo $sellegance_normal_price_color; ?>" size="6" class="color {required:false,hash:true}" />
													<span class="customhelp"><?php echo $entry_old_price; ?></span> <input type="text" name="sellegance_old_price_color" value="<?php echo $sellegance_old_price_color; ?>" size="6" class="color {required:false,hash:true}" />
													<span class="customhelp"><?php echo $entry_promotion_price; ?></span> <input type="text" name="sellegance_new_price_color" value="<?php echo $sellegance_new_price_color; ?>" size="6" class="color {required:false,hash:true}" />
													<span class="help-block"><b>Default</b> Normal:<code>#333333</code>, Old:<code>#191919</code>, New:<code>#FF3B40</code></span>
												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-2 control-label"><?php echo $entry_onsale_color; ?></label>
												<div class="col-sm-10">
													<span class="customhelp"><?php echo $entry_background_caption; ?></span> <input type="text" name="sellegance_onsale_background_color" value="<?php echo $sellegance_onsale_background_color; ?>" size="6" class="color {required:false,hash:true}" />
													<span class="customhelp"><?php echo $entry_textcolor_caption; ?></span> <input type="text" name="sellegance_onsale_text_color" value="<?php echo $sellegance_onsale_text_color; ?>" size="6" class="color {required:false,hash:true}" />
													<span class="help-block"><b>Default</b> Normal:<code>#3498DB</code>, Text:<code>#FFFFFF</code></span>
												</div>
											</div>

										</fieldset>

										<fieldset id="colors-other">

											<legend><?php echo $entry_other_bold; ?></legend>

											<div class="form-group">
												<label class="col-sm-2 control-label"><?php echo $entry_category_menu; ?></label>
												<div class="col-sm-10">
													<input type="text" name="sellegance_categories_active_color" value="<?php echo $sellegance_categories_active_color; ?>" size="6" class="color {required:false,hash:true}" />
													<span class="help-block"><b>Default</b> <code>#111111</code></span>
												</div>
											</div>

										</fieldset>

								</div>

								<div class="tab-pane fade" id="design-background">

									<fieldset>

										<legend><?php echo $entry_pattern_sub; ?></legend>

										<div class="form-group">
											<label class="col-sm-2 control-label" for="sellegance_pattern_overlay"><?php echo $entry_pattern_overlay; ?></label>
											<div class="col-sm-10">
												<div>
													<?php for ($i = 1; $i <= 42; $i++) { ?>
														<div class="pttrn"><span class="customhelp"><?php echo $i; ?></span><img src="view/image/patterns/<?php echo $i; ?>.png" alt="pattern <?php echo $i; ?>"></div>
														<?php if(!($i%14)): ?>
															<br />
														<?php endif ?>
													<?php } ?>
												</div> <br />
												<select name="sellegance_pattern_overlay" class="form-control">
													<option value="none"selected="selected">none</option>
													<?php for ($i = 1; $i <= 42; $i++) { 
															($sellegance_pattern_overlay == $i) ? $currentpat = 'selected' : $currentpat = '';
														?>
														<option value="<?php echo $i; ?>" <?php echo $currentpat; ?>><?php echo $i; ?></option>'; 
														<?php } ?>
												</select>
												<span class="help-block"><?php echo $entry_pattern_overlay_help; ?></span>
											</div>
										</div>

										<div class="form-group">
							                <label class="col-sm-2 control-label"><?php echo $entry_custom_pattern; ?></label>
							                <div class="col-sm-10">
							                	<a href="" id="custom_pattern" data-toggle="image" class="img-thumbnail"><img src="<?php echo $sellegance_pattern_preview; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
							                	<input type="hidden" name="sellegance_custom_pattern" value="<?php echo $sellegance_custom_pattern; ?>" id="sellegance_custom_pattern" />
							                </div>
						              </div>

						              <div class="form-group">
							                <label class="col-sm-2 control-label"><?php echo $entry_custom_image; ?></label>
							                <div class="col-sm-10">
							                	<a href="" id="custom_image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $sellegance_image_preview; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
							                	<input type="hidden" name="sellegance_custom_image" value="<?php echo $sellegance_custom_image; ?>" id="sellegance_custom_image" />
							                	<span class="help-block"><?php echo $entry_custom_image_help; ?></span>
							                </div>
						              </div>

						              <div class="form-group">
							                <label class="col-sm-2 control-label"><?php echo $entry_full_background; ?></label>
							                <div class="col-sm-10">
							                	<div class="btn-group btn-toggle" data-toggle="buttons">
													<?php if($sellegance_full_background == 1) { ?>
														<label class="btn btn-success btn-sm active">
															<input type="radio" name="sellegance_full_background" value="1" checked="checked">ON
														</label>
														<label class="btn btn-default btn-sm">
															<input type="radio" name="sellegance_full_background" value="0">OFF
														</label>
													<?php } else { ?>
														<label class="btn btn-default btn-sm">
															<input type="radio" name="sellegance_full_background" value="1">ON
														</label>
														<label class="btn btn-success btn-sm active">
															<input type="radio" name="sellegance_full_background" value="0" checked="checked">OFF
														</label>
													<?php } ?>
												</div>
							                	<span class="help-block"><?php echo $entry_full_background_help; ?></span>
							                </div>
						              </div>

									</fieldset>

								</div>

								<div class="tab-pane fade" id="design-fonts">

									<fieldset>
										<legend><?php echo $entry_fonts_sub; ?></legend>
										<p class="help-block"><?php echo $entry_fonts_sub_help; ?></p>

											<div class="form-group">
												<label class="col-sm-2 control-label" for="sellegance_title_font"><?php echo $entry_title_font; ?></label>
												<div class="col-sm-10">
													<div class="row">
														<div class="col-sm-4">
															<select name="sellegance_title_font" id="sellegance_title_font" class="font_select form-control">
																<?php foreach ($fonts as $fv => $fc) { ?>
																	<?php ($fv ==  $sellegance_title_font) ? $currentfont = 'selected' : $currentfont=''; ?>
																	<option value="<?php echo $fv; ?>" <?php echo $currentfont; ?> ><?php echo $fc; ?></option>	
																<?php } ?>
															</select>
														</div>
														<div class="col-sm-2">
															<select name="sellegance_title_font_size" id="sellegance_title_font_size" class="size_select form-control">
																<?php for ($i = 20; $i <= 48; $i++) { 
																		($sellegance_title_font_size == $i) ? $currentpat = 'selected' : $currentpat = '';
																	?>
																	<option value="<?php echo $i; ?>" <?php echo $currentpat; ?>><?php echo $i; ?> px</option>'; 
																	<?php } ?>
															</select>
														</div>
													</div>

													<span class="help-block"><?php echo $entry_title_font_help; ?></span>

													<div class="well">
														<h1 id="title_font_preview"><?php echo $entry_dummy_text; ?></h1>
													</div>

												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-2 control-label" for="sellegance_body_font"><?php echo $entry_body_font; ?></label>
												<div class="col-sm-10">
													<div class="row">
														<div class="col-sm-4">
															<select name="sellegance_body_font" id="sellegance_body_font" class="font_select form-control">
																<?php foreach ($fonts as $fv => $fc) { ?>
																	<?php ($fv ==  $sellegance_body_font) ? $currentfont = 'selected' : $currentfont=''; ?>
																	<option value="<?php echo $fv; ?>" <?php echo $currentfont; ?> ><?php echo $fc; ?></option>	
																<?php } ?>
															</select>
														</div>
														<div class="col-sm-2">
															<select name="sellegance_body_font_size" id="sellegance_body_font_size" class="size_select form-control">
																<?php for ($i = 10; $i <= 18; $i++) { 
																		($sellegance_body_font_size == $i) ? $currentpat = 'selected' : $currentpat = '';
																	?>
																	<option value="<?php echo $i; ?>" <?php echo $currentpat; ?>><?php echo $i; ?> px</option>'; 
																	<?php } ?>
															</select>
														</div>
													</div>

													<span class="help-block"><?php echo $entry_body_font_help; ?></span>

													<div class="well">
														<p id="body_font_preview"><?php echo $entry_dummy_text; ?></p>
													</div>

												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-2 control-label" for="sellegance_small_font"><?php echo $entry_small_font; ?></label>
												<div class="col-sm-10">
													<div class="row">
														<div class="col-sm-4">
															<select name="sellegance_small_font" id="sellegance_small_font" class="font_select form-control">
																<?php foreach ($fonts as $fv => $fc) { ?>
																	<?php ($fv ==  $sellegance_small_font) ? $currentfont = 'selected' : $currentfont=''; ?>
																	<option value="<?php echo $fv; ?>" <?php echo $currentfont; ?> ><?php echo $fc; ?></option>	
																<?php } ?>
															</select>
														</div>
														<div class="col-sm-2">
															<select name="sellegance_small_font_size" id="sellegance_small_font_size" class="size_select form-control">
																<?php for ($i = 7; $i <= 14; $i++) { 
																		($sellegance_small_font_size == $i) ? $currentpat = 'selected' : $currentpat = '';
																	?>
																	<option value="<?php echo $i; ?>" <?php echo $currentpat; ?>><?php echo $i; ?> px</option>'; 
																	<?php } ?>
															</select>
														</div>
													</div>

													<span class="help-block"><?php echo $entry_small_font_help; ?></span>

													<div class="well">
														<p id="small_font_preview"><?php echo $entry_dummy_text; ?></p>
													</div>

												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-2 control-label" for="sellegance_cyrillic_fonts"><?php echo $entry_cyrillic_fonts; ?></label>
												<div class="col-sm-10">

													<div class="btn-group btn-toggle" data-toggle="buttons">
														<?php if($sellegance_cyrillic_fonts == 1) { ?>
															<label class="btn btn-success btn-sm active">
																<input type="radio" name="sellegance_cyrillic_fonts" value="1" checked="checked">ON
															</label>
															<label class="btn btn-default btn-sm">
																<input type="radio" name="sellegance_cyrillic_fonts" value="0">OFF
															</label>
														<?php } else { ?>
															<label class="btn btn-default btn-sm">
																<input type="radio" name="sellegance_cyrillic_fonts" value="1">ON
															</label>
															<label class="btn btn-success btn-sm active">
																<input type="radio" name="sellegance_cyrillic_fonts" value="0" checked="checked">OFF
															</label>
														<?php } ?>
													</div>

												</div>
											</div>

									</fieldset>

								</div>

							</div>
						</div>

						<div class="tab-pane fade"  id="menu_settings">

							<ul class="nav nav-pills">
								<li class="active"><a href="#menu-general" data-toggle="tab"><?php echo $entry_menu_general_sub; ?></a></li>
								<li><a href="#menu-categories" data-toggle="tab"><?php echo $entry_menu_categories_sub; ?></a></li>
								<li><a href="#menu-brands" data-toggle="tab"><?php echo $entry_menu_brands_sub; ?></a></li>
								<li><a href="#menu-toplinks" data-toggle="tab"><?php echo $entry_menu_links_sub; ?></a></li>
								<li><a href="#menu-dropdown" data-toggle="tab"><?php echo $entry_menu_dropdown_sub; ?></a></li>
								<li><a href="#menu-blocks" data-toggle="tab"><?php echo $entry_menu_custom_blocks_sub; ?></a></li>
								<li><a href="#menu-infopages" data-toggle="tab"><?php echo $entry_menu_infopages_sub; ?></a></li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane active" id="menu-general">

									<fieldset>

									<div class="alert alert-info">Don't forget to choose your preferred menu style on the <b><i class="fa fa-pencil"></i> Design Options</b> tab</div>

										<legend><?php echo $entry_menu_general_sub; ?></legend>

						              <div class="form-group">
							                <label class="col-sm-2 control-label"><?php echo $entry_menu_sticky; ?></label>
							                <div class="col-sm-10">
							                	<div class="btn-group btn-toggle" data-toggle="buttons">
																<?php if($sellegance_sticky_menu == 1) { ?>
																	<label class="btn btn-success btn-sm active">
																		<input type="radio" name="sellegance_sticky_menu" value="1" checked="checked">ON
																	</label>
																	<label class="btn btn-default btn-sm">
																		<input type="radio" name="sellegance_sticky_menu" value="0">OFF
																	</label>
																<?php } else { ?>
																	<label class="btn btn-default btn-sm">
																		<input type="radio" name="sellegance_sticky_menu" value="1">ON
																	</label>
																	<label class="btn btn-success btn-sm active">
																		<input type="radio" name="sellegance_sticky_menu" value="0" checked="checked">OFF
																	</label>
																<?php } ?>
															</div>
							                	<span class="help-block"><?php echo $entry_menu_sticky_help; ?></span>
							                </div>
						              </div>

						              <div class="form-group">
							                <label class="col-sm-2 control-label"><?php echo $entry_menu_fullwidth_dropdown; ?></label>
							                <div class="col-sm-10">
							                	<div class="btn-group btn-toggle" data-toggle="buttons">
																<?php if($sellegance_fullwidth_dropdown_menu == 1) { ?>
																	<label class="btn btn-success btn-sm active">
																		<input type="radio" name="sellegance_fullwidth_dropdown_menu" value="1" checked="checked">ON
																	</label>
																	<label class="btn btn-default btn-sm">
																		<input type="radio" name="sellegance_fullwidth_dropdown_menu" value="0">OFF
																	</label>
																<?php } else { ?>
																	<label class="btn btn-default btn-sm">
																		<input type="radio" name="sellegance_fullwidth_dropdown_menu" value="1">ON
																	</label>
																	<label class="btn btn-success btn-sm active">
																		<input type="radio" name="sellegance_fullwidth_dropdown_menu" value="0" checked="checked">OFF
																	</label>
																<?php } ?>
															</div>
							                	<span class="help-block"><?php echo $entry_menu_fullwidth_dropdown_help; ?></span>
							                </div>
						              </div>

						              <legend><?php echo $entry_homepage_link_sub; ?></legend>

						              <div class="form-group">
							                <label class="col-sm-2 control-label"><?php echo $entry_homepage_link_style; ?></label>
							                <div class="col-sm-10">
							                	<select name="sellegance_homepage_link_style" class="form-control">
													<?php foreach ($homepage_link as $fv => $fc) { ?>
														<?php ($fv ==  $sellegance_homepage_link_style) ? $current = 'selected' : $current=''; ?>
														<option value="<?php echo $fv; ?>" <?php echo $current; ?> ><?php echo $fc; ?></option>	
													<?php } ?>
												</select>
							                </div>
						              </div>
										
									</fieldset>

								</div>
								<div class="tab-pane" id="menu-categories">

									<fieldset>

										<legend><?php echo $entry_menu_categories_sub; ?></legend>

										 <div class="form-group">
							                <label class="col-sm-2 control-label"><?php echo $entry_menu_category_style; ?></label>
							                <div class="col-sm-10">
							                	<select name="sellegance_menu_categories" class="form-control">
													<?php foreach ($menu_category_style as $fv => $fc) { ?>
														<?php ($fv ==  $sellegance_menu_categories) ? $current = 'selected' : $current=''; ?>
														<option value="<?php echo $fv; ?>" <?php echo $current; ?> ><?php echo $fc; ?></option>	
													<?php } ?>
												</select>
							                </div>
						              </div>

						              <div class="form-group">
												<label class="col-sm-2 control-label">Visibility</label>
												<div class="col-sm-10">
													<select name="sellegance_menu_categories_visibility" class="form-control">
														<?php foreach ($visibility as $fv => $fc) { ?>
															<?php ($fv ==  $sellegance_menu_categories_visibility) ? $current = 'selected' : $current=''; ?>
															<option value="<?php echo $fv; ?>" <?php echo $current; ?> ><?php echo $fc; ?></option>	
														<?php } ?>
													</select>
												</div>
											</div>

											<div class="form-group">
											<label class="col-sm-2 control-label"><?php echo 'Top link title' ?></label>
											<div class="col-sm-10">
											<span class="help-block">Only in <em>Vertical</em> or <em>Dropdown Table</em> mode</span>
												<?php foreach ($languages as $language) { ?>
												<?php $language_id=$language['language_id']; ?>
													<div class="input-group">
														<input type="text" name="sellegance_categories_top_title[<?php echo $language_id; ?>]" id="sellegance_categories_top_title_<?php echo $language_id; ?>" value="<?php echo isset($sellegance_categories_top_title[$language_id]) ? $sellegance_categories_top_title[$language_id] : ''; ?>" class="form-control" />
														<span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
													</div>
												<?php } ?>
											</div>
										</div>

										<div class="form-group">
							                <label class="col-sm-2 control-label"><?php echo $entry_menu_category_icons; ?></label>
							                <div class="col-sm-10">
							                	<div class="btn-group btn-toggle" data-toggle="buttons">
													<?php if($sellegance_menu_category_icons == 1) { ?>
														<label class="btn btn-success btn-sm active">
															<input type="radio" name="sellegance_menu_category_icons" value="1" checked="checked">ON
														</label>
														<label class="btn btn-default btn-sm">
															<input type="radio" name="sellegance_menu_category_icons" value="0">OFF
														</label>
													<?php } else { ?>
														<label class="btn btn-default btn-sm">
															<input type="radio" name="sellegance_menu_category_icons" value="1">ON
														</label>
														<label class="btn btn-success btn-sm active">
															<input type="radio" name="sellegance_menu_category_icons" value="0" checked="checked">OFF
														</label>
													<?php } ?>
												</div>
							                </div>
						              </div>

						              <div class="form-group">
							                <label class="col-sm-2 control-label"><?php echo $entry_menu_categories_x_row; ?> <span title="<?php echo $entry_menu_categories_x_row_help; ?>" data-toggle="tooltip"></span></label>
							                <div class="col-sm-10">
							                	<select name="sellegance_menu_categories_x_row" class="form-control">
													<?php for ($i = 3; $i <= 6; $i++) { 
															($sellegance_menu_categories_x_row == $i) ? $currentpat = 'selected' : $currentpat = '';
														?>
														<option value="<?php echo $i; ?>" <?php echo $currentpat; ?>><?php echo $i; ?></option>'; 
														<?php } ?>
												</select>
												<span class="help-block"><?php echo $entry_menu_categories_x_row_help; ?></span>
							                </div>
						              </div>

						              <div class="form-group">
							                <label class="col-sm-2 control-label"><?php echo $entry_menu_3rd_level; ?></label>
							                <div class="col-sm-10">
							                	<div class="btn-group btn-toggle" data-toggle="buttons">
													<?php if($sellegance_3rd_level_cat == 1) { ?>
														<label class="btn btn-success btn-sm active">
															<input type="radio" name="sellegance_3rd_level_cat" value="1" checked="checked">ON
														</label>
														<label class="btn btn-default btn-sm">
															<input type="radio" name="sellegance_3rd_level_cat" value="0">OFF
														</label>
													<?php } else { ?>
														<label class="btn btn-default btn-sm">
															<input type="radio" name="sellegance_3rd_level_cat" value="1">ON
														</label>
														<label class="btn btn-success btn-sm active">
															<input type="radio" name="sellegance_3rd_level_cat" value="0" checked="checked">OFF
														</label>
													<?php } ?>
												</div>
							                </div>
						              </div>

						              <div class="form-group">
							                <label class="col-sm-2 control-label"><?php echo 'Categories menu tag' ?></label>
							                <div class="col-sm-10">
							                	<div class="row">
								                	<div class="col-sm-3">
														<span class="help-block"><?php echo $entry_textcolor_caption; ?></span>
														<?php foreach ($languages as $language) { ?>
														<?php $language_id=$language['language_id']; ?>
															<div class="input-group">
																<input type="text" name="sellegance_categories_tag[<?php echo $language_id; ?>]" id="sellegance_brands_tag_<?php echo $language_id; ?>" value="<?php echo isset($sellegance_categories_tag[$language_id]) ? $sellegance_categories_tag[$language_id] : ''; ?>" class="form-control" />
																<span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
															</div>
														<?php } ?>
													</div>
													<div class="col-sm-2">
														<span class="help-block"><?php echo $entry_background_caption; ?></span><br>
														<input type="text" name="sellegance_categories_tag_color" value="<?php echo $sellegance_categories_tag_color; ?>" size="6" class="color {required:false,hash:true}" />
													</div>
												</div>
							                </div>
						              </div>

									</fieldset>

								</div>
								<div class="tab-pane" id="menu-brands">

									<fieldset>

										<legend><?php echo $entry_menu_brands_sub; ?></legend>

										 <div class="form-group">
							                <label class="col-sm-2 control-label"><?php echo $entry_menu_brands_style; ?></label>
							                <div class="col-sm-10">
							                	<select name="sellegance_menu_brands" class="form-control">
													<?php if(($sellegance_menu_brands)=='') $sellegance_menu_brands = 'logoname'; ?>
													<?php foreach ($menu_brands_style as $fv => $fc) { ?>
														<?php ($fv ==  $sellegance_menu_brands) ? $current = 'selected' : $current=''; ?>
														<option value="<?php echo $fv; ?>" <?php echo $current; ?> ><?php echo $fc; ?></option>	
													<?php } ?>
												</select>
							                </div>
						              </div>

						              <div class="form-group">
											<label class="col-sm-2 control-label"><?php echo 'Top link title' ?></label>
											<div class="col-sm-10">
												<?php foreach ($languages as $language) { ?>
												<?php $language_id=$language['language_id']; ?>
													<div class="input-group">
														<input type="text" name="sellegance_brands_top_title[<?php echo $language_id; ?>]" id="sellegance_brands_top_title_<?php echo $language_id; ?>" value="<?php echo isset($sellegance_brands_top_title[$language_id]) ? $sellegance_brands_top_title[$language_id] : ''; ?>" class="form-control" />
														<span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
													</div>
												<?php } ?>
											</div>
										</div>

										<div class="form-group">
							                <label class="col-sm-2 control-label"><?php echo $entry_menu_brands_x_row; ?></label>
							                <div class="col-sm-10">
							                	<select name="sellegance_menu_brands_x_row" class="form-control">
													<?php for ($i = 3; $i <= 8; $i++) { 
															($sellegance_menu_brands_x_row == $i) ? $currentpat = 'selected' : $currentpat = '';
														?>
														<option value="<?php echo $i; ?>" <?php echo $currentpat; ?>><?php echo $i; ?></option>'; 
													<?php } ?>
												</select>
							                </div>
						              </div>

						              <div class="form-group">
							                <label class="col-sm-2 control-label"><?php echo 'Brands menu tag' ?></label>
							                <div class="col-sm-10">
							                	<div class="row">
								                	<div class="col-sm-3">
														<span class="help-block"><?php echo $entry_textcolor_caption; ?></span>
														<?php foreach ($languages as $language) { ?>
														<?php $language_id=$language['language_id']; ?>
															<div class="input-group">
																<input type="text" name="sellegance_brands_tag[<?php echo $language_id; ?>]" id="sellegance_brands_tag_<?php echo $language_id; ?>" value="<?php echo isset($sellegance_brands_tag[$language_id]) ? $sellegance_brands_tag[$language_id] : ''; ?>" class="form-control" />
																<span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
															</div>
														<?php } ?>
													</div>
													<div class="col-sm-2">
														<span class="help-block"><?php echo $entry_background_caption; ?></span><br>
														<input type="text" name="sellegance_brands_tag_color" value="<?php echo $sellegance_brands_tag_color; ?>" size="6" class="color {required:false,hash:true}" />
													</div>
												</div>
							                </div>
						              </div>

						            </fieldset>

								</div>
								<div class="tab-pane" id="menu-toplinks">

									<fieldset>
										<legend><?php echo $entry_menu_links_sub; ?></legend>

										<div class="table-responsive">
											<table class="table table-hover">
												<thead>
													<tr>
														<th class="left" width="10%">Link</th>
														<th class="left" width="10%">Status</th>
														<th class="left" width="30%"><?php echo $text_title; ?></th>
														<th class="left" width="30%">URL</th>
														<th class="left" width="20%">Target</th>
													</tr>
												</thead>
												<tbody>
													<?php for ($i = 1; $i <= 9; $i++) { ?>
													<tr>
														<td>Link <?php echo $i; ?>:</td>
														<td>
										            <div class="btn-group btn-toggle" data-toggle="buttons">
																<?php if($sellegance_menu_link[$i]['status'] == 1) { ?>
																	<label class="btn btn-success btn-sm active">
																		<input type="radio" name="sellegance_menu_link[<?php echo $i; ?>][status]" value="1" checked="checked">ON
																	</label>
																	<label class="btn btn-default btn-sm">
																		<input type="radio" name="sellegance_menu_link[<?php echo $i; ?>][status]" value="0">OFF
																	</label>
																<?php } else { ?>
																	<label class="btn btn-default btn-sm">
																		<input type="radio" name="sellegance_menu_link[<?php echo $i; ?>][status]" value="1">ON
																	</label>
																	<label class="btn btn-success btn-sm active">
																		<input type="radio" name="sellegance_menu_link[<?php echo $i; ?>][status]" value="0" checked="checked">OFF
																	</label>
																<?php } ?>
															</div>

														</td>
														<td>
															<?php foreach ($languages as $language) { ?>
															<?php $language_id = $language['language_id']; ?>

															<div class="input-group">
																<input type="text" name="sellegance_menu_link[<?php echo $i; ?>][<?php echo $language_id; ?>][title]" id="sellegance_menu_link_<?php echo $i; ?>_<?php echo $language_id; ?>_title" value="<?php echo isset($sellegance_menu_link[$i][$language_id]['title']) ? $sellegance_menu_link[$i][$language_id]['title'] : ''; ?>" class="form-control" />
																<span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
															</div>
															<?php } ?>
														</td>
														<td>
															<?php foreach ($languages as $language) { ?>
															<?php $language_id = $language['language_id']; ?>
															<div class="input-group">
																<input type="text" name="sellegance_menu_link[<?php echo $i; ?>][<?php echo $language_id; ?>][url]" id="sellegance_menu_link_<?php echo $i; ?>_<?php echo $language_id; ?>_url" value="<?php echo isset($sellegance_menu_link[$i][$language_id]['url']) ? $sellegance_menu_link[$i][$language_id]['url'] : ''; ?>" class="form-control" />
																<span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
															</div>
															<?php } ?>
														</td>
														<td>
															<select name="sellegance_menu_link[<?php echo $i; ?>][target]" class="form-control">
																<?php foreach ($menu_target as $fv => $fc) { ?>
																	<?php ($fv ==  $sellegance_menu_link[$i]['target']) ? $current = 'selected' : $current=''; ?>
																	<option value="<?php echo $fv; ?>" <?php echo $current; ?> ><?php echo $fc; ?></option>	
																<?php } ?>
															</select>
														</td>
													</tr>
													<?php } ?>
												</tbody>
											</table>
										</div>

									</fieldset>
											
								</div>
								<div class="tab-pane" id="menu-dropdown">

									<fieldset>
										
										<legend><?php echo $entry_menu_dropdown_sub; ?></legend>

										<div class="form-group">
							                <label class="col-sm-2 control-label"><?php echo 'Show custom dropdown menu' ?></label>
							                <div class="col-sm-10">
							                	<div class="btn-group btn-toggle" data-toggle="buttons">
													<?php if($sellegance_menu_dropdown_status == 1) { ?>
														<label class="btn btn-success btn-sm active">
															<input type="radio" name="sellegance_menu_dropdown_status" value="1" checked="checked">ON
														</label>
														<label class="btn btn-default btn-sm">
															<input type="radio" name="sellegance_menu_dropdown_status" value="0">OFF
														</label>
													<?php } else { ?>
														<label class="btn btn-default btn-sm">
															<input type="radio" name="sellegance_menu_dropdown_status" value="1">ON
														</label>
														<label class="btn btn-success btn-sm active">
															<input type="radio" name="sellegance_menu_dropdown_status" value="0" checked="checked">OFF
														</label>
													<?php } ?>
												</div>
							                </div>
						              </div>

										<div class="form-group">
							                <label class="col-sm-2 control-label"><?php echo $text_title; ?></label>
							                <div class="col-sm-10">
												<?php foreach ($languages as $language) { ?>
												<?php $language_id=$language['language_id']; ?>
													<div class="input-group">
														<input type="text" name="sellegance_menu_dropdown_title[<?php echo $language_id; ?>]" id="sellegance_menu_dropdown_title_<?php echo $language_id; ?>" value="<?php echo isset($sellegance_menu_dropdown_title[$language_id]) ? $sellegance_menu_dropdown_title[$language_id] : ''; ?>" class="form-control" />
														<span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
													</div>
												<?php } ?>
							                </div>
						              </div>

										<div class="form-group">
							                <label class="col-sm-2 control-label"><?php echo 'Custom dropdown tag' ?></label>
							                <div class="col-sm-10">
							                	<div class="row">
								                	<div class="col-sm-3">
														<span class="help-block"><?php echo $entry_textcolor_caption; ?></span>
														<?php foreach ($languages as $language) { ?>
														<?php $language_id=$language['language_id']; ?>
															<div class="input-group">
																<input type="text" name="sellegance_menu_dropdown_tag[<?php echo $language_id; ?>]" id="sellegance_menu_dropdown_tag_<?php echo $language_id; ?>" value="<?php echo isset($sellegance_menu_dropdown_tag[$language_id]) ? $sellegance_menu_dropdown_tag[$language_id] : ''; ?>" class="form-control" />
																<span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
															</div>
														<?php } ?>
													</div>
													<div class="col-sm-2">
														<span class="help-block"><?php echo $entry_background_caption; ?></span>
														<input type="text" name="sellegance_menu_dropdown_tag_color" value="<?php echo $sellegance_menu_dropdown_tag_color; ?>" size="6" class="color {required:false,hash:true}" />
													</div>
												</div>
							                </div>
						              </div>

										<div class="table-responsive">
											<table class="table table-hover">
												<thead>
													<tr>
														<th class="left" width="10%">Link</th>
														<th class="left" width="10%">Status</th>
														<th class="left" width="20%"><?php echo $text_title; ?></th>
														<th class="left" width="20%">URL</th>
														<th class="left" width="20%">Target</th>
													</tr>
												</thead>
												<tbody>
													<?php for ($i = 1; $i <= 9; $i++) { ?>
													<tr>
														<td>Link <?php echo $i; ?></td>
														<td>
															<div class="btn-group btn-toggle" data-toggle="buttons">
																<?php if($sellegance_menu_dropdown[$i]['status'] == 1) { ?>
																	<label class="btn btn-success btn-sm active">
																		<input type="radio" name="sellegance_menu_dropdown[<?php echo $i; ?>][status]" value="1" checked="checked">ON
																	</label>
																	<label class="btn btn-default btn-sm">
																		<input type="radio" name="sellegance_menu_dropdown[<?php echo $i; ?>][status]" value="0">OFF
																	</label>
																<?php } else { ?>
																	<label class="btn btn-default btn-sm">
																		<input type="radio" name="sellegance_menu_dropdown[<?php echo $i; ?>][status]" value="1">ON
																	</label>
																	<label class="btn btn-success btn-sm active">
																		<input type="radio" name="sellegance_menu_dropdown[<?php echo $i; ?>][status]" value="0" checked="checked">OFF
																	</label>
																<?php } ?>
															</div>

														</td>
														<td>
															<?php foreach ($languages as $language) { ?>
															<?php $language_id = $language['language_id']; ?>

															<div class="input-group">
																<input type="text" name="sellegance_menu_dropdown[<?php echo $i; ?>][<?php echo $language_id; ?>][title]" id="sellegance_menu_dropdown_<?php echo $i; ?>_<?php echo $language_id; ?>_title" value="<?php echo isset($sellegance_menu_dropdown[$i][$language_id]['title']) ? $sellegance_menu_dropdown[$i][$language_id]['title'] : ''; ?>" class="form-control" />
																<span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
															</div>

															<?php } ?>
														</td>
														<td>
															<input type="text" name="sellegance_menu_dropdown[<?php echo $i; ?>][url]" value="<?php echo $sellegance_menu_dropdown[$i]['url']; ?>" class="form-control" />
														</td>
														<td>
															<select name="sellegance_menu_dropdown[<?php echo $i; ?>][target]" class="form-control">
																<?php foreach ($menu_target as $fv => $fc) { ?>
																	<?php ($fv ==  $sellegance_menu_dropdown[$i]['target']) ? $current = 'selected' : $current=''; ?>
																	<option value="<?php echo $fv; ?>" <?php echo $current; ?> ><?php echo $fc; ?></option>	
																<?php } ?>
															</select>
														</td>
													</tr>
													<?php } ?>
												</tbody>
											</table>
										</div>

									</fieldset>
									
								</div>
								
								<div class="tab-pane" id="menu-blocks">

									<fieldset>
										
									 	<table id="menublocks" class="table table-bordered">

									 		<thead>
									 			<tr>
									 				<td class="text-left" width="">Content</td>
									 				<td class="text-left" width="5%">Sort Order</td>
									 				<td width="5%"></td>
									 			</tr>
									 		</thead>

											<tbody>
												<?php $section_row = 1; ?>
												<?php if(!empty($sellegance_menu_blocks)) { ?>
													<?php foreach ($sellegance_menu_blocks as $menu_block) { ?>
													<tr id="section-row<?php echo $section_row; ?>">
														
														<td class="text-left">

															<input type="hidden" name="sellegance_menu_blocks[<?php echo $section_row; ?>][id]" value="<?php echo $menu_block['id']; ?>">

										<div class="form-group">
																<label class="col-sm-2 control-label">Block <span class="badge"><?php echo $section_row; ?></span></label>
							                <div class="col-sm-10">
																	<p><div class="btn-group btn-toggle" data-toggle="buttons">
																	<?php if(isset($menu_block['status']) && $menu_block['status'] == 1) { ?>
														<label class="btn btn-success btn-sm active">
																			<input type="radio" name="sellegance_menu_blocks[<?php echo $section_row; ?>][status]" value="1" checked="checked">ON
														</label>
														<label class="btn btn-default btn-sm">
																			<input type="radio" name="sellegance_menu_blocks[<?php echo $section_row; ?>][status]" value="0">OFF
														</label>
													<?php } else { ?>
														<label class="btn btn-default btn-sm">
																			<input type="radio" name="sellegance_menu_blocks[<?php echo $section_row; ?>][status]" value="1">ON
														</label>
														<label class="btn btn-success btn-sm active">
																			<input type="radio" name="sellegance_menu_blocks[<?php echo $section_row; ?>][status]" value="0" checked="checked">OFF
														</label>
													<?php } ?>
																	</div></p>
																	<p>CSS id: <code>#menu_block<?php echo $section_row; ?></code></p>
												</div>
							                </div>

															<div class="form-group">
																<label class="col-sm-2 control-label">Visibility</label>
																<div class="col-sm-10">
																	<select name="sellegance_menu_blocks[<?php echo $section_row; ?>][visibility]" class="form-control">
																		<?php foreach ($visibility as $fv => $fc) { ?>
																			<?php ($fv ==  $menu_block['visibility']) ? $current = 'selected' : $current=''; ?>
																			<option value="<?php echo $fv; ?>" <?php echo $current; ?> ><?php echo $fc; ?></option>	
																		<?php } ?>
																	</select>
			            	</div>
						            	</div>

															<div class="panel">

															<ul id="menu_blocks_<?php echo $section_row; ?>" class="nav nav-tabs">
																<?php foreach ($languages as $language) { ?>
																	<li><a href="#custom_block_<?php echo $section_row; ?>_<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['language_id']; ?>" /> <?php echo $language['name']; ?></a></li>
																<?php } ?>
															</ul>

															<div class="tab-content">
																	
																<?php foreach ($languages as $language) { ?>

																<div id="custom_block_<?php echo $section_row; ?>_<?php echo $language['language_id']; ?>" class="tab-pane">

										<div class="form-group">
							                <label class="col-sm-2 control-label"><?php echo $text_title; ?></label>
							                <div class="col-sm-10">
																			<input type="text" name="sellegance_menu_blocks[<?php echo $section_row; ?>][title][<?php echo $language['language_id']; ?>]" value="<?php echo isset($menu_block['title'][$language['language_id']]) ? $menu_block['title'][$language['language_id']] : ''; ?>" class="form-control" />
																		</div>
													</div>

																	<div class="form-group">
																		<label class="col-sm-2 control-label">URL (optional)</label>
																		<div class="col-sm-10">
																			<input type="text" name="sellegance_menu_blocks[<?php echo $section_row; ?>][url][<?php echo $language['language_id']; ?>]" value="<?php echo isset($menu_block['url'][$language['language_id']]) ? $menu_block['url'][$language['language_id']] : ''; ?>" class="form-control" />
							                </div>
						           		</div>

										<div class="form-group">
							                <label class="col-sm-2 control-label"><?php echo 'Link tag' ?></label>
							                <div class="col-sm-10">
							                	<div class="row">
								                	<div class="col-sm-3">
														<span class="help-block"><?php echo $entry_textcolor_caption; ?></span>
																						<input type="text" name="sellegance_menu_blocks[<?php echo $section_row; ?>][tag][<?php echo $language['language_id']; ?>]" value="<?php echo isset($menu_block['tag'][$language['language_id']]) ? $menu_block['tag'][$language['language_id']] : ''; ?>" class="form-control" />
													</div>
													<div class="col-sm-2">
														<span class="help-block"><?php echo $entry_background_caption; ?></span>
														<input type="text" name="sellegance_custom_block_tag_color" value="<?php echo $sellegance_custom_block_tag_color; ?>" size="6" class="color {required:false,hash:true}" />
													</div>
												</div>
							                </div>
						            	</div>
									
											<div class="form-group">
																		<label class="col-sm-2 control-label"><?php //echo $entry_text; ?></label>
								                <div class="col-sm-10">
																			<textarea class="summernote" rows="6" name="sellegance_menu_blocks[<?php echo $section_row; ?>][content][<?php echo $language['language_id']; ?>]" id="description-<?php echo $section_row; ?>-<?php echo $language['language_id']; ?>"><?php echo isset($menu_block['content'][$language['language_id']]) ? $menu_block['content'][$language['language_id']] : ''; ?></textarea>
																		</div>
																	</div>
								                
																</div>
											
														<?php } ?>

															<script type="text/javascript">
																	$('#menu_blocks_<?php echo $section_row; ?> li:first-child a').tab('show');
															</script>
															
															</div>

													</div>

														</td>

														<td>
															<input type="text" name="sellegance_menu_blocks[<?php echo $section_row; ?>][sort]" value="<?php echo isset($menu_block['sort']) ? $menu_block['sort'] : 0; ?>" class="form-control" />
														</td>
														<td class="text-center">
														<button type="button" onclick="$('#section-row<?php echo $section_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button>
														</td>
													</tr>
													<?php $section_row++; ?>
												 <?php } ?>
											 <?php } ?>

											</tbody>
											<tfoot>
												<tr>
													<td colspan="2"></td>
													<td class="text-center"><button type="button" onclick="addRow();" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
												</tr>
											</tfoot>
										</table>

									</fieldset>

								</div>

								<div class="tab-pane" id="menu-infopages">

									<fieldset>
										
										<legend><?php echo 'Information pages'; ?></legend>

						            	<div class="form-group">
							                <label class="col-sm-2 control-label"><?php echo $entry_menu_infopages_style; ?></label>
							                <div class="col-sm-10">
							                	<select name="sellegance_menu_infopages" class="form-control">
																<?php if(($sellegance_menu_infopages)=='') $sellegance_menu_infopages = 'vertical'; ?>
																<?php foreach ($menu_infopages_style as $fv => $fc) { ?>
																		<?php ($fv ==  $sellegance_menu_infopages) ? $current = 'selected' : $current=''; ?>
																		<option value="<?php echo $fv; ?>" <?php echo $current; ?> ><?php echo $fc; ?></option>	
																<?php } ?>
															</select>
							                </div>
						            	</div>

    	    	            	<div class="form-group">
    											<label class="col-sm-2 control-label"><?php echo 'Top link title' ?></label>
    											<div class="col-sm-10">
    											<span class="help-block">Only in <em>Vertical</em>  mode</span>
    												<?php foreach ($languages as $language) { ?>
    												<?php $language_id=$language['language_id']; ?>
    													<div class="input-group">
    														<input type="text" name="sellegance_infopages_top_title[<?php echo $language_id; ?>]" id="sellegance_infopages_top_title_<?php echo $language_id; ?>" value="<?php echo isset($sellegance_infopages_top_title[$language_id]) ? $sellegance_infopages_top_title[$language_id] : ''; ?>" class="form-control" />
    														<span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
    													</div>
    												<?php } ?>
    											</div>
    										</div>

		    	            	<div class="form-group">
		    		                <label class="col-sm-2 control-label"><?php echo 'Information pages menu tag' ?> <span title="Only in vertical mode" data-toggle="tooltip"></span></label>
		    		                <div class="col-sm-10">

		    		                	<div class="row">
						                	<div class="col-sm-3">
														<span class="help-block"><?php echo $entry_textcolor_caption; ?></span>
														<?php foreach ($languages as $language) { ?>
														<?php $language_id=$language['language_id']; ?>
															<div class="input-group">
																<input type="text" name="sellegance_infopages_tag[<?php echo $language_id; ?>]" id="sellegance_infopages_tag_<?php echo $language_id; ?>" value="<?php echo isset($sellegance_infopages_tag[$language_id]) ? $sellegance_infopages_tag[$language_id] : ''; ?>" class="form-control" />
																<span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
															</div>
														<?php } ?>
													</div>
													<div class="col-sm-2">
														<span class="help-block"><?php echo $entry_background_caption; ?></span>
														<input type="text" name="sellegance_infopages_tag_color" value="<?php echo $sellegance_infopages_tag_color; ?>" size="6" class="color {required:false,hash:true}" />
													</div>
												</div>


				    							<span class="help-block">Only in vertical mode</span>

				    		                </div>
				    	            	</div>


									</fieldset>

								</div>
							</div>                  
						 
						</div>

						<div class="tab-pane fade" id="header_settings">

							<fieldset>
								
								<legend><?php echo $entry_header_layout_sub; ?></legend>

								<div class="form-group">
									<label class="col-sm-2 control-label" for="sellegance_logo_position"><?php echo $entry_logo_position; ?> <span title="<?php echo $entry_logo_position_help; ?>" data-toggle="tooltip"></span></label>
									<div class="col-sm-10">
										<select name="sellegance_logo_position" class="form-control">
											<?php foreach ($logo_position as $fv => $fc) { ?>
												<?php ($fv ==  $sellegance_logo_position) ? $current = 'selected' : $current=''; ?>
												<option value="<?php echo $fv; ?>" <?php echo $current; ?> ><?php echo $fc; ?></option>	
											<?php } ?>
										</select>
										<span class="help-block"><?php echo $entry_logo_position_help; ?></span>
									</div>
								</div>

								<legend><?php echo $entry_searchbox_sub; ?></legend>
									
								<div class="form-group">
									<label class="col-sm-2 control-label" for="sellegance_searchbox_regular"><?php echo $entry_searchbox_regular; ?></label>
									<div class="col-sm-10">

										<div class="btn-group btn-toggle" data-toggle="buttons">
											<?php if($sellegance_searchbox_regular == 1) { ?>
												<label class="btn btn-success btn-sm active">
													<input type="radio" name="sellegance_searchbox_regular" value="1" checked="checked">ON
												</label>
												<label class="btn btn-default btn-sm">
													<input type="radio" name="sellegance_searchbox_regular" value="0">OFF
												</label>
											<?php } else { ?>
												<label class="btn btn-default btn-sm">
													<input type="radio" name="sellegance_searchbox_regular" value="1">ON
												</label>
												<label class="btn btn-success btn-sm active">
													<input type="radio" name="sellegance_searchbox_regular" value="0" checked="checked">OFF
												</label>
											<?php } ?>
										</div>
										<span class="help-block"><?php echo $entry_searchbox_regular_help; ?> </span>

									</div>
								</div>

								<legend><?php echo $entry_footer_info_sub; ?></legend>

								<div class="form-group">
									<label class="col-sm-2 control-label" for="sellegance_header_info_text">Custom Text</label>
									<div class="col-sm-10">
										
										<ul id="sellegance_header_info_text" class="nav nav-tabs">
											<?php foreach ($languages as $language) { ?>
												<li><a href="#sellegance_header_info_text_<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="../image/flags/<?php echo $language['image'] ?>" alt="<?php echo $language['name']; ?>" width="16px" height="11px" /> <?php echo $language['name']; ?></a></li>
											<?php } ?>
										</ul>
										<div class="tab-content">
											<?php foreach ($languages as $language) { ?>

												<?php $language_id = $language['language_id']; ?>
												
												<div id="sellegance_header_info_text_<?php echo $language_id; ?>" class="tab-pane">
													<textarea name="sellegance_header_info_text[<?php echo $language_id; ?>]" id="sellegance_header_info_text-<?php echo $language_id; ?>" ><?php echo isset($sellegance_header_info_text[$language_id]) ? $sellegance_header_info_text[$language_id] : ''; ?></textarea>
												</div>
												
											<?php } ?>
										</div>

										<script type="text/javascript">
											
											<?php foreach ($languages as $language) { ?>
											$('#sellegance_header_info_text-<?php echo $language['language_id']; ?>').summernote({height: 300});
											<?php } ?>

											$('#sellegance_header_info_text li:first-child a').tab('show');

										</script> 

										<p class="help-block"><?php echo $entry_header_info_text_help; ?></p>
										
									</div>
								</div>

							</fieldset>

						</div>	

						<div class="tab-pane fade" id="footer_settings">

							<fieldset>

								<legend><?php echo $entry_footer_bold; ?></legend>	

								<div class="form-group">
									<label class="col-sm-2 control-label" for="sellegance_footer_modules">Modules per row</label>
									<div class="col-sm-10">
										<select name="sellegance_footer_modules" class="form-control">
											<?php for ($i = 1; $i <= 4; $i++) { 
													($sellegance_footer_modules == $i) ? $currentpat = 'selected' : $currentpat = '';
												?>
												<option value="<?php echo $i; ?>" <?php echo $currentpat; ?>><?php echo $i; ?></option>'; 
												<?php } ?>
										</select>
										<span class="help-block">Number of columns to show footer modules.</span>
									</div>
								</div>

								<legend><?php echo $entry_footer_info_sub; ?></legend>

								<div class="form-group">
									<label class="col-sm-2 control-label" for="sellegance_footer_info_text"><?php echo $entry_footer_info_text; ?></label>
									<div class="col-sm-10">
										
										<ul id="sellegance_footer_info_text" class="nav nav-tabs">
											<?php foreach ($languages as $language) { ?>
												<li><a href="#sellegance_footer_info_text_<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="../image/flags/<?php echo $language['image'] ?>" alt="<?php echo $language['name']; ?>" width="16px" height="11px" /> <?php echo $language['name']; ?></a></li>
											<?php } ?>
										</ul>
										<div class="tab-content">
											<?php foreach ($languages as $language) { ?>

												<?php $language_id = $language['language_id']; ?>
												
												<div id="sellegance_footer_info_text_<?php echo $language_id; ?>" class="tab-pane">
													<textarea name="sellegance_footer_info_text[<?php echo $language_id; ?>]" id="sellegance_footer_info_text-<?php echo $language_id; ?>" ><?php echo isset($sellegance_footer_info_text[$language_id]) ? $sellegance_footer_info_text[$language_id] : ''; ?></textarea>
												</div>
												
											<?php } ?>
										</div>

										<script type="text/javascript">
											
											<?php foreach ($languages as $language) { ?>
											$('#sellegance_footer_info_text-<?php echo $language['language_id']; ?>').summernote({height: 300});
											<?php } ?>

											$('#sellegance_footer_info_text li:first-child a').tab('show');

										</script> 

										<p class="help-block"><?php echo $entry_footer_info_text_help; ?></p>
										
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label" for="sellegance_copyright"><?php echo $entry_copyright_text; ?></label>
									<div class="col-sm-10">
										
										<ul id="sellegance_copyright" class="nav nav-tabs">
											<?php foreach ($languages as $language) { ?>
												<li><a href="#sellegance_copyright_<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="../image/flags/<?php echo $language['image'] ?>" alt="<?php echo $language['name']; ?>" width="16px" height="11px" /> <?php echo $language['name']; ?></a></li>
											<?php } ?>
										</ul>
										<div class="tab-content">
											<?php foreach ($languages as $language) { ?>

												<?php $language_id = $language['language_id']; ?>
												
												<div id="sellegance_copyright_<?php echo $language_id; ?>" class="tab-pane">
													<textarea name="sellegance_copyright[<?php echo $language_id; ?>]" id="sellegance_copyright-<?php echo $language_id; ?>" ><?php if(isset($sellegance_copyright[$language_id])) echo $sellegance_copyright[$language_id]; ?></textarea>
												</div>
												
											<?php } ?>
										</div>

										<script type="text/javascript">
											
											<?php foreach ($languages as $language) { ?>
											$('#sellegance_copyright-<?php echo $language['language_id']; ?>').summernote({height: 300});
											<?php } ?>

											$('#sellegance_copyright li:first-child a').tab('show');

										</script> 

										<p class="help-block"><?php echo $entry_copyright_text_help; ?></p>
										
									</div>
								</div>

							</fieldset>				

						</div>

						

						<div class="tab-pane fade" id="social_settings">

									<fieldset>
										<legend><?php echo $entry_social_settings_sub; ?></legend>

										<div class="form-group">
											<label class="col-sm-2 control-label" for="sellegance_social_header"><?php echo $entry_social_header; ?></label>
											<div class="col-sm-10">

												<div class="btn-group btn-toggle" data-toggle="buttons">
													<?php if($sellegance_social_header == 1) { ?>
														<label class="btn btn-success btn-sm active">
															<input type="radio" name="sellegance_social_header" value="1" checked="checked">ON
														</label>
														<label class="btn btn-default btn-sm">
															<input type="radio" name="sellegance_social_header" value="0">OFF
														</label>
													<?php } else { ?>
														<label class="btn btn-default btn-sm">
															<input type="radio" name="sellegance_social_header" value="1">ON
														</label>
														<label class="btn btn-success btn-sm active">
															<input type="radio" name="sellegance_social_header" value="0" checked="checked">OFF
														</label>
													<?php } ?>
												</div>

											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label" for="sellegance_social_footer"><?php echo $entry_social_footer; ?></label>
											<div class="col-sm-10">

												<div class="btn-group btn-toggle" data-toggle="buttons">
													<?php if($sellegance_social_footer == 1) { ?>
														<label class="btn btn-success btn-sm active">
															<input type="radio" name="sellegance_social_footer" value="1" checked="checked">ON
														</label>
														<label class="btn btn-default btn-sm">
															<input type="radio" name="sellegance_social_footer" value="0">OFF
														</label>
													<?php } else { ?>
														<label class="btn btn-default btn-sm">
															<input type="radio" name="sellegance_social_footer" value="1">ON
														</label>
														<label class="btn btn-success btn-sm active">
															<input type="radio" name="sellegance_social_footer" value="0" checked="checked">OFF
														</label>
													<?php } ?>
												</div>

											</div>
										</div>

										<legend><?php echo $entry_social_icons_sub; ?></legend>

								<div class="table-responsive">
									<table class="table table-hover">
										<thead>
											<tr>
												<th width="20%">Social Media</th>
												<th width="60%">URL <span class="customhelp">including http://</span></th>
												<th width="20%">Target</th>
											</tr>
										</thead>
										<tbody>
										<?php foreach ($social_media as $fv => $fc) { ?>
										<tr>
											<td><label class="control-label"><?php echo $fc; ?></label>
											<input type="hidden" name="sellegance_social[<?php echo $fv; ?>][class]" value="<?php echo $fv; ?>"></input></td>
											<td><input type="text" name="sellegance_social[<?php echo $fv; ?>][url]" value="<?php echo isset($sellegance_social[$fv]['url']) ? $sellegance_social[$fv]['url'] : ''; ?>" class="form-control" />
											<?php if($fv=='facebook') { ?>
											<label class="control-label">Show widget on Footer</label>
												<div class="btn-group btn-toggle" data-toggle="buttons">
													<?php if($sellegance_facebook_widget == 1) { ?>
														<label class="btn btn-success btn-sm active">
															<input type="radio" name="sellegance_facebook_widget" value="1" checked="checked">ON
														</label>
														<label class="btn btn-default btn-sm">
															<input type="radio" name="sellegance_facebook_widget" value="0">OFF
														</label>
													<?php } else { ?>
														<label class="btn btn-default btn-sm">
															<input type="radio" name="sellegance_facebook_widget" value="1">ON
														</label>
														<label class="btn btn-success btn-sm active">
															<input type="radio" name="sellegance_facebook_widget" value="0" checked="checked">OFF
														</label>
													<?php } ?>
												</div>
													<?php } ?>
											</td>
											<td>
												<select name="sellegance_social[<?php echo $fv; ?>][target]" class="form-control">
												<?php foreach ($menu_target as $gv => $gc) { ?>
													<?php ($gv ==  $sellegance_social[$fv]['target']) ? $current = 'selected' : $current=''; ?>
													<option value="<?php echo $gv; ?>" <?php echo $current; ?> ><?php echo $gc; ?></option>	
												<?php } ?>
												</select>
											</td>
										</tr>
										<?php } ?>
										</tbody>

									</table>
										</div>

								<legend>Custom Icons</legend>

												<div class="table-responsive">
											<table class="table table-hover">
												<thead>
													<tr>
													<th width="20%">Font Awesome icon name<br> <span class="customhelp" style="text-transform:none;">(ie. <code>whatsapp</code>) <a href="//fontawesome.io/icons/" target="_blank">view icons <i class="fa fa-external-link"></i></a><br>Paste the icon name exactly as it appears</span></th>
													<th width="60%">URL <span class="customhelp">including http://</span></th>
													<th width="20%">Target</th>
													</tr>
												</thead>
												<tbody>
													<?php for ($i=1; $i<=5; $i++) { ?>
													<tr>
													<td><input type="text" name="sellegance_custom_icon[<?php echo $i; ?>][class]" value="<?php echo isset($sellegance_custom_icon[$i]['class']) ? $sellegance_custom_icon[$i]['class'] : ''; ?>" class="form-control" /></td>
													<td><input type="text" name="sellegance_custom_icon[<?php echo $i; ?>][url]" value="<?php echo isset($sellegance_custom_icon[$i]['url']) ? $sellegance_custom_icon[$i]['url'] : ''; ?>" class="form-control" /></td>
														<td>
														<select name="sellegance_custom_icon[<?php echo $i; ?>][target]" class="form-control">
														<?php foreach ($menu_target as $gv => $gc) { ?>
															<?php ($gv ==  $sellegance_custom_icon[$i]['target']) ? $current = 'selected' : $current=''; ?>
															<option value="<?php echo $gv; ?>" <?php echo $current; ?> ><?php echo $gc; ?></option>	
														<?php } ?>
														</select>
														</td>
													</tr>
													<?php } ?>
												</tbody>
											</table>
										</div>
										
									</fieldset>

								</div>

						<div class="tab-pane fade" id="custom_code_settings">

							<ul class="nav nav-pills">
								<li class="active"><a href="#custom-css" data-toggle="tab"><?php echo $entry_css_tab; ?></a></li>
								<li><a href="#custom-js" data-toggle="tab"><?php echo $entry_js_tab; ?></a></li>
							</ul>

							<div class="tab-content">
								<div class="tab-pane active" id="custom-css">

									<fieldset>
										<legend><?php echo $entry_custom_stylesheet_sub; ?></legend>

										<div class="form-group">
											<label class="col-sm-2 control-label" for="sellegance_custom_stylesheet"><?php echo $entry_custom_stylesheet; ?></label>
											<div class="col-sm-10">

												<div class="btn-group btn-toggle" data-toggle="buttons">
													<?php if($sellegance_custom_stylesheet == 1) { ?>
														<label class="btn btn-success btn-sm active">
															<input type="radio" name="sellegance_custom_stylesheet" value="1" checked="checked">ON
														</label>
														<label class="btn btn-default btn-sm">
															<input type="radio" name="sellegance_custom_stylesheet" value="0">OFF
														</label>
													<?php } else { ?>
														<label class="btn btn-default btn-sm">
															<input type="radio" name="sellegance_custom_stylesheet" value="1">ON
														</label>
														<label class="btn btn-success btn-sm active">
															<input type="radio" name="sellegance_custom_stylesheet" value="0" checked="checked">OFF
														</label>
													<?php } ?>
												</div>
												<span class="help-block"><?php echo $entry_custom_stylesheet_help; ?></span>

											</div>
										</div>

										<legend><?php echo $entry_custom_css_sub; ?></legend>

										<div class="form-group">
											<label class="col-sm-2 control-label" for="sellegance_custom_css_status">Enable custom CSS</label>
											<div class="col-sm-10">
												<div class="btn-group btn-toggle" data-toggle="buttons">
													<?php if($sellegance_custom_css_status == 1) { ?>
														<label class="btn btn-success btn-sm active"><input type="radio" name="sellegance_custom_css_status" value="1" checked="checked">ON</label>
														<label class="btn btn-default btn-sm"><input type="radio" name="sellegance_custom_css_status" value="2">OFF</label>
													<?php } else { ?>
														<label class="btn btn-default btn-sm"><input type="radio" name="sellegance_custom_css_status" value="1">ON</label>
														<label class="btn btn-success btn-sm active"><input type="radio" name="sellegance_custom_css_status" value="2" checked="checked">OFF</label>
													<?php } ?>
												</div>
												<span class="help-block"></span>
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label" for="sellegance_custom_css"><?php echo $entry_custom_css; ?></label>
											<div class="col-sm-10">
												<textarea name="sellegance_custom_css" rows="20" class="form-control"><?php echo $sellegance_custom_css; ?></textarea>
												<span class="help-block"><?php echo $entry_custom_css_help; ?></span>

											</div>
										</div>


									</fieldset>

								</div>

								<div class="tab-pane" id="custom-js">

									<fieldset>

										<legend><?php echo $entry_custom_js_sub; ?></legend>

										<div class="form-group">
											<label class="col-sm-2 control-label" for="sellegance_custom_js_status">Enable custom JavaScript</label>
											<div class="col-sm-10">
												<div class="btn-group btn-toggle" data-toggle="buttons">
													<?php if($sellegance_custom_js_status == 1) { ?>
														<label class="btn btn-success btn-sm active"><input type="radio" name="sellegance_custom_js_status" value="1" checked="checked">ON</label>
														<label class="btn btn-default btn-sm"><input type="radio" name="sellegance_custom_js_status" value="2">OFF</label>
													<?php } else { ?>
														<label class="btn btn-default btn-sm"><input type="radio" name="sellegance_custom_js_status" value="1">ON</label>
														<label class="btn btn-success btn-sm active"><input type="radio" name="sellegance_custom_js_status" value="2" checked="checked">OFF</label>
													<?php } ?>
												</div>
												<span class="help-block"></span>
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label" for="sellegance_custom_js"><?php echo $entry_custom_js; ?></label>
											<div class="col-sm-10">
												<textarea name="sellegance_custom_js" rows="20" class="form-control"><?php echo $sellegance_custom_js; ?></textarea>
												<span class="help-block"><?php echo $entry_custom_js_help; ?></span>

											</div>
										</div>

									</fieldset>

								</div>
							</div>

						</div>

					</div>

				</form>

			</div><!-- .panel-body -->

		</div><!-- .panel-default -->

	</div><!-- .container-fluid -->

</div><!-- #content -->


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

<script type="text/javascript"><!--
var section_row = <?php echo $section_row; ?>;

function addRow() {
	html  = '<tr id="section-row' + section_row + '">';
	
	html += '<td class="text-left">';

	html += '<input type="hidden" name="sellegance_menu_blocks[' + section_row + '][id]" value="' + section_row + '">';

	html += '<div class="form-group">';
	html += '	<label class="col-sm-2 control-label">Block <span class="badge">' + section_row + '</span></label>';
	html += '	<div class="col-sm-10">';
	html += '		<p><div class="btn-group btn-toggle" data-toggle="buttons">';
	
	html += '			<label class="btn btn-success btn-sm active">';
	html += '				<input type="radio" name="sellegance_menu_blocks[' + section_row + '][status]" value="1" checked="checked">ON';
	html += '			</label>';
	html += '			<label class="btn btn-default btn-sm">';
	html += '				<input type="radio" name="sellegance_menu_blocks[' + section_row + '][status]" value="0">OFF';
	html += '			</label>';
	html += '		</div></p>';
	html += '  <p>CSS id: <code>#menu_block' + section_row + '</code></p>';
	html += '	</div>';
	html += '</div>';

	html += '<div class="form-group">';
	html += '	<label class="col-sm-2 control-label">Visibility</label>';
	html += '	<div class="col-sm-10">';
	html += '		<select name="sellegance_menu_blocks[' + section_row + '][visibility]" class="form-control">';
	html += '			<?php foreach ($visibility as $fv => $fc) { ?>';
	html += '				<?php ($fv ==  $menu_block['visibility']) ? $current = 'selected' : $current=''; ?>';
	html += '				<option value="<?php echo $fv; ?>" <?php echo $current; ?> ><?php echo $fc; ?></option>	';
	html += '			<?php } ?>';
	html += '		</select>';
	html += '	</div>';
	html += '</div>';

	html += '<ul id="menu_blocks_' + section_row + '" class="nav nav-tabs">';
	html += '	<?php foreach ($languages as $language) { ?>';
	html += '		<li><a href="#custom_block_' + section_row + '_<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['language_id']; ?>" /> <?php echo $language['name']; ?></a></li>';
	html += '	<?php } ?>';
	html += '</ul>';

	html += '<div class="tab-content">';
	<?php foreach ($languages as $language) { ?>
	html += '	<div id="custom_block_' + section_row + '_<?php echo $language['language_id']; ?>" class="tab-pane">';
	html += '<div class="form-group">';
	html += '  <label class="col-sm-2 control-label"><?php echo $text_title; ?></label><div class="col-sm-10">';
	html += '    <input type="text" name="sellegance_menu_blocks[' + section_row + '][title][<?php echo $language['language_id']; ?>]" id="menu_block_title-' + section_row + '-<?php echo $language['language_id']; ?>" value="" class="form-control">';
	html += '</div></div>';

	html += '<div class="form-group">';
	html += '  <label class="col-sm-2 control-label">URL (optional)</label><div class="col-sm-10">';
	html += '    <input type="text" name="sellegance_menu_blocks[' + section_row + '][url][<?php echo $language['language_id']; ?>]" id="menu_block_url-' + section_row + '-<?php echo $language['language_id']; ?>" value="" class="form-control">';
	html += '</div></div>';

	html += '<div class="form-group">';
	html += '		<label class="col-sm-2 control-label"><?php echo 'Link tag' ?></label>';
	html += '		<div class="col-sm-10">';
	html += '			<div class="row">';
	html += '				<div class="col-sm-3">';
	html += '					<span class="help-block"><?php echo $entry_textcolor_caption; ?></span>';
	html += '					 <input type="text" name="sellegance_menu_blocks[' + section_row + '][tag][<?php echo $language['language_id']; ?>]" id="sellegance_custom_block_tag_<?php echo $language_id; ?>" value="" class="form-control" />';
	html += '				</div>';
	html += '				<div class="col-sm-2">';
	html += '					<span class="help-block"><?php echo $entry_background_caption; ?></span>';
	html += '					<input type="text" name="sellegance_menu_blocks[' + section_row + '][tagcolor][<?php echo $language['language_id']; ?>]" value="" size="6" class="color {required:false,hash:true}" />';
	html += '				</div>';
	html += '			</div>';
	html += '		</div>';
	html += '</div>';

	html += '<div class="form-group">';
	html += '<label class="col-sm-2 control-label"><?php //echo $entry_text; ?></label>';
	html += '<div class="col-sm-10">';
	html += '<textarea name="sellegance_menu_blocks[' + section_row + '][content][<?php echo $language['language_id']; ?>]" id="menu_block_content-' + section_row + '-<?php echo $language['language_id']; ?>" class="summernote form-control" rows="6"></textarea>';
	html += '</div></div></div>';
	<?php } ?>

	html += '</div>';

	html += '</td>';

	html += '<td>';
		html += '<input type="text" name="sellegance_menu_blocks[' + section_row  + '][sort]; ?>]" value="0" class="form-control" />';
	html += '</td>';

	html += '  <td class="text-right"><button type="button" onclick="$(\'#section-row' + section_row  + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
	html += '</tr>';

	$('#menublocks tbody').append(html);

	$('#menu_blocks_' + section_row + ' li:first-child a').tab('show');
	$('#section-row' + section_row + ' .summernote').summernote();
	
	jscolor.init();
	
	section_row++;
}
//--></script>

<script type="text/javascript">

	$(document).ready(function() {

		var link = "<link href='//fonts.googleapis.com/css?family=<?php echo $sellegance_title_font; ?>' id='title_googlefont' rel='stylesheet' type='text/css'>";
				$('head').append(link);
		var link = "<link href='//fonts.googleapis.com/css?family=<?php echo $sellegance_body_font; ?>' id='body_googlefont' rel='stylesheet' type='text/css'>";
				$('head').append(link);
		var link = "<link href='//fonts.googleapis.com/css?family=<?php echo $sellegance_small_font; ?>' id='small_googlefont' rel='stylesheet' type='text/css'>";
				$('head').append(link);

		$('#sellegance_title_font').change(function(){
				$('head #title_googlefont').remove();
				var link = "<link href='//fonts.googleapis.com/css?family="+$(this).val()+"' id='title_googlefont' rel='stylesheet' type='text/css'>";
				$('head').append(link);
				
				var fontname = 	$(this).val().replace(/\+/g," ");
				
				$('#title_font_preview').css("font-family",'"'+fontname+'"');
			
		});

		$('#sellegance_body_font').change(function(){
				$('head #body_googlefont').remove();
				var link = "<link href='//fonts.googleapis.com/css?family="+$(this).val()+"' id='body_googlefont' rel='stylesheet' type='text/css'>";
				$('head').append(link);
				
				var fontname = 	$(this).val().replace(/\+/g," ");
				
				$('#body_font_preview').css("font-family",'"'+fontname+'"');
			
		});

		$('#sellegance_small_font').change(function(){
				$('head #small_googlefont').remove();
				var link = "<link href='//fonts.googleapis.com/css?family="+$(this).val()+"' id='small_googlefont' rel='stylesheet' type='text/css'>";
				$('head').append(link);
				
				var fontname = 	$(this).val().replace(/\+/g," ");
				
				$('#small_font_preview').css("font-family",'"'+fontname+'"');
			
		});
		
		$('.size_select').change(function(){

			var id = $(this).attr('id');

			if (id == 'sellegance_title_font_size' ) { $('#title_font_preview').css("font-size",$(this).val()+'px'); }
			if (id == 'sellegance_body_font_size' ) { $('#body_font_preview').css("font-size",$(this).val()+'px'); }
			if (id == 'sellegance_small_font_size' ) { $('#small_font_preview').css("font-size",$(this).val()+'px'); }
			
		});
	});
</script>

<script type="text/javascript" src="view/javascript/jscolor/jscolor.js"></script> <?php echo $footer; ?>