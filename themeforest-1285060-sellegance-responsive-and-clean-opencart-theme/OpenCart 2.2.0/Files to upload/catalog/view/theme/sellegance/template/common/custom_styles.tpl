<?php

// values

$topbar_bg = $config->get('sellegance_topbar_background');
$header_bg = $config->get('sellegance_header_background_color');

$topbar_links = $config->get('sellegance_topbar_links');

$header_text = $config->get('sellegance_header_text_color');
$cart_total = $config->get('sellegance_cart_total_color');
$cart_icon = $config->get('sellegance_cart_icon_color');


$menu_accent = $config->get('sellegance_menu_accent');
$menu_color = $config->get('sellegance_menu_color');
$menu_hover = $config->get('sellegance_menu_hover');
$dropdown_color = $config->get('sellegance_dropdown_color');
$dropdown_hover = $config->get('sellegance_dropdown_hover');

$footer_title = $config->get('sellegance_footer_title_color');
$footer_text = $config->get('sellegance_footer_text_color');
$footer_links = $config->get('sellegance_footer_links_color');

$title_color = $config->get('sellegance_title_color');
$content_links = $config->get('sellegance_content_links_color');
$bodybg_color = $config->get('sellegance_background_color'); #
$bodytext_color = $config->get('sellegance_bodytext_color');
$lighttext_color = $config->get('sellegance_lighttext_color');

$btncart_normal = $config->get('sellegance_button_normal_bg');
$btncart_hover = $config->get('sellegance_button_hover_bg');
$btncart_text = $config->get('sellegance_button_text_color');

$btninver_normal = $config->get('sellegance_2button_normal_bg');
$btninver_hover = $config->get('sellegance_2button_hover_bg');
$btninver_text = $config->get('sellegance_2button_text_color');

$onsale_bg = $config->get('sellegance_onsale_background_color');
$onsale_text = $config->get('sellegance_onsale_text_color');
$product_name_color = $config->get('sellegance_product_name_color');
$normal_price = $config->get('sellegance_normal_price_color');
$old_price = $config->get('sellegance_old_price_color');
$new_price = $config->get('sellegance_new_price_color');

$sidebar_active_menu = $config->get('sellegance_categories_active_color');


?>

<?php

	if($config->get('sellegance_skins')!='') {
		
		$base_class .= " ". $config->get('sellegance_skins') . "-skin "; ?>

	<?php }

	$base_class .= " ". $config->get('sellegance_main_layout') . "_layout";

	$regfonts = array('Arial', 'Verdana', 'Helvetica', 'Lucida+Grande', 'Trebuchet+MS', 'Times+New+Roman', 'Tahoma', 'Georgia' );

	if($config->get('sellegance_cyrillic_fonts')==1) $cyrillic='&amp;subset=latin,cyrillic';
	else $cyrillic='';
		
	$sitefonts = array_unique(array($config->get('sellegance_title_font'),$config->get('sellegance_body_font'),$config->get('sellegance_small_font')));

	foreach ($sitefonts as $f) {
		if (($f!='') && (in_array($f, $regfonts)==false)) { ?>
			<link href='//fonts.googleapis.com/css?family=<?php echo $f; ?>:400,300,200,700,800,500<?php echo $cyrillic; ?>&amp;v1' rel='stylesheet' type='text/css' />
	<?php } 
	} ?>

	<style type="text/css" media="screen">

		body {
			
		<?php

		if($config->get('sellegance_custom_image')!='') { ?>
			background-image: url("<?php echo $path_image . $config->get('sellegance_custom_image') ?>"); ?>;
			background-position: top center;
			background-repeat: no-repeat;
		<?php } else if($config->get('sellegance_custom_pattern')!='') { ?>
			background-image: url("<?php echo $path_image . $config->get('sellegance_custom_pattern') ?>"); ?>;
		<?php } else if($config->get('sellegance_pattern_overlay')!='none') { ?>
			background-image: url("catalog/view/theme/sellegance/image/patterns/<?php echo $config->get('sellegance_pattern_overlay'); ?>.png");
		<?php } else { ?>
			background-image: none;
		<?php } ?>

		}

		<?php if ($layout=='normal') { ?>
		body.responsive .container { max-width: 982px !important; }
		<?php } ?>

		<?php if($config->get('sellegance_custom_colors') == 1) { ?>

			<?php if(!empty($bodybg_color)) { ?>
				body {
					background-color: <?php echo $bodybg_color; ?>;
				}
			<?php } ?>
			<?php if(!empty($menu_accent)) { ?>
				.navbar-light #menu .navbar,
				.fullwidth_layout .navbar-light #menu,
				.dark-skin.boxed_layout #cart-total {
					border-top-color: <?php echo $menu_accent; ?>;
				}
				.navbar-transparent #menu .navbar,
				.fullwidth_layout .navbar-transparent #menu {
					border-bottom-color: <?php echo $menu_accent; ?>;
				}
				.navbar-dark #menu .navbar,
				.fullwidth_layout .navbar-dark #menu,
				#menu .topbar {
					background-color: <?php echo $menu_accent; ?>;
				}
				@media only screen and (max-width: 767px) {
					.navbar-inside {
						border-bottom-color: <?php echo $menu_accent; ?>;
					}
				}
			<?php } ?>
			<?php if(!empty($menu_color)) { ?>
				.navbar .nav > li > a,
				.navbar-dark #menu .navbar .nav > li > a {
					color: <?php echo $menu_color; ?>;
				}
			<?php } ?>
			<?php if(!empty($menu_hover)) { ?>
				.navbar .nav > li:hover > a, .navbar .nav > li > a:hover,
				.navbar-dark #menu .navbar .nav > li > a:hover,
				.navbar-dark #menu .navbar .nav > li:hover > a {
					color: <?php echo $menu_hover; ?>;
				}
			<?php } ?>
			<?php if(!empty($dropdown_color)) { ?>
				.navbar .dropdown-menu li>a {
					color: <?php echo $dropdown_color; ?>;
				}
			<?php } ?>
			<?php if(!empty($dropdown_hover)) { ?>
				.navbar .dropdown-menu li>a:hover, .navbar .dropdown-menu li>a:focus, .navbar .dropdown-submenu:hover>a {
					color: <?php echo $dropdown_hover; ?>;
				}
			<?php } ?>
			<?php if(!empty($title_color)) { ?>
				.page-header h1,
				.page-header h1 a {
					color: <?php echo $title_color; ?> !important;
				}
			<?php } ?>
			<?php if(!empty($content_links)) { ?>
				.mainborder a {
					color: <?php echo $content_links; ?>;	
				}
			<?php } ?>
			<?php if(!empty($bodytext_color)) { ?>
				.mainborder, .mainborder .nav-tabs > li > a, .category-list a, .product-page, #continue-shopping {
					color: <?php echo $bodytext_color; ?>;
				}
			<?php } ?>
			<?php if(!empty($lighttext_color)) { ?>
				.breadcrumb, .breadcrumb a, .pagination .results, .product-page .price-tax, .product-page .price .reward {
					color: <?php echo $lighttext_color; ?>;
				}
			<?php } ?>
			<?php if(!empty($footer_text)) { ?>
			#footer, #footer h3 {
				color: <?php echo $footer_text; ?>;
			}
			<?php } ?>
			<?php if(!empty($footer_links)) { ?>
			#footer a, #footer a:link, #footer a:visited {
				color: <?php echo $footer_links; ?>;
			}
			<?php } ?>

			<?php if(!empty($btninver_normal)) { ?>
			.btn-primary,
			a.btn-primary,
			.mainborder a.btn-primary{
				border-color: <?php echo $btninver_normal; ?>;
				color: <?php echo $btninver_normal; ?> !important;
			}
			<?php } ?>
			<?php if(!empty($btninver_hover)) { ?>
			.btn-primary:hover,
			a.btn-primary:hover,
			.btn-primary:focus,
			.btn-primary.focus,
			.btn-primary.active,
			.btn-primary:active,
			.btn-primary:active:hover,
			.btn-primary.active:hover,
			.btn-primary:active:focus,
			.btn-primary.active:focus,
			.btn-primary:active.focus, 
			.btn-primary.active.focus,
			.btn-primary.disabled,
			.btn-primary[disabled] {
				border-color: <?php echo $btninver_hover; ?>;
				color: <?php echo $btninver_hover; ?> !important;
			}
			<?php } ?>

			<?php if(!empty($btncart_normal)) { ?>
				.payment .right .button,
				.btn-cart,
				a.btn-cart,
				.mainborder a.btn-cart,
				#button-confirm {
					border-color: <?php echo $btncart_normal; ?>;
					background-color: <?php echo $btncart_normal; ?>;
					color: <?php echo $btncart_text; ?> !important;
				}
				.wishlist i.fa.fa-heart, .wishlist i.fa.fa-heart-o { color: <?php echo $btncart_normal; ?>;	}
				.owl-controls .owl-page.active span {background-color: <?php echo $btncart_normal; ?>;}
			<?php } ?>
			<?php if(!empty($btncart_hover)) { ?>
			.payment .right .button:hover,
			.payment .right .button:active,
			.payment .right .button:focus,
			.btn-cart:hover,
			.btn-cart:active,
			.btn-cart:focus,
			.btn-cart:active:focus,
			a.btn-cart:hover,
			a.btn-cart:active,
			a.btn-cart:focus,
			#button-confirm:hover {
				border-color: <?php echo $btncart_hover; ?>;
				background-color: <?php echo $btncart_hover; ?>;
				color: <?php echo $btncart_text; ?> !important;
			}
			<?php } ?>


			<?php if(!empty($product_name_color)) { ?>
			.product-thumb .name a,  .product-slider .name a  {
				color: <?php echo $product_name_color; ?>;	
			}
			<?php } ?>
			<?php if(!empty($normal_price)) { ?>
			.product-thumb .price, .product-slider .price, .product-page .price-normal {
				color: <?php echo $normal_price; ?>;	
			}
			<?php } ?>
			<?php if(!empty($old_price)) { ?>
			.price-old {
				color: <?php echo $old_price; ?>;	
			}
			<?php } ?>
			<?php if(!empty($new_price)) { ?>
			.price-new {
				color: <?php echo $new_price; ?>;	
			}
			<?php } ?>
			<?php if(!empty($onsale_bg) || !empty($onsale_text)) { ?>
			.onsale {
				background-color: <?php echo $onsale_bg; ?>;
				color: <?php echo $onsale_text; ?>;
			}
			<?php } ?>
			<?php if(!empty($sidebar_active_menu)) { ?>
			.box-category > ul > li a.active {
				color: <?php echo $sidebar_active_menu; ?>;
			}
			<?php } ?>
	
		<?php  } /* sellegance_custom_colors END */

		if ($config->get('sellegance_zoom_position') == 'inside') { ?>
			.cloud-zoom-big { left:0 !important; }
		<?php }

		if ($config->get('sellegance_quickview_modules') != 1) { ?>
			.content-top .quickview, .content-bottom .quickview { display:none !important; }
		<?php }

		if ($config->get('sellegance_quickview_mobile') != 1) { ?>
			@media only screen and (max-width: 767px) {
				.quickview { display:none !important; }
			}
		<?php }

		if ($config->get('sellegance_quickview_categories') != 1) { ?>
			#content .quickview { display:none !important; }
		<?php }

		if ($config->get('sellegance_show_wishlist') != 1) { ?>
			.wishlist, .wishlist-link { display:none !important; }
		<?php }

		if ($config->get('sellegance_show_compare') != 1) { ?>
			.compare, .product-compare { display:none !important; }
		<?php }

		if ($config->get('sellegance_show_sale_bubble') != 1) { ?>
			.onsale { display:none !important; }
		<?php }

		if ($config->get('sellegance_links_section') != 1) { ?>
			#links { display:none !important; }
		<?php }

		/*body font*/

		if ($config->get('sellegance_body_font') != '' ) {
			$fontpre =  $config->get('sellegance_body_font');
			$font = str_replace("+", " ", $fontpre);
		?>
		body, p, h1, h2, h3, h4, h5, h6, .h1, .h2, .h3, .h4, .h5, .h6, .cart .btn, .btn { 
			font-family: <?php echo $font ?>; 
		}
		body, p { 
			font-size: <?php echo $config->get('sellegance_body_font_size'); ?>px;
		}
		<?php }

		/*title font*/

		if($config->get('sellegance_title_font')!='') {
			$fontpre =  $config->get('sellegance_title_font');
			$font = str_replace("+", " ", $fontpre);
		?>
			h1,
			.tp-button, .tp-button:hover, .tp-button:focus,
			div.tp-caption.bignumbers_white,
			div.tp-caption.light_heavy_70_shadowed {
				font-family:<?php echo $font ?>;
			}
			h1 {
				font-size: <?php echo $config->get('sellegance_title_font_size'); ?>px;
			}
		<?php }

		/*small font*/

		if ($config->get('sellegance_small_font') != '') {
			$fontpre =  $config->get('sellegance_small_font');
			$font = str_replace("+", " ", $fontpre);
		?>
		small, .wishlist a, .compare a, .remove a, .product-compare, .product-filter, .product-filter .display li, .product-list .price-tax, .product-page .price-tax, .product-page .price .reward, .product-page .minimum, .product-page .tags a, .review-date, span.error, #copy, #footer .info, .breadcrumb a, .pagination .results, .help {
			font-family:<?php echo $font ?>;
			font-size: <?php echo $config->get('sellegance_small_font_size'); ?>px;
		}
		<?php } 
		
		if ($config->get('sellegance_custom_css_status') ==1 && $config->get('sellegance_custom_css') != '') { 
			echo htmlspecialchars_decode( $config->get('sellegance_custom_css'), ENT_QUOTES );
		} ?>

	</style>

	<?php if ($config->get('sellegance_custom_stylesheet') == 1) { ?>
		<link rel="stylesheet" type="text/css" href="catalog/view/theme/sellegance/stylesheet/custom.css"  media="screen" />
	<?php } ?>