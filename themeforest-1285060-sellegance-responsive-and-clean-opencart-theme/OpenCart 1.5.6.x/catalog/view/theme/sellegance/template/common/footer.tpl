					</div> <!-- .container-inner -->

				</div> <!-- .container -->

			</div> <!-- .centralbox -->
		
		</section> <!-- #content_wrapper -->

		<footer id="footer">

			<div class="container">

				<div class="row">

					<div class="column col-sm-2">
						<h3 class="header"><?php echo $text_information; ?></h3>
						<ul class="content">
							<?php $i=1; foreach ($informations as $information) { ?>
							<li id="inf<?php echo $i;?>"><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
							<?php $i++;	} ?>
						</ul>
					</div>

					<div class="column col-sm-2">
						<h3 class="header"><?php echo $text_service; ?></h3>
						<ul class="content">
							<li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
							<li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
							<li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
						</ul>
					</div>

					<div class="column col-sm-2">
						<h3 class="header"><?php echo $text_extra; ?></h3>
							<ul class="content">
								<li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
								<li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
								<li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
								<li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
							</ul>
					</div>

					<div class="column col-sm-2">
						<h3 class="header"><?php echo $text_account; ?></h3>
							<ul class="content">
								<li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
								<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
								<li class="wishlist-link"><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
								<li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
							</ul>
					</div>

					<div class="col-sm-4 contact">

						<?php if ($this->config->get('sellegance_social_footer') == 1) { ?>
						
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
								$icons_html='';$icons_class='';

								for ($i=1; $i<=5; $i++) {

									$sellegance_custom_icon_url = $this->config->get('sellegance_custom_icon_url');
									$sellegance_custom_icon_class = $this->config->get('sellegance_custom_icon_class');
									$sellegance_custom_icon_color = $this->config->get('sellegance_custom_icon_color');
									
									if($sellegance_custom_icon_class[$i] != '') { 

									if ($sellegance_custom_icon_url[$i]!='') {
										$icons_html.='<a href="'.$sellegance_custom_icon_url[$i].'" class="fa '.$sellegance_custom_icon_class[$i].'" target="_blank"></a>';
									} else {
										$icons_html.='<a class="fa '.$sellegance_custom_icon_class[$i].'"></a>';
									}
									$icons_class.= '#footer .'.$sellegance_custom_icon_class[$i].':hover{background:'. $sellegance_custom_icon_color[$i].' !important;}';
									} 
								}
								?>
								<style type="text/css"><?php echo $icons_class; ?></style>
								<?php echo $icons_html; ?>
								
							</div>

						<?php } ?>

						<?php if($this->config->get('sellegance_footer_info_text') != '') { ?>
						<?php $sellegance_footer_info_text = $this->config->get('sellegance_footer_info_text'); ?>
							<div class="footer_info">
								<?php echo html_entity_decode($sellegance_footer_info_text[$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');?>
							</div>
						<?php } ?>

						<?php if(($this->config->get('sellegance_facebook_page') != '') && ($this->config->get('sellegance_facebook_button') == 1)) { ?>
							
							<div id="fb-root"></div>
							<script>(function(d, s, id) {
								var js, fjs = d.getElementsByTagName(s)[0];
								if (d.getElementById(id)) return;
								js = d.createElement(s); js.id = id;
								js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=147552342043457";
								fjs.parentNode.insertBefore(js, fjs);
							}(document, 'script', 'facebook-jssdk'));</script>

							<div class="fb-like-box" data-href="https://www.facebook.com/<?php echo $this->config->get('sellegance_facebook_page'); ?>" data-width="240" data-height="80" data-color-scheme="light" data-show-faces="false" data-border-color="#FFF" data-stream="false" data-header="false"></div>

						<?php } ?>

					</div>

				</div> <!-- .row -->

			</div> <!-- .container -->

		</footer> <!-- #footer -->

		<footer id="footend">

			<div class="container">

				<div class="row">

					<?php if($this->config->get('sellegance_copyright') != '') { ?>
					<?php $sellegance_copyright = $this->config->get('sellegance_copyright'); ?>
						<div id="copy">
							<?php echo html_entity_decode($sellegance_copyright[$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');?>
						</div>
					<?php } else { ?>
						<div id="copy"><?php echo $this->config->get('config_name'); ?> &copy;2012. Powered by <a class="blue" href="http://www.opencart.com">OpenCart</a><br /><a href="http://www.everthemes.com">SELLEGANCE</a> by <a href="http://www.everthemes.com">EVERTHEMES.COM</a>.</div>
					<?php } ?>

				</div> <!-- .row -->

			</div> <!-- .container -->

		</footer> <!-- #footend -->

		<?php $js_path="catalog/view/theme/sellegance/js"; ?>

		<script type="text/javascript" src="<?php echo $js_path; ?>/bootstrap.min.js"></script>
		<script type="text/javascript" src="catalog/view/javascript/jquery/tabs.js"></script>
		<script type="text/javascript" src="catalog/view/javascript/jquery/jquery.total-storage.min.js"></script>
		<script type="text/javascript" src="<?php echo $js_path; ?>/respond.min.js"></script>
		<script type="text/javascript" src="<?php echo $js_path; ?>/jquery.validate.min.js"></script>
		<script type="text/javascript" src="<?php echo $js_path; ?>/jquery.easing-1.3.min.js"></script>
		<script type="text/javascript" src="<?php echo $js_path; ?>/jquery.flexslider.min.js"></script>
		<script type="text/javascript" src="<?php echo $js_path; ?>/cloud-zoom.1.0.3-min.js"></script>
		<?php if ($this->config->get('sellegance_slider') == 'camera') { ?>
		<script type="text/javascript" src="<?php echo $js_path; ?>/jquery.mobile.customized.min.js"></script>
		<script type="text/javascript" src="<?php echo $js_path; ?>/camera.min.js"></script>
		<?php } ?>
		<script type="text/javascript" src="<?php echo $js_path; ?>/jquery.ui.totop.js"></script>
		<script type="text/javascript" src="<?php echo $js_path; ?>/custom.js"></script>

		<?php if ($this->config->get('sellegance_custom_js') != '') { 
			echo htmlspecialchars_decode( $this->config->get('sellegance_custom_js'), ENT_QUOTES );
		} ?>

		<script type="text/javascript">
		<?php if ($this->config->get('sellegance_category_style') == 'list') { ?>
			if (view) {	display(view);	} 
			else { display('list'); }
		<?php } else { ?>
			if (view=='list') {	display(view);	} 
		<?php } ?>
		</script>
		
	</body>

</html>