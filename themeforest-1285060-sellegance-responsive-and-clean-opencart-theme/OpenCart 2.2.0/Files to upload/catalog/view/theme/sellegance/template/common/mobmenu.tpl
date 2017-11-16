<?php 
// menu file for header.tpl
global $language;
if ($language->get('direction')=='rtl') { $position = "navmenu-fixed-right"; }
else { $position = "navmenu-fixed-left"; } ?>

<nav id="mobmenu" class="navbar navbar-default navmenu <?php echo $position; ?> offcanvas offcanvas-sm offcanvas-md hidden-lg" role="navigation">

	<div class="navcontainer">

		<div class="navbar-collapse">

			<ul class="nav navbar-nav">

				<li><a class="closesidebar" onclick="$('#mobmenu').offcanvas('hide');" data-toggle="tooltip" data-placement="left" title="Close"><span class="line-1"></span><span class="line-2"></span><span class="line-3"></span></a></li>

			    <li class="dropdown account-options"><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $text_account; ?> <span class="caret"></span></a>
			      <ul class="dropdown-menu dropdown-menu-right">
			        <?php if ($logged) { ?>
			        <li><a href="<?php echo $account; ?>"><i class="fa fa-user-circle-o"></i> <?php echo $text_account; ?></a></li>
			        <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
			        <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
			        <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
			        <li><a href="<?php echo $logout; ?>"><i class="fa fa-times"></i> <?php echo $text_logout; ?></a></li>
			        <?php } else { ?>
			        <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
			        <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
			        <?php } ?>
							<li><a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>" class="wishlist"><i class="fa fa-heart-o"></i> <span><?php echo $text_wishlist; ?></a></span></li>
			      </ul>
			    </li>

				<!-- Category links -->

					<?php $linkidcount=0; ?>
					
					<?php if ($categories) { ?>
						<?php foreach ($categories as $category) { ?>

							<li id="m<?php echo $linkidcount; ?>" <?php if ($category['children']) { ?> class="dropdown"<?php } ?>>
							<a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
							<?php if ($category['children']) { ?><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><span class="caret"></span></a><?php } ?>
								
							<?php if ($category['children']) { ?>
								<ul class="dropdown-menu">
									<?php if($config->get('sellegance_menu_category_icons')== 1) { ?>
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
												<li id="m<?php echo $linkidcount.$i; ?>" <?php if (($category['children'][$i]['children_level_2']) && ($config->get('sellegance_3rd_level_cat') ==1)) { ?>class="dropdown-submenu" <?php }?>><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a>
													<?php if($config->get('sellegance_3rd_level_cat') ==1) { ?>
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

				<!-- Brands -->

				<?php if($config->get('sellegance_menu_brands')!= 'hidden') { ?>

				<?php $sellegance_brands_tag = $config->get('sellegance_brands_tag'); ?>
				<?php $sellegance_brands_top_title = $config->get('sellegance_brands_top_title'); ?>

					<li class="dropdown brands">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><?php echo !empty($sellegance_brands_top_title[$config->get('config_language_id')]) ? $sellegance_brands_top_title[$config->get('config_language_id')] : $text_menu_brands; ?> <span class="label" style="background:<?php echo $config->get('sellegance_brands_tag_color'); ?>"><?php echo isset($sellegance_brands_tag[$config->get('config_language_id')]) ? $sellegance_brands_tag[$config->get('config_language_id')] :''; ?></span> <span class="caret"></span></a>

						<ul class="dropdown-menu cols-<?php echo $config->get('sellegance_menu_brands_x_row'); ?>"> 
							<?php if (isset($manufacturers) && !empty($manufacturers)) {
							foreach ($manufacturers as $manufacturer) { 
							?>   
								<li class="column-item <?php echo $config->get('sellegance_menu_brands'); ?>">
									<a href="<?php echo $manufacturer['href']; ?>">
									<span class="image"><img src="<?php echo $manufacturer['image']; ?>" title="<?php echo $manufacturer['name']; ?>" alt="<?php echo $manufacturer['name']; ?>" /></span>
									<span class="name"><?php echo $manufacturer['name']; ?></span></a>
								</li>
								<?php }
							} ?>
						</ul>  
					</li>

				<?php } ?>

				<!-- Custom block contents -->

				<?php $sellegance_menu_blocks = $config->get('sellegance_menu_blocks'); ?>

				<?php if(isset($sellegance_menu_blocks)) { ?>

					<?php 
					usort($sellegance_menu_blocks, function($a, $b) {
						return $a['sort'] - $b['sort'];
					});
					?>

					<?php foreach ($sellegance_menu_blocks as $menu_block) { ?>

						<?php if($menu_block['status']==1 && $menu_block['visibility']!='desktop') { ?>

						<li id="menu_block<?php echo $menu_block['id']; ?>" class="menu_block dropdown"><a class="dropdown-toggle" <?php if(!isset($menu_block['content'][$config->get('config_language_id')]) || strip_tags(html_entity_decode($menu_block['content'][$config->get('config_language_id')]))=='' && !empty($menu_block['url'][$config->get('config_language_id')])) { ?>href="<?php echo $menu_block['url'][$config->get('config_language_id')]; ?>"<?php } else { ?>  data-toggle="dropdown" role="button" aria-expanded="false" <?php } ?>><?php echo isset($menu_block['title'][$config->get('config_language_id')]) ? $menu_block['title'][$config->get('config_language_id')] : ''; ?><?php if(isset($menu_block['tag'][$config->get('config_language_id')])) { ?> <span class="label" style="background:<?php echo $menu_block['tagcolor'][$config->get('config_language_id')]; ?>"><?php echo $menu_block['tag'][$config->get('config_language_id')]; ?></span><?php } ?><span class="caret"></span></a>

							<?php if(isset($menu_block['content'][$config->get('config_language_id')]) && strip_tags(html_entity_decode($menu_block['content'][$config->get('config_language_id')]))!='') { ?>

							<ul class="dropdown-menu">
								<li>
								<?php if (!empty($menu_block['url'][$config->get('config_language_id')])) { ?>
									<p>Go to <a href="<?php echo $menu_block['url'][$config->get('config_language_id')]; ?>"><?php echo isset($menu_block['title'][$config->get('config_language_id')]) ? $menu_block['title'][$config->get('config_language_id')] : ''; ?></a></p>
								<?php } ?>
								<?php echo html_entity_decode($menu_block['content'][$config->get('config_language_id')], ENT_QUOTES, 'UTF-8'); ?></li>
							</ul>

							<?php } ?>

						</li>

						<?php } //status ?>

					<?php } //foreach ?>

					<?php } ?>

				<!-- Information pages -->

				<?php if ($config->get('sellegance_menu_infopages')== 'inline') { ?>

					<?php foreach ($informations as $information) { ?>
						<li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
					<?php } ?>

				<?php } else if ($config->get('sellegance_menu_infopages')== 'vertical') { ?>

					<?php $sellegance_infopages_top_title = $config->get('sellegance_infopages_top_title'); ?>
					<?php $sellegance_infopages_tag = $config->get('sellegance_infopages_tag'); ?>

					<li class="dropdown information-pages">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><?php echo !empty($sellegance_infopages_top_title[$config->get('config_language_id')]) ? $sellegance_infopages_top_title[$config->get('config_language_id')] : $text_menu_information; ?> <span class="label" style="background:<?php echo $config->get('sellegance_infopages_tag_color'); ?>"><?php echo isset($sellegance_infopages_tag[$config->get('config_language_id')]) ? $sellegance_infopages_tag[$config->get('config_language_id')] : ''; ?></span> <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<?php foreach ($informations as $information) { ?>
							<li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
							<?php } ?>
						</ul>
					</li>

				<?php } ?>


				<!-- Custom links -->

				<?php $sellegance_menu_link = $config->get('sellegance_menu_link');  ?>

				<?php for ($i = 1; $i <= 9; $i++) { ?>

					<?php if($sellegance_menu_link[$i]['status'] == 1 && $sellegance_menu_link[$i][$config->get('config_language_id')]['url'] !='') { ?>
						<li>
							<a href="<?php echo $sellegance_menu_link[$i][$config->get('config_language_id')]['url']; ?>" target="<?php echo $sellegance_menu_link[$i]['target']; ?>">
							<?php echo $sellegance_menu_link[$i][$config->get('config_language_id')]['title']; ?>
							</a>
						</li>
					<?php } ?>

				<?php } ?>

				<!-- Custom dropdown links -->

				<?php if($config->get('sellegance_menu_dropdown_status')== 1) {

					$sellegance_menu_dropdown_title = $config->get('sellegance_menu_dropdown_title');
					$sellegance_menu_dropdown = $config->get('sellegance_menu_dropdown');
					$sellegance_menu_dropdown_tag = $config->get('sellegance_menu_dropdown_tag');
				?>

					<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><?php echo $sellegance_menu_dropdown_title[$config->get('config_language_id')]; ?> <span class="label" style="background:<?php echo $config->get('sellegance_menu_dropdown_tag_color'); ?>"><?php echo $sellegance_menu_dropdown_tag[$config->get('config_language_id')]; ?></span> <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<?php for ($i = 1; $i <= 9; $i++) { ?>

								<?php if($sellegance_menu_dropdown[$i]['status'] == 1 && $sellegance_menu_dropdown[$i]['url'] !='') { ?>
									<li>
										<a href="<?php echo $sellegance_menu_dropdown[$i]['url']; ?>" target="<?php echo $sellegance_menu_dropdown[$i]['target']; ?>">
										<?php echo $sellegance_menu_dropdown[$i][$config->get('config_language_id')]['title']; ?>
										</a>
									</li>
								<?php } ?>

							<?php } ?>
						</ul>
					</li>

				<?php } ?>

				<li>
					<div class="clearfix browse-options">
						<?php echo $lang; ?>
						<?php echo $currency; ?>
					</div>
				</li>

				<li>
					<?php if ($config->get('sellegance_social_header') == 1) { ?>

						<span class="social">

							<?php

								$sellegance_social = $config->get('sellegance_social');

								if ($sellegance_social) {
									foreach ($sellegance_social as $sv => $sc) {
										if (!empty($sellegance_social[$sv]['url'])) {
											echo '<a href="'.$sellegance_social[$sv]['url'].'" class="fa fa-'.$sellegance_social[$sv]['class'].'" target="'.$sellegance_social[$sv]['target'].'"></a>';
										 ?>
										<?php }
									}
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
								} ?>
							
						</span> <!-- .social -->

					<?php } ?>

			</ul>

		</div>

	</div>

</nav><!-- #navbar -->