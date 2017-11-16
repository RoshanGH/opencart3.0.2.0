<!DOCTYPE html>

<!--[if IE 7]>                  <html class="ie7 no-js" lang="<?php echo $lang; ?>" dir="<?php echo $direction; ?>">     <![endif]-->
<!--[if lte IE 8]>              <html class="ie8 no-js" lang="<?php echo $lang; ?>" dir="<?php echo $direction; ?>">     <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--> <html class="not-ie no-js" lang="<?php echo $lang; ?>" dir="<?php echo $direction; ?>">  <!--<![endif]-->

<head>

	<base href="<?php echo $base; ?>" />

	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<?php 
	
	$layout = $this->config->get('sellegance_responsive_layout');

	if ($layout!='fixed') {
		$base_class = 'responsive';
		($layout=='large') ? $base_class.=' responsive-large' : ''; ?>
		<meta name="viewport" content="width=device-width, initial-scale=1" />
	<?php } else { 
		$base_class = "fixed"; 
	} ?>

	<title><?php echo $title; ?></title>

	<?php if ($description) { ?>
	<meta name="description" content="<?php echo $description; ?>" />
	<?php } ?>
	
	<?php if ($keywords) { ?>
	<meta name="keywords" content="<?php echo $keywords; ?>" />
	<?php } ?>

	<?php if ($icon) { ?>
	<link rel="shortcut icon" href="<?php echo $icon; ?>" />
	<?php } else { ?>
	<link rel="shortcut icon" href="catalog/view/theme/sellegance/favicon.ico">
	<?php } ?>

	<?php foreach ($links as $link) { ?>
	<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
	<?php } ?>

	<?php foreach ($styles as $style) { ?>
	<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
	<?php } ?>

	<link rel="stylesheet" type="text/css" href="catalog/view/theme/sellegance/stylesheet/bootstrap.min.css"/>

	<link rel="stylesheet" type="text/css" href="catalog/view/theme/sellegance/stylesheet/stylesheet.css" media="screen"/>

	<?php if ($layout=='fixed') { ?>
		<link rel="stylesheet" type="text/css" href="catalog/view/theme/sellegance/stylesheet/stylesheet-fixed.css" media="screen"/>
	<?php } else { ?>
		<link rel="stylesheet" type="text/css" href="catalog/view/theme/sellegance/stylesheet/stylesheet-responsive.css" media="screen"/>
	<?php } ?>

	<?php if($direction=='rtl'){?>
	<link rel="stylesheet" type="text/css" href="catalog/view/theme/sellegance/stylesheet/stylesheet.rtl.css" media="screen"/>
	<?php }?>
	
	<link rel="stylesheet" type="text/css" href="catalog/view/theme/sellegance/stylesheet/flexslider.css" media="screen" />

	<?php if ($this->config->get('sellegance_slider') == 'camera') { ?>
	<link rel="stylesheet" type="text/css" href="catalog/view/theme/sellegance/stylesheet/camera.css" media="screen"/>
	<?php } else if ($this->config->get('sellegance_slider') == 'nivoslider') { ?>
	<link rel="stylesheet" type="text/css" href="catalog/view/theme/sellegance/stylesheet/nivo-slider.css" media="screen"/>
	<?php } ?>

	<link rel="stylesheet" type="text/css" href="catalog/view/theme/sellegance/stylesheet/font-awesome.min.css" media="screen"/>

	<!-- css3-mediaqueries.js for IE less than 9 -->
	<!--[if lt IE 9]>
	<script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
	<![endif]-->

	<script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>

	<script type="text/javascript" src="catalog/view/theme/sellegance/js/modernizr.full.min.js"></script>
		
	<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>

	<?php if($this->config->get('slider_general_status') == '1') { ?>
	<link rel="stylesheet" type="text/css" href="catalog/view/theme/sellegance/rs-plugin/css/settings.css" media="screen"/>
	<script type="text/javascript" src="catalog/view/theme/sellegance/rs-plugin/js/jquery.themepunch.tools.min.js"></script>
	<script type="text/javascript" src="catalog/view/theme/sellegance/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
	<?php } ?>

	<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />

	<?php 
	if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') $path_image = $this->config->get('config_ssl') . 'image/';
	else $path_image = $this->config->get('config_url') . 'image/'; 
	?>

	<?php if($this->config->get('sellegance_full_background') == 1) { ?>

		<link rel="stylesheet" type="text/css" href="catalog/view/theme/sellegance/js/supersized/supersized.core.css">
		<script type="text/javascript" src="catalog/view/theme/sellegance/js/supersized/supersized.core.3.2.0.min.js"></script>

		<script type="text/javascript">
		jQuery(function($){
			$.supersized({
				slides:[ {image: '<?php echo $path_image . $this->config->get('sellegance_custom_image') ?>'} ]
			});
		});
		</script>

	<?php } ?>

	<?php $route = (isset($this->request->get['route']) ? ($this->request->get['route']) : ''); ?>

	<?php if ($route!='product/product') { ?>
	<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/colorbox/colorbox.css" media="screen" />
	<script type="text/javascript" src="catalog/view/javascript/jquery/colorbox/jquery.colorbox.js"></script>
	<?php } ?>
	
	<link rel="stylesheet" type="text/css" href="catalog/view/theme/sellegance/stylesheet/magnific-popup.css" media="screen" />
	<script type="text/javascript" src="catalog/view/theme/sellegance/js/jquery.magnific-popup.min.js"></script>

	<script type="text/javascript" src="catalog/view/theme/sellegance/js/jquery.cycle.js"></script>

	<?php foreach ($scripts as $script) { ?>
	<script type="text/javascript" src="<?php echo $script; ?>"></script>
	<?php } ?>

	<?php

	if($this->config->get('sellegance_skins')!='') {
		
		$base_class .= " ". $this->config->get('sellegance_skins') . "_skin "; ?>
		
		<link rel="stylesheet" type="text/css" href="catalog/view/theme/sellegance/stylesheet/<?php echo $this->config->get('sellegance_skins'); ?>.css" media="screen"/>

	<?php }

	$base_class .= " ". $this->config->get('sellegance_main_layout') . "_layout";

	$regfonts = array('Arial', 'Verdana', 'Helvetica', 'Lucida+Grande', 'Trebuchet+MS', 'Times+New+Roman', 'Tahoma', 'Georgia' );

	if($this->config->get('sellegance_cyrillic_fonts')==1) $cyrillic='&amp;subset=latin,cyrillic';
	else $cyrillic='';
		
	$sitefonts = array_unique(array($this->config->get('sellegance_title_font'),$this->config->get('sellegance_body_font'),$this->config->get('sellegance_small_font')));

	foreach ($sitefonts as $f) {
		if (($f!='') && (in_array($f, $regfonts)==false)) { ?>
			<link href='//fonts.googleapis.com/css?family=<?php echo $f; ?>:400,300,200,700,800,500<?php echo $cyrillic; ?>&amp;v1' rel='stylesheet' type='text/css' />
	<?php } 
	} ?>

	<style type="text/css" media="screen">

		body {
			
		<?php

		if($this->config->get('sellegance_custom_image')!='') { ?>
			background-image: url("<?php echo $path_image . $this->config->get('sellegance_custom_image') ?>"); ?>;
			background-position: top center;
			background-repeat: no-repeat;
		<?php } else if($this->config->get('sellegance_custom_pattern')!='') { ?>
			background-image: url("<?php echo $path_image . $this->config->get('sellegance_custom_pattern') ?>"); ?>;
		<?php } else if($this->config->get('sellegance_pattern_overlay')!='none') { ?>
			background-image: url("catalog/view/theme/sellegance/images/patterns/<?php echo $this->config->get('sellegance_pattern_overlay'); ?>.png");
		<?php } else { ?>
			background-image: none;
		<?php } ?>

		}

		<?php if ($layout=='normal') { ?>
		body.responsive .container { max-width: 982px !important; }
		<?php } ?>

		<?php if($this->config->get('sellegance_custom_colors') == 1) { ?>

			body {
				background-color: <?php echo $this->config->get('sellegance_background_color'); ?>;
			}

			.navbar-outside {
				border-bottom-color: <?php echo $this->config->get('sellegance_thickbar_color'); ?>;
			}
			.navbar-inside {
				border-top-color: <?php echo $this->config->get('sellegance_thickbar_color'); ?>;
			}
			@media only screen and (max-width: 767px) {
				.navbar-inside {
					border-bottom-color: <?php echo $this->config->get('sellegance_thickbar_color'); ?>;
				}
			}
			.navbar .nav > li > a {
				color: <?php echo $this->config->get('sellegance_menu_color'); ?>;
			}
			.navbar .nav > li:hover > a, .navbar .nav > li > a:hover {
				color: <?php echo $this->config->get('sellegance_menu_hover'); ?>;
			}
			.dropdown-menu li > a {
				color: <?php echo $this->config->get('sellegance_dropdown_color'); ?>;
			}
			.dropdown-menu li > a:hover, .dropdown-menu li > a:focus, .dropdown-submenu:hover > a {
				<?php $hover_bg = $this->config->get('sellegance_dropdown_hover'); ?>
				background: <?php echo $hover_bg; ?>;
				filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='<?php echo $hover_bg; ?>', endColorstr='<?php echo $hover_bg; ?>', GradientType=0);
			}
			.heading h1 {
				color: <?php echo $this->config->get('sellegance_title_color'); ?> !important;
			}
			.mainborder a {
				color: <?php echo $this->config->get('sellegance_content_links_color'); ?>;	
			}
			.mainborder, .mainborder .nav-tabs > li > a, .category-list a, .product-info, #continue-shopping {
				color: <?php echo $this->config->get('sellegance_bodytext_color'); ?>;
			}
			.breadcrumb, .breadcrumb a, .pagination .results, .product-info .price-tax, .product-info .price .reward {
				color: <?php echo $this->config->get('sellegance_lighttext_color'); ?>;
			}
			#footer, #footer h3 {
				color: <?php echo $this->config->get('sellegance_footer_text_color'); ?>;
			}
			#footer a, #footer a:link, #footer a:visited {
				color: <?php echo $this->config->get('sellegance_footer_links_color'); ?>;
			}
			
			<?php 
			$btncart_normal = $this->config->get('sellegance_button_normal_bg');
			$btncart_hover = $this->config->get('sellegance_button_hover_bg');

			$btninver_normal = $this->config->get('sellegance_2button_normal_bg');
			$btninver_hover = $this->config->get('sellegance_2button_hover_bg');
			?>

			.payment .right .button,
			.cart .btn,
			.btn-cart,
			a.btn-cart,
			.mainborder a.btn-cart,
			#button-confirm {
				border-color: <?php echo $btncart_normal; ?>;
				background-color: <?php echo $btncart_normal; ?>;
				color: <?php echo $this->config->get('sellegance_button_text_color'); ?> !important;
			}
			.payment .right .button:hover,
			.payment .right .button:active,
			.cart .btn:hover,
			.cart .btn:active,
			.btn-cart:hover,
			.btn-cart:active,
			a.btn-cart:hover,
			a.btn-cart:active,
			#button-confirm:hover {
				border-color: <?php echo $btncart_hover; ?>;
				background-color: <?php echo $btncart_hover; ?>;
				color: <?php echo $this->config->get('sellegance_button_text_color'); ?> !important;
			}

			.btn-inverse,
			a.btn-inverse,
			.mainborder a.btn-inverse{
				border-color: <?php echo $btninver_normal; ?>;
				background-color: <?php echo $btninver_normal; ?>;
				color: <?php echo $this->config->get('sellegance_2button_text_color'); ?> !important;
			}
			.btn-inverse:hover,
			a.btn-inverse:hover,
			.btn-inverse:focus,
			.btn-inverse:active,
			.btn-inverse.active,
			.btn-inverse.disabled,
			.btn-inverse[disabled] {
				border-color: <?php echo $btninver_hover; ?>;
				background-color: <?php echo $btninver_hover; ?>;
				color: <?php echo $this->config->get('sellegance_2button_text_color'); ?> !important;
			}

			.grid-box .name a, .product-list .name a, .es-carousel .name a  {
				color: <?php echo $this->config->get('sellegance_product_name_color'); ?>;	
			}
			.grid-box .price, .product-list .price, .es-carousel .price, .product-info .price-normal {
				color: <?php echo $this->config->get('sellegance_normal_price_color'); ?>;	
			}
			.price-old {
				color: <?php echo $this->config->get('sellegance_old_price_color'); ?>;	
			}
			.price-new {
				color: <?php echo $this->config->get('sellegance_new_price_color'); ?>;	
			}
			.onsale {
				background-color: <?php echo $this->config->get('sellegance_onsale_background_color'); ?>;
				color: <?php echo $this->config->get('sellegance_onsale_text_color'); ?>;
			}
			.box-category > ul > li > a {
				color: <?php echo $this->config->get('sellegance_categories_menu_color'); ?>;
			}
			.box-category a {
				color: <?php echo $this->config->get('sellegance_categories_sub_color'); ?>;		
			}
			.box-category > ul > li a.active {
				color: <?php echo $this->config->get('sellegance_categories_active_color'); ?>;
			}
	
		<?php  } /* sellegance_custom_colors END */

		if ($this->config->get('sellegance_zoom_position') == 'inside') { ?>
			.cloud-zoom-big { left:0 !important; }
		<?php }

		if ($this->config->get('sellegance_quickview_modules') != 1) { ?>
			.content-top .quickview, .content-bottom .quickview { display:none !important; }
		<?php }

		if ($this->config->get('sellegance_quickview_categories') != 1) { ?>
			#maincontent .quickview { display:none !important; }
		<?php }

		if ($this->config->get('sellegance_quickview_zoom') != 1) { ?>
			.quickview-box .cloud-zoom-big { display:none !important; }
			.cloud-zoom-lens {background: transparent !important; cursor: default;}
		<?php }

		if ($this->config->get('sellegance_toggle_sidebar') != 1) { ?>
			#toggle_sidebar { display:none !important; }
		<?php }

		if ($this->config->get('sellegance_show_wishlist') != 1) { ?>
			.wishlist, .wishlist-link { display:none !important; }
		<?php }

		if ($this->config->get('sellegance_show_compare') != 1) { ?>
			.compare, .product-compare { display:none !important; }
		<?php }

		if ($this->config->get('sellegance_show_sale_bubble') != 1) { ?>
			.onsale { display:none !important; }
		<?php }

		if ($this->config->get('sellegance_links_section') != 1) { ?>
			#links { display:none !important; }
		<?php }

		if ($this->config->get('sellegance_body_font') != '' ) {
			$fontpre =  $this->config->get('sellegance_body_font');
			$font = str_replace("+", " ", $fontpre);
		?>

		body, p, h1, h2, h3, h4, h5, h6, .h1, .h2, .h3, .h4, .h5, .h6, .cart .button, .button { 
			font-family: <?php echo $font ?>; 
		}
		body, p { 
			font-size: <?php echo $this->config->get('sellegance_body_font_size'); ?>px;
		}

		<?php } 
			if($this->config->get('sellegance_title_font')!='') {
			$fontpre =  $this->config->get('sellegance_title_font');
			$font = str_replace("+", " ", $fontpre);
		?>

		h1 {
			font-family:<?php echo $font ?>;
			font-size: <?php echo $this->config->get('sellegance_title_font_size'); ?>px;
		}
		
		<?php }

		if ($this->config->get('sellegance_small_font') != '') {
			$fontpre =  $this->config->get('sellegance_small_font');
			$font = str_replace("+", " ", $fontpre);
		?>
		small, .wishlist a, .compare a, .remove a, .product-compare, .dropd, .product-filter, .product-filter .display li, .product-list .price-tax, .product-info .price-tax, .product-info .price .reward, .product-info .minimum, .product-info .tags a, .review-date, span.error, #copy, #footer .info, .breadcrumb a, .pagination .results, #welcome, .help, #zoom-image {
			font-family:<?php echo $font ?>;
			font-size: <?php echo $this->config->get('sellegance_small_font_size'); ?>px;
		}
		<?php } 
		
		if ($this->config->get('sellegance_custom_css') != '') { 
			echo htmlspecialchars_decode( $this->config->get('sellegance_custom_css'), ENT_QUOTES );
		} ?>

	</style>

	<?php if ($this->config->get('sellegance_custom_stylesheet') == 1) { ?>
		<link rel="stylesheet" type="text/css" href="catalog/view/theme/sellegance/stylesheet/custom.css"  media="screen" />
	<?php } ?>


	<?php if ($stores) { ?>
		<script type="text/javascript"><!--
		$(document).ready(function() {
		<?php foreach ($stores as $store) { ?>
		$('body').prepend('<iframe src="<?php echo $store; ?>" style="display: none;"></iframe>');
		<?php } ?>
		});
		//--></script>
	<?php } ?>

	<?php echo $google_analytics; ?>

</head>

<body class="<?php echo $base_class; ?>">

	<header id="header">

		<div id="topbar">
			<div class="container">
				<div class="topbar_inner">
					<div class="row">
						<div class="col-sm-6">

							<?php if ($this->config->get('sellegance_social_header') == 1) { ?>

							<div class="social">

								<?php if(($this->config->get('sellegance_facebook_page') != '') && ($this->config->get('sellegance_facebook_icon') == 1)) { ?>
									<a href="https://facebook.com/<?php echo $this->config->get('sellegance_facebook_page'); ?>" class="fa fa-facebook" target="_blank"></a>
								<?php } ?>
								<?php if($this->config->get('sellegance_twitter_username') != '') { ?>
									<a href="https://twitter.com/#!/<?php echo $this->config->get('sellegance_twitter_username'); ?>" class="fa fa-twitter" target="_blank"></a>
								<?php } ?>
								<?php if($this->config->get('sellegance_youtube_username') != '') { ?>
									<a href="https://youtube.com/user/<?php echo $this->config->get('sellegance_youtube_username'); ?>" class="fa fa-youtube" target="_blank"></a>
								<?php } ?>
								<?php if($this->config->get('sellegance_gplus_id') != '') { ?>
									<a href="https://plus.google.com/u/0/<?php echo $this->config->get('sellegance_gplus_id'); ?>" class="fa fa-google-plus" target="_blank"></a>
								<?php } ?>
								<?php if($this->config->get('sellegance_pinterest_id') != '') { ?>
									<a href="https://pinterest.com/<?php echo $this->config->get('sellegance_pinterest_id'); ?>" class="fa fa-pinterest" target="_blank"></a>
								<?php } ?>
								<?php if($this->config->get('sellegance_instagram_username') != '') { ?>
									<a href="https://instagram.com/<?php echo $this->config->get('sellegance_instagram_username'); ?>" class="fa fa-instagram" target="_blank" title="Instagram"></a>
								<?php } ?>
								<?php if($this->config->get('sellegance_tumblr_username') != '') { ?>
									<a href="http://<?php echo $this->config->get('sellegance_tumblr_username'); ?>.tumblr.com" class="fa fa-tumblr" target="_blank"></a>
								<?php } ?>
								<?php if($this->config->get('sellegance_skype_username') != '') { ?>
									<a href="skype:<?php echo $this->config->get('sellegance_skype_username'); ?>?call" class="fa fa-skype" target="_blank"></a>
								<?php } ?>
								
								<?php 
								for ($i=1; $i<=5; $i++) {
								$sellegance_custom_icon_url = $this->config->get('sellegance_custom_icon_url');
								$sellegance_custom_icon_class = $this->config->get('sellegance_custom_icon_class');
								if($sellegance_custom_icon_class[$i] != '') { 
									if($sellegance_custom_icon_url[$i] != '') { 
								?>
									<a href="<?php echo $sellegance_custom_icon_url[$i]; ?>" class="fa <?php echo $sellegance_custom_icon_class[$i]; ?>" target="_blank"></a>
								<?php } else { ?>
									<a class="fa <?php echo $sellegance_custom_icon_class[$i]; ?>"></a>
								<?php }
									}
								}
								?>
								
							</div> <!-- .social -->

							<?php } ?>

							<div id="links" class="hidden-xs">
								<a href="<?php echo $shopping_cart; ?>"><?php echo $text_shopping_cart; ?></a>
								<a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a>
								<a href="<?php echo $account; ?>"><?php echo $text_account; ?></a>
							</div>
						</div>
						<div class="col-sm-6 topbar_right">
							
							<div id="welcome">
								<?php if (!$logged) { ?>
								<?php echo $text_welcome; ?>
								<?php } else { ?>
								<?php echo $text_logged; ?>
								<?php } ?>
							</div>

							<div id="wrapselector">
								<?php echo $language; ?>
								<?php echo $currency; ?>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="container">

			<div class="header_inner">

				<?php $logopos=$this->config->get('sellegance_logo_position'); ?>

				<div class="row <?php echo $logopos;?>logo">

					<div id="logo" class="col-sm-4 <?php if($logopos=='center') echo 'col-sm-push-4';?>">
						<?php if ($logo) { ?>
							<a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
						<?php } else { ?>
							<a href="<?php echo $home; ?>" id="logo-black"><img src="catalog/view/theme/sellegance/images/logo.png" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
						<?php } ?>
					</div> <!-- #logo -->

					<div class="col-sm-4 leftbox <?php if($logopos=='center') echo 'col-sm-pull-4';?>">

						<?php if ($logopos=='left') { ?>

							<div class="input-group">
								<input type="search" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_search; ?>" class="form-control">
								<span class="input-group-btn">
								<button class="btn btn-default btn-search" type="button"><i class="fa fa-search"></i></button>
								</span>
							</div>

						<?php } ?>

						<?php $sellegance_header_info_text = $this->config->get('sellegance_header_info_text'); ?>
						<div class="header_info">
							<?php echo html_entity_decode($sellegance_header_info_text[$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');?>
						</div>

					</div> <!-- .leftbox -->

					<div class="col-sm-4 rightbox">

						<?php if ($logopos=='center') { ?>

						<section id="search" class="search-field">

							<div class="search-trigger"><a href="#"></a></div>
							<div class="search-area">
								<input type="search" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_search; ?>" />
								<button type="button" class="btn btn-default"><i class="fa fa-search"></i></button>
								<div class="search-area-close"><a href="#"></a> </div>
							</div>

						</section>

						<?php } ?>
						
						<?php echo $cart; ?>

					</div> <!-- .rightbox -->

				</div>

			</div>

		</div>

	</header> <!-- #header -->

	<section id="content-wrapper">

		<?php $this->language->load('module/sellegance'); ?>

		<?php 
		($this->config->get('sellegance_select_mobile_menu') == 'selectbox') ? $menumobile='hidden-xs' : $menumobile=''; 
		($this->config->get('sellegance_menu_outside') == 1) ? $menupos='outside' : $menupos='inside'; 
		($this->config->get('sellegance_fullwidth_dropdown_menu') == 1) ? $fulldrop='fullwidth' : $fulldrop='';
		?>

		<div class="container">

			<nav id="menu" class="navbar navbar-default navbar-<?php echo $menupos; ?> <?php echo $menumobile; ?>" role="navigation">

				<div class="navcontainer">
					
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="<?php echo $home; ?>">
						<?php if ($logo) { ?>
							<img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" />
						<?php } else { ?>
							<img src="catalog/view/theme/sellegance/images/logo.png" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" />
						<?php } ?>
						</a>
					</div>

					<div class="navbar-collapse collapse <?php echo $fulldrop; ?>">

						<ul class="nav navbar-nav">

							<!-- Home link -->

							<li class="home home-<?php echo $this->config->get('sellegance_homepage_link_style'); ?>"><a href="<?php echo $home; ?>" title="<?php echo $text_home; ?>"><i class="fa fa-home"></i> <span><?php echo $text_home; ?></span></a></li>

							<!-- Brands -->

							<?php if($this->config->get('sellegance_menu_brands')!= 'hidden') { ?>

							<?php $sellegance_brands_tag = $this->config->get('sellegance_brands_tag'); ?>

								<li class="dropdown brands"><a><?php echo $this->language->get('text_menu_brands'); ?> <span class="label" style="background:<?php echo $this->config->get('sellegance_brands_tag_color'); ?>"><?php echo $sellegance_brands_tag[$this->config->get('config_language_id')]; ?></span></a> 
									<ul class="dropdown-menu cols-<?php echo $this->config->get('sellegance_menu_brands_x_row'); ?>"> 
									
									<?php if ($manufacturers) {
									foreach ($manufacturers as $manufacturer) { 
									?>   
										<li class="column-item <?php echo $this->config->get('sellegance_menu_brands'); ?>">
											<a href="<?php echo $manufacturer['href']; ?>">
											<span class="image"><img src="<?php echo $manufacturer['image']; ?>" title="<?php echo $manufacturer['name']; ?>" alt="<?php echo $manufacturer['name']; ?>" /></span>
											<span class="name"><?php echo $manufacturer['name']; ?></span></a>
										</li>
										<?php }
										} ?>
										
									</ul>  
								</li>

							<?php } ?>

							<!-- Category links -->

							<?php if ($this->config->get('sellegance_menu_categories')=='inline') { ?>

								<?php $linkidcount=0; ?>
								
								<?php if ($categories) { ?>
									<?php foreach ($categories as $category) { ?>

										<li id="m<?php echo $linkidcount; ?>" <?php if ($category['children']) { ?> class="dropdown"<?php } ?>><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
											
										<?php if ($category['children']) { ?>
											<ul class="dropdown-menu">
												<?php if($this->config->get('sellegance_menu_category_icons')== 1) { ?>
													<div class="image">
														<a href="<?php echo $category['href']; ?>"><img src="<?php echo $category['thumb']; ?>" title="<?php echo $category['name']; ?>" alt="<?php echo $category['name']; ?>" /></a>
													</div>
												<?php } ?>
												<?php for ($i = 0; $i < count($category['children']);) { ?>
													<?php if ($category['column'] > 1) { ?>
														<li class="column-menu">
															<ul>
													<?php } ?>
													<?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
													
													<?php for (; $i < $j; $i++) { ?>
														<?php if (isset($category['children'][$i])) { ?>
															<li id="m<?php echo $linkidcount.$i; ?>" <?php if ($category['children'][$i]['children_level_2']) { ?>class="dropdown-submenu" <?php }?>><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a>
																<?php if($this->config->get('sellegance_3rd_level_cat') ==1) { ?>
																	<?php if ($category['children'][$i]['children_level_2']) { ?>
																		  <ul class="dropdown-menu thirdmenu">
																			<?php for ($si = 0; $si < count($category['children'][$i]['children_level_2']); $si++) { ?>
																			   <li><a href="<?php echo $category['children'][$i]['children_level_2'][$si]['href']; ?>"  ><?php echo $category['children'][$i]['children_level_2'][$si]['name']; ?></a></li>
																			<?php } ?>
																		  </ul>
																	<?php } ?>
																<?php } ?>
															</li>
														<?php } ?>
													<?php } ?>

													<?php if ($category['column'] > 1) { ?>
															</ul>
														</li>
													<?php } ?>
												<?php } ?>
											</ul>
										<?php } ?>
										</li>
										<?php $linkidcount++; ?>
									<?php } ?>
								<?php } ?>

							<?php } else if ($this->config->get('sellegance_menu_categories')=='vertical') { ?>

								<?php $linkidcount=0; ?>

								<?php $sellegance_categories_tag = $this->config->get('sellegance_categories_tag'); ?>

								<li class="dropdown"><a><?php echo $this->language->get('text_menu_categories'); ?> <span class="label" style="background:<?php echo $this->config->get('sellegance_categories_tag_color'); ?>"><?php echo $sellegance_categories_tag[$this->config->get('config_language_id')]; ?></span></a>

									<ul class="dropdown-menu">
									<?php if ($categories) { ?>
										<?php foreach ($categories as $category) { ?>
										<li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
										  <?php if ($category['children']) { ?>
											<?php for ($i = 0; $i < count($category['children']);) { ?>
											<ul class="childcats">
											  <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
											  <?php for (; $i < $j; $i++) { ?>
											  <?php if (isset($category['children'][$i])) { ?>
											  <li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a>
													<?php if($this->config->get('sellegance_3rd_level_cat') ==1) { ?>
													<?php if ($category['children'][$i]['children_level_2']) { ?>
													<div>
													  <ul>
														<?php for ($si = 0; $si < count($category['children'][$i]['children_level_2']); $si++) { ?>
														   <li><a href="<?php echo $category['children'][$i]['children_level_2'][$si]['href']; ?>"  ><?php echo $category['children'][$i]['children_level_2'][$si]['name']; ?></a></li>
														<?php } ?>
													  </ul>
													</div>
													<?php } ?>		
													<?php } ?>	  
											  </li>
											  <?php } ?>
											  <?php } ?>
											</ul>
											<?php } ?>
										  <?php } ?>
										</li>
										<?php } ?>
										<?php } ?>
									  </ul>

								 </li>

							<?php } else if ($this->config->get('sellegance_menu_categories')=='table') { ?>

								<?php $sellegance_categories_tag = $this->config->get('sellegance_categories_tag'); ?>

								<li class="dropdown"><a><?php echo $this->language->get('text_menu_categories'); ?> <span class="label" style="background:<?php echo $this->config->get('sellegance_categories_tag_color'); ?>"><?php echo $sellegance_categories_tag[$this->config->get('config_language_id')]; ?></span></a>
									<ul class="dropdown-menu cols-<?php echo $this->config->get('sellegance_menu_categories_x_row'); ?>"> 

										<?php if ($categories) { ?>

											<?php $count=0; ?>

											<?php foreach ($categories as $category) {  ?>

												<?php if($this->config->get('sellegance_menu_categories_x_row') == $count) { ?>
													<li class="clearfix"></li>
												<?php } ?>

												<li class="column-item">
										 
												<?php if($this->config->get('sellegance_menu_category_icons')== 1) { ?>
													<div class="image">
														<a href="<?php echo $category['href']; ?>"><img src="<?php echo $category['thumb']; ?>" title="<?php echo $category['name']; ?>" alt="<?php echo $category['name']; ?>" /></a>
													</div>
												<?php } ?>

												<span class="maincat"><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></span>

												<?php if ($category['children']) { ?>
													<?php for ($i = 0; $i < count($category['children']);) { ?>
													<ul>
														<?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
														<?php for (; $i < $j; $i++) { ?>
															<?php if (isset($category['children'][$i])) { ?>
																<li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a>
																	<?php if($this->config->get('sellegance_3rd_level_cat') ==1) { ?>
																		<?php if ($category['children'][$i]['children_level_2']) { ?>
																		<div>
																			<ul>
																			<?php for ($si = 0; $si < count($category['children'][$i]['children_level_2']); $si++) { ?>
																				<li><a href="<?php echo $category['children'][$i]['children_level_2'][$si]['href']; ?>"  ><?php echo $category['children'][$i]['children_level_2'][$si]['name']; ?></a></li>
																			<?php } ?>
																			</ul>
																		</div>
																		<?php } ?>	
																	<?php } //3rd level menu ?>	 
																</li>
															<?php } ?>
														<?php } ?>
													</ul>
													<?php } ?>
												<?php } ?>

												</li>

												<?php $count++; ?>
											
											<?php } // each category?>
									
										<?php } //if category ?>
									</ul>  
								</li>

							<?php } ?>

							<!-- Custom block contents -->

							<?php if($this->config->get('sellegance_custom_block_status')== 1) {

							$sellegance_custom_block = $this->config->get('sellegance_custom_block');
							$sellegance_custom_block_title = $this->config->get('sellegance_custom_block_title');
							$sellegance_custom_block_link = $this->config->get('sellegance_custom_block_link');
							$sellegance_custom_block_tag = $this->config->get('sellegance_custom_block_tag');

							$cols=0;

							for ($i = 1; $i <= 4; $i++) {
								if($sellegance_custom_block[$i]['status'] == 1) $cols++;
							}

							?>
								
							<li class="dropdown block-contents">
								<a href="<?php echo $sellegance_custom_block_link; ?>"><?php echo $sellegance_custom_block_title[$this->config->get('config_language_id')]; ?> <span class="label" style="background:<?php echo $this->config->get('sellegance_custom_block_tag_color'); ?>"><?php echo $sellegance_custom_block_tag[$this->config->get('config_language_id')]; ?></span></a>

								<?php if($cols>=1) { ?>
								<ul class="dropdown-menu cols-<?php echo $cols; ?>">
									<?php for ($i = 1; $i <= 4; $i++) { ?>
										<?php if($sellegance_custom_block[$i]['status'] == 1) { ?>
											<li class="column-item">
											<?php echo html_entity_decode($sellegance_custom_block[$i][$this->config->get('config_language_id')]['content'], ENT_QUOTES, 'UTF-8');?>
											</li>
										<?php } ?>
									<?php } ?>
								</ul>
								<?php } ?>
							</li>

							<?php } ?>

							<!-- Information pages -->

							<?php if ($this->config->get('sellegance_menu_infopages')== 'inline') { ?>

								<?php foreach ($informations as $information) { ?>
									<li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
								<?php } ?>

							<?php } else if ($this->config->get('sellegance_menu_infopages')== 'vertical') { ?>

								<?php $sellegance_infopages_tag = $this->config->get('sellegance_infopages_tag'); ?>

								<li class="dropdown information-pages"><a><?php echo $this->language->get('text_information'); ?> <span class="label" style="background:<?php echo $this->config->get('sellegance_infopages_tag_color'); ?>"><?php echo $sellegance_infopages_tag[$this->config->get('config_language_id')]; ?></span></a>
									<ul class="dropdown-menu">
										<?php foreach ($informations as $information) { ?>
										<li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
										<?php } ?>
									</ul>
								</li>

							<?php } ?>


							<!-- Custom links -->

							<?php $sellegance_menu_link = $this->config->get('sellegance_menu_link');  ?>

							<?php for ($i = 1; $i <= 9; $i++) { ?>

								<?php if($sellegance_menu_link[$i]['status'] == 1 && $sellegance_menu_link[$i]['url'] !='') { ?>
									<li>
										<a href="<?php echo $sellegance_menu_link[$i]['url']; ?>" target="<?php echo $sellegance_menu_link[$i]['target']; ?>"><?php echo $sellegance_menu_link[$i][$this->config->get('config_language_id')]['title']; ?> <span class="label" style="background:<?php echo $sellegance_menu_link[$i]['tag_color']; ?>"><?php echo $sellegance_menu_link[$i][$this->config->get('config_language_id')]['tag']; ?></span></a>
									</li>
								<?php } ?>

							<?php } ?>

							<!-- Custom dropdown links -->

							<?php if($this->config->get('sellegance_menu_dropdown_status')== 1) {

								$sellegance_menu_dropdown_title = $this->config->get('sellegance_menu_dropdown_title');
								$sellegance_menu_dropdown = $this->config->get('sellegance_menu_dropdown');
								$sellegance_menu_dropdown_tag = $this->config->get('sellegance_menu_dropdown_tag');
							?>

								<li class="dropdown"><a><?php echo $sellegance_menu_dropdown_title[$this->config->get('config_language_id')]; ?> <span class="label" style="background:<?php echo $this->config->get('sellegance_menu_dropdown_tag_color'); ?>"><?php echo $sellegance_menu_dropdown_tag[$this->config->get('config_language_id')]; ?></span></a>
									<ul class="dropdown-menu">
										<?php for ($i = 1; $i <= 9; $i++) { ?>

											<?php if($sellegance_menu_dropdown[$i]['status'] == 1 && $sellegance_menu_dropdown[$i]['url'] !='') { ?>
												<li>
													<a href="<?php echo $sellegance_menu_dropdown[$i]['url']; ?>" target="<?php echo $sellegance_menu_dropdown[$i]['target']; ?>">
													<?php echo $sellegance_menu_dropdown[$i][$this->config->get('config_language_id')]['title']; ?>
													</a>
												</li>
											<?php } ?>

										<?php } ?>
									</ul>
								</li>

							<?php } ?>

						</ul>
						
						<ul class="nav navbar-nav navbar-right">
							
							<section id="sticky-search" class="search-field">
								<div class="search-trigger"><a href="#"></a></div>
								<div class="search-area">
									<input type="search" name="sticky-search" value="<?php echo $search; ?>" placeholder="<?php echo $text_search; ?>" />
									<div class="search-area-close"><a href="#"></a> </div>
								</div>
							</section>
						
							<?php echo $cart; ?>

						</ul>

					</div>

				</div>

			</nav><!-- #navbar -->

			<?php if($this->config->get('sellegance_select_mobile_menu') == 'selectbox') { ?>

				<div id="mobileMenuWrap" class="visible-xs">
					<select name="mobileMenu" id="mobileMenu">
						<option value="">&nbsp;<?php echo $this->language->get('text_mobile_menu'); ?></option>
						<?php foreach ($categories as $category) { ?>
							<option value="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></option>
							<?php if ($category['children']) { ?>
								<?php for ($i = 0; $i < count($category['children']); $i++) { ?>
									<?php if (isset($category['children'][$i])) { ?>
										<option value="<?php echo $category['children'][$i]['href']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category['children'][$i]['name']; ?></option>
									<?php } ?>
								<?php } ?>
							<?php } ?>
						<?php } ?>
					</select>
				</div>

			<?php } ?>
 
		</div>

		<?php if($this->config->get('sellegance_sticky_menu') == 1) { ?>

		<script type="text/javascript">
			var startPosition = 101;
			var contentMargin =  28;

			$(window).scroll(function() {
				if($(window).scrollTop() > startPosition) {
					width = $('.container #menu').width();
					height = $('.container #menu').height();
					$('#menu').addClass('navbar-fixed-top')
					$('#menu .navcontainer').addClass('container')
					$('#cart').addClass('fixed')
				} else {
					$('#menu').removeClass('navbar-fixed-top');
					$('#menu .navcontainer').removeClass('container')
					$('#cart').removeClass('fixed');
				}
			}); 
		</script>

		<?php } ?>

	<div class="centralbox">

		<div class="container">

			<div class="container-inner">

			<?php if ($error) { ?>
				<div class="warning"><?php echo $error ?><img src="catalog/view/theme/sellegance/images/close.png" alt="" class="close" /></div>
			<?php } ?>

			<div id="notification"></div>