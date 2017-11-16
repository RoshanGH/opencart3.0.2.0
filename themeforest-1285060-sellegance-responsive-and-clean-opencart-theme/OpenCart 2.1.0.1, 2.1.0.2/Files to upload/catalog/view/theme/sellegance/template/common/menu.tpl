<?php // menu file for header.tpl ?>

<div id="menu">

	<div class="container">

		<nav class="navbar navbar-default hidden-sm hidden-xs" role="navigation">

			<div class="navcontainer">

				<div class="navbar-header">
					<a class="navbar-brand" href="<?php echo $home; ?>">
					<?php if ($logo) { ?>
						<img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" />
					<?php } else { ?>
						<img src="catalog/view/theme/sellegance/image/logo.png" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" />
					<?php } ?>
					</a>
				</div>

				<div class="navbar-collapse <?php echo $fulldrop; ?>">

					<ul class="nav navbar-nav">

						<!-- Home link -->

						<li class="home home-<?php echo $config->get('sellegance_homepage_link_style'); ?>"><a href="<?php echo $home; ?>" title="<?php echo $text_home; ?>"><i class="fa fa-home"></i> <span><?php echo $text_home; ?></span></a></li>

						<!-- Category links -->
						
						<?php if($config->get('sellegance_menu_categories_visibility')!='mobile') { ?>

						<?php if ($config->get('sellegance_menu_categories')=='inline') { ?>

							<?php $linkidcount=0; ?>
							
							<?php if ($categories) { ?>
								<?php foreach ($categories as $category) { ?>

									<li id="m<?php echo $linkidcount; ?>" <?php if ($category['children']) { ?> class="dropdown"<?php } ?>><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
										
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

						<?php } else if ($config->get('sellegance_menu_categories')=='vertical') { ?>

							<?php $linkidcount=0; ?>

							<?php $sellegance_categories_tag = $config->get('sellegance_categories_tag'); ?>
							<?php $sellegance_categories_top_title = $config->get('sellegance_categories_top_title'); ?>

							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
								<?php echo !empty($sellegance_categories_top_title[$config->get('config_language_id')]) ? $sellegance_categories_top_title[$config->get('config_language_id')] : $text_menu_categories; ?> <span class="label" style="background:<?php echo $config->get('sellegance_categories_tag_color'); ?>"><?php echo isset($sellegance_categories_tag[$config->get('config_language_id')]) ? $sellegance_categories_tag[$config->get('config_language_id')] : ''; ?></span></a>

								<ul class="dropdown-menu">
								<?php if ($categories) { ?>
									<?php foreach ($categories as $category) { ?>
									<li <?php if ($category['children']) { ?>class="dropdown"<?php } ?>>
										<a href="<?php echo $category['href']; ?>" ><?php echo $category['name']; ?></a>
									  <?php if ($category['children']) { ?>
										<?php for ($i = 0; $i < count($category['children']);) { ?>
										<ul class="childcats">
										  <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
										  <?php for (; $i < $j; $i++) { ?>
										  <?php if (isset($category['children'][$i])) { ?>
											  <li <?php if (($category['children'][$i]['children_level_2']) && ($config->get('sellegance_3rd_level_cat') ==1)) { ?>class="dropdown-submenu" <?php }?>><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a>
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
										</ul>
										<?php } ?>
									  <?php } ?>
									</li>
									<?php } ?>
									<?php } ?>
								  </ul>

							 </li>

						<?php } else if ($config->get('sellegance_menu_categories')=='table') { ?>

							<?php $sellegance_categories_tag = $config->get('sellegance_categories_tag'); ?>
							<?php $sellegance_categories_top_title = $config->get('sellegance_categories_top_title'); ?>

							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><?php echo !empty($sellegance_categories_top_title[$config->get('config_language_id')]) ? $sellegance_categories_top_title[$config->get('config_language_id')] : $text_menu_categories; ?> <span class="label" style="background:<?php echo $config->get('sellegance_categories_tag_color'); ?>"><?php echo isset($sellegance_categories_tag[$config->get('config_language_id')]) ? $sellegance_categories_tag[$config->get('config_language_id')] : ''; ?></span></a>
								<ul class="dropdown-menu cols-<?php echo $config->get('sellegance_menu_categories_x_row'); ?>"> 

									<?php if ($categories) { ?>

										<?php $count=0; ?>

										<?php foreach ($categories as $category) {  ?>

											<?php if($count>0 && ($count % $config->get('sellegance_menu_categories_x_row')) == 0) { ?>
												<li class="clearfix"></li>
											<?php } ?>

											<li class="column-item">
									 
											<?php if($config->get('sellegance_menu_category_icons')== 1) { ?>
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
																<li <?php if (($category['children'][$i]['children_level_2']) && ($config->get('sellegance_3rd_level_cat') ==1)) { ?>class="dropdown-submenu" <?php }?>><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a>
																	<?php if($config->get('sellegance_3rd_level_cat') ==1) { ?>
																	<?php if ($category['children'][$i]['children_level_2']) { ?>
																			<ul class="dropdown-menu thirdmenu">
																		<?php for ($si = 0; $si < count($category['children'][$i]['children_level_2']); $si++) { ?>
																			<li><a href="<?php echo $category['children'][$i]['children_level_2'][$si]['href']; ?>"  ><?php echo $category['children'][$i]['children_level_2'][$si]['name']; ?></a></li>
																		<?php } ?>
																		</ul>
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

						<?php } ?>

						<!-- Brands -->

						<?php if($config->get('sellegance_menu_brands')!= 'hidden') { ?>

						<?php $sellegance_brands_tag = $config->get('sellegance_brands_tag'); ?>
						<?php $sellegance_brands_top_title = $config->get('sellegance_brands_top_title'); ?>

							<li class="dropdown brands">
								<a><?php echo !empty($sellegance_brands_top_title[$config->get('config_language_id')]) ? $sellegance_brands_top_title[$config->get('config_language_id')] : $text_menu_brands; ?> <span class="label" style="background:<?php echo $config->get('sellegance_brands_tag_color'); ?>"><?php echo isset($sellegance_brands_tag[$config->get('config_language_id')]) ? $sellegance_brands_tag[$config->get('config_language_id')] :''; ?></span></a>

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

						<!-- Menu block contents -->

						<?php $sellegance_menu_blocks = $config->get('sellegance_menu_blocks'); ?>

						<?php if(isset($sellegance_menu_blocks)) { ?>

							<?php foreach ($sellegance_menu_blocks as $menu_block) { ?>

								<?php if($menu_block['status']==1 && $menu_block['visibility']!='mobile') { ?>

								<li id="menu_block<?php echo $menu_block['id']; ?>" class="menu_block dropdown <?php //echo $visibility; ?>"><a <?php echo !empty($menu_block['url'][$config->get('config_language_id')]) ? 'href="'.$menu_block['url'][$config->get('config_language_id')].'"' : ''; ?>><?php echo isset($menu_block['title'][$config->get('config_language_id')]) ? $menu_block['title'][$config->get('config_language_id')] : ''; ?><?php if(isset($menu_block['tag'][$config->get('config_language_id')])) { ?> <span class="label" style="background:<?php echo $menu_block['tagcolor'][$config->get('config_language_id')]; ?>"><?php echo $menu_block['tag'][$config->get('config_language_id')]; ?></span><?php } ?>
								</a>

								<?php if(isset($menu_block['content'][$config->get('config_language_id')]) && strip_tags(html_entity_decode($menu_block['content'][$config->get('config_language_id')]))!='') { ?>

									<ul class="dropdown-menu">
										<li>
										<?php echo html_entity_decode($menu_block['content'][$config->get('config_language_id')], ENT_QUOTES, 'UTF-8'); ?>
										</li>
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
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
								<?php echo !empty($sellegance_infopages_top_title[$config->get('config_language_id')]) ? $sellegance_infopages_top_title[$config->get('config_language_id')] : $text_menu_information; ?> <span class="label" style="background:<?php echo $config->get('sellegance_infopages_tag_color'); ?>"><?php echo isset($sellegance_infopages_tag[$config->get('config_language_id')]) ? $sellegance_infopages_tag[$config->get('config_language_id')] : ''; ?></span></a>

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

							<?php if($sellegance_menu_link[$i]['status'] == 1 && isset($sellegance_menu_link[$i][$config->get('config_language_id')]['url'])) { ?>
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

							<li class="dropdown"><a><?php echo $sellegance_menu_dropdown_title[$config->get('config_language_id')]; ?> <span class="label" style="background:<?php echo $config->get('sellegance_menu_dropdown_tag_color'); ?>"><?php echo $sellegance_menu_dropdown_tag[$config->get('config_language_id')]; ?></span></a>
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

					</ul>

					<?php if ($config->get('sellegance_sticky_menu')==1) { ?>
					<ul class="nav navbar-nav navbar-right">
						<?php echo $cart; ?>
					</ul>
					<?php } ?>

				</div>

			</div>

		</nav><!-- #navbar -->

		<div class="topbar visible-sm visible-xs"></div>

	</div>

</div>