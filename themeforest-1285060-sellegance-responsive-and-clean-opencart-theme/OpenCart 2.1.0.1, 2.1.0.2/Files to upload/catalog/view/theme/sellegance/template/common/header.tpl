<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->

<head>
	<meta charset="UTF-8" />
	<base href="<?php echo $base; ?>" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title><?php echo $title; ?></title>

	<?php if ($description) { ?>
	<meta name="description" content="<?php echo $description; ?>" />
	<?php } ?>
	
	<?php if ($keywords) { ?>
	<meta name="keywords" content="<?php echo $keywords; ?>" />
	<?php } ?>

	<?php foreach ($styles as $style) { ?>
	<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
	<?php } ?>

	<?php foreach ($links as $link) { ?>
	<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
	<?php } ?>

	<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
	<link href="catalog/view/theme/sellegance/stylesheet/bootstrap.min.css" rel="stylesheet" media="screen" />
	<script src="catalog/view/theme/sellegance/js/bootstrap.min.js" type="text/javascript"></script>

	<link href="catalog/view/theme/sellegance/stylesheet/jasny-bootstrap.min.css" rel="stylesheet" media="screen" />
	<script src="catalog/view/theme/sellegance/js/jasny-bootstrap.min.js" type="text/javascript"></script>

	<script src="catalog/view/theme/sellegance/js/jquery.browser.min.js" type="text/javascript"></script>
	<link href="catalog/view/theme/sellegance/stylesheet/font-awesome.min.css" rel="stylesheet" type="text/css" />

	<link rel="stylesheet" type="text/css" href="catalog/view/theme/sellegance/stylesheet/stylesheet.css"/>

	<?php
	global $config;
	$layout = $config->get('sellegance_responsive_layout');

	$base_class = 'responsive '.$direction.'_lang';
	($layout=='large') ? $base_class.=' responsive-large' : ''; 
	?>

	<link rel="stylesheet" type="text/css" href="catalog/view/theme/sellegance/stylesheet/stylesheet-responsive.css" media="screen"/>

	<?php if($direction=='rtl'){?>
	<link rel="stylesheet" type="text/css" href="catalog/view/theme/sellegance/stylesheet/stylesheet.rtl.css" media="screen"/>
	<?php }?>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>

	<?php if($config->get('aslider_general_status') == '1') { ?>
	<link rel="stylesheet" type="text/css" href="catalog/view/theme/sellegance/rs-plugin/css/settings.css" media="screen"/>
	<script type="text/javascript" src="catalog/view/theme/sellegance/rs-plugin/js/jquery.themepunch.tools.min.js"></script>
	<script type="text/javascript" src="catalog/view/theme/sellegance/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
	<?php } ?>

	<?php 
	if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') $path_image = $config->get('config_ssl') . 'image/';
	else $path_image = $config->get('config_url') . 'image/'; 
	?>

	<?php if($config->get('sellegance_full_background') == 1) { ?>

		<link rel="stylesheet" type="text/css" href="catalog/view/theme/sellegance/js/supersized/supersized.core.css">
		<script type="text/javascript" src="catalog/view/theme/sellegance/js/supersized/supersized.core.3.2.0.min.js"></script>

		<script type="text/javascript">
		jQuery(function($){
			$.supersized({
				slides:[ {image: '<?php echo $path_image . $config->get('sellegance_custom_image') ?>'} ]
			});
		});
		</script>

	<?php } ?>
	
	<link rel="stylesheet" type="text/css" href="catalog/view/theme/sellegance/stylesheet/magnific-popup.css" media="screen" />
	<script type="text/javascript" src="catalog/view/theme/sellegance/js/jquery.magnific-popup.min.js"></script>

	<script type="text/javascript" src="catalog/view/theme/sellegance/js/jquery.cycle.js"></script>

	<script src="catalog/view/javascript/common.js" type="text/javascript"></script>

	<script src="catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/owl-carousel/owl.carousel.css" media="screen"/>
	<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/owl-carousel/owl.transitions.css" media="screen"/>

	<?php foreach ($scripts as $script) { ?>
	<script type="text/javascript" src="<?php echo $script; ?>"></script>
	<?php } ?>

	<?php include(DIR_TEMPLATE . 'sellegance/template/common/custom_styles.tpl');?>

	<?php foreach ($analytics as $analytic) { ?>
	<?php echo $analytic; ?>
	<?php } ?>

</head>

<?php $lang=$language; ?>

<body class="<?php echo $base_class; ?>">

<?php include(DIR_TEMPLATE . 'sellegance/template/common/mobmenu.tpl');?>

<div class="topcanvas">

	<header id="header">

		<div id="topbar" class="hidden-xs">
			<div class="container">
				<div class="topbar_inner">

					<?php if ($config->get('sellegance_social_header') == 1) { ?>

						<span class="social">

							<?php
								$sellegance_social = $config->get('sellegance_social');

								foreach ($sellegance_social as $sv => $sc) {
									if (!empty($sellegance_social[$sv]['url'])) {
										echo '<a href="'.$sellegance_social[$sv]['url'].'" class="fa fa-'.$sellegance_social[$sv]['class'].'" target="'.$sellegance_social[$sv]['target'].'"></a>';
									 ?>
									<?php }
								}

								$sellegance_custom_icon = $config->get('sellegance_custom_icon');

								for ($i=1; $i<=5; $i++) {
									if($sellegance_custom_icon[$i]['class'] != '') { 
										if($sellegance_custom_icon[$i]['url'] != '') {
											echo '<a href="'.$sellegance_custom_icon[$i]['url'].'" class="fa fa-'.$sellegance_custom_icon[$i]['class'].'" target="'.$sellegance_custom_icon[$i]['target'].'"></a>';
										} else {
											echo '<a class="fa fa-'.$sellegance_custom_icon[$i]['class'].'"></a>';
										}
									} 
								}
								?>
							
						</span> <!-- .social -->

						<?php } ?>

					<div id="top-links" class="nav pull-right hidden-xs">
						<ul class="list-inline">
					    <li class="dropdown"><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle myaccount" data-toggle="dropdown"><i class="fa fa-user-circle-o"></i> <span class="hidden-xs hidden-sm"><?php echo $text_account; ?></span> <span class="caret"></span></a>
								<ul class="dropdown-menu dropdown-menu-right">
									<?php if ($logged) { ?>
									<li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
									<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
									<li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
									<li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
									<li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
									<?php } else { ?>
									<li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
									<li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
									<?php } ?>
									<li class="divider wishlist"></li>
									<li><a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>" class="wishlist"><i class="fa fa-heart-o"></i> <span><?php echo $text_wishlist; ?></a></span></li>
								</ul>
							</li>
							
						</ul>
					</div>

					<div id="wrapselector">
						<?php echo $lang; ?>
						<?php echo $currency; ?>
					</div>

					</div>
				</div>
			</div>

		<?php
		$logopos=$config->get('sellegance_logo_position');
		$searchmode=$config->get('sellegance_searchbox_regular');
		?>

		<div class="container">

			<div class="header_inner <?php echo ($searchmode==1) ? 'searchbox-regular' : 'searchbox-icon'; ?> <?php echo $logopos;?>logo">

				<div class="row">

					<div id="logo" class="col-sm-4 col-xs-6 <?php echo ($logopos=='center') ? 'col-sm-push-4 col-xs-push-3' : ''; ?>">
						<?php if ($logo) { ?>
							<a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
						<?php } else { ?>
							<a href="<?php echo $home; ?>" id="logo"><img src="catalog/view/theme/sellegance/image/logo.png" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
						<?php } ?>
					</div> <!-- #logo -->

					<div class="col-sm-4 col-xs-3 leftbox <?php echo ($logopos=='center') ? 'col-sm-pull-4 col-xs-pull-6' : 'col-sm-pull-0 hidden-xs'; ?>">

						<?php $sellegance_header_text = $config->get('sellegance_header_info_text'); ?>
						<?php if(isset($sellegance_header_text) && strip_tags(html_entity_decode(implode($sellegance_header_text)))!='' && isset($sellegance_header_text[$config->get('config_language_id')])) { ?>
						<div class="header-info owl-carousel <?php echo ($logopos=='center') ? 'hidden-sm' : ''; ?> hidden-xs">
							<?php echo html_entity_decode($sellegance_header_text[$config->get('config_language_id')], ENT_QUOTES, 'UTF-8');?>
						</div>

						<script type="text/javascript"><!--
						$('.header-info').owlCarousel({
							items:6,
							singleItem: true,
							loop: true,
							autoPlay: 3000,
							navigation: false,
							pagination: false,
							transitionStyle: "fade"
						});
						--></script>
						<?php } ?>

						<?php if ($logopos=='center') { ?>
							<button type="button" class="btn btn-menu visible-sm-inline visible-xs-inline" onclick="$('.topcanvas').addClass('canvas-slid');" data-toggle="offcanvas" data-target="#mobmenu" data-disable-scrolling="true" data-modal="true" ><i class="fa fa-bars"></i></button>
						<?php } ?>

					</div> <!-- .leftbox -->

					<div class="col-sm-4 <?php echo ($logopos=='center') ? 'col-xs-3' : 'col-xs-6'; ?> rightbox search-<?php echo $searchmode; ?>">

						<?php if ($logopos=='left') { ?>
							<button type="button" class="btn btn-menu visible-sm-inline visible-xs-inline" onclick="$('.topcanvas').addClass('canvas-slid');" data-toggle="offcanvas" data-target="#mobmenu" data-disable-scrolling="true" data-modal="true" ><i class="fa fa-bars"></i></button>
						<?php } ?>
						
						<?php echo $cart; ?>

						<button type="button" class="search-trigger btn btn-link btn-header">
							<i class="fa fa-search"></i>
						</button>

					</div> <!-- .rightbox -->

				</div>

				<div class="search-area">
					<?php echo $search; ?>
				</div>

			</div>

		</div>

	</header> <!-- #header -->
	<?php 
	($config->get('sellegance_fullwidth_dropdown_menu') == 1) ? $fulldrop='fullwidth' : $fulldrop='';
	$navstyle=$config->get('sellegance_menu_style');
	?>

	<div id="content-wrapper" class="navbar-<?php echo $navstyle; ?>">
		
		<?php include(DIR_TEMPLATE . 'sellegance/template/common/menu.tpl'); ?>

		<?php if($config->get('sellegance_sticky_menu') == 1) { ?>

		<script type="text/javascript">
			var startPosition = 101;
			var contentMargin =  28;

			$(window).scroll(function() {
				if($(window).scrollTop() > startPosition) {
					width = $('.container #menu').width();
					height = $('.container #menu').height();
					$('#menu .navbar').addClass('navbar-fixed-top')
					$('#menu .navcontainer').addClass('container')
					$('#cart').addClass('fixed')
				} else {
					$('#menu .navbar').removeClass('navbar-fixed-top');
					$('#menu .navcontainer').removeClass('container')
					$('#cart').removeClass('fixed');
				}
			}); 
		</script>

		<?php } ?>
