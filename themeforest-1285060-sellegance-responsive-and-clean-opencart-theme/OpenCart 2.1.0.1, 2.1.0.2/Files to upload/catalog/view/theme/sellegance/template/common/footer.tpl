<?php global $config; ?>
					</div> <!-- .container-inner -->

				</div> <!-- .container -->

			</div> <!-- .centralbox -->
		
		</div> <!-- #content_wrapper -->

		<footer id="footer">

			<div class="container">

				<?php echo $footer_modules ?>

				<div class="container-inner">

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

							<?php if ($config->get('sellegance_social_footer') == 1) { ?>
						
							<div class="social">

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
									
							</div>

						<?php } ?>

							<?php if($config->get('sellegance_footer_info_text') != '') { ?>
							<?php $sellegance_footer_info_text = $config->get('sellegance_footer_info_text'); ?>
							<?php if(isset($sellegance_footer_info_text[$config->get('config_language_id')])) { ?>
								<div class="footer_info">
									<?php echo html_entity_decode($sellegance_footer_info_text[$config->get('config_language_id')], ENT_QUOTES, 'UTF-8');?>
								</div>
							<?php } ?>
							<?php } ?>

							<?php $sellegance_social = $config->get('sellegance_social');

								foreach ($sellegance_social as $sv => $sc) {
									if ($sellegance_social[$sv]['class']=="facebook") {
										$fbpage=$sellegance_social[$sv]['url'];
									 ?>
									<?php }
								} 

								if(!empty($fbpage) && $config->get('sellegance_facebook_widget') == 1) { ?>

									<div id="fb-root"></div>
									<script>(function(d, s, id) {
									  var js, fjs = d.getElementsByTagName(s)[0];
									  if (d.getElementById(id)) return;
									  js = d.createElement(s); js.id = id;
									  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.4&appId=147552342043457";
									  fjs.parentNode.insertBefore(js, fjs);
									}(document, 'script', 'facebook-jssdk'));</script>

									<div class="fb-page" data-href="<?php echo $fbpage; ?>" data-small-header="true" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="false" data-show-posts="false"><div class="fb-xfbml-parse-ignore"></div></div>

								<?php } ?>

						</div>

					</div> <!-- .row -->

				</div>

			</div> <!-- .container -->

		</footer> <!-- #footer -->

		<footer id="footend">

			<div class="container">

				<div class="copy">
					<?php $sellegance_copyright = $config->get('sellegance_copyright'); ?>
					<?php if(isset($sellegance_copyright) && strip_tags(html_entity_decode(implode($sellegance_copyright)))!='') { ?>
						<?php echo html_entity_decode($sellegance_copyright[$config->get('config_language_id')], ENT_QUOTES, 'UTF-8');?>
					<?php } else { ?>
						<?php echo $config->get('config_name'); ?> &copy;2015. Powered by <a class="blue" href="http://www.opencart.com">OpenCart</a>
					<?php } ?>
				</div>

			</div> <!-- .container -->

		</footer> <!-- #footend -->

		</div><!-- .topcanvas -->

		<?php $js_path="catalog/view/theme/sellegance/js"; ?>
		
		<script type="text/javascript" src="<?php echo $js_path; ?>/respond.min.js"></script>
		<script type="text/javascript" src="<?php echo $js_path; ?>/jquery.easing-1.3.min.js"></script>
		<script type="text/javascript" src="<?php echo $js_path; ?>/cloud-zoom.1.0.3-min.js"></script>
		<script type="text/javascript" src="<?php echo $js_path; ?>/jquery.ui.totop.js"></script>
		<script type="text/javascript" src="<?php echo $js_path; ?>/custom.js"></script>

		<?php if ($config->get('sellegance_custom_js_status') ==1 && $config->get('sellegance_custom_js') != '') { 
			echo htmlspecialchars_decode( $config->get('sellegance_custom_js'), ENT_QUOTES );
		} ?>
		
</body></html>