<?php

class ControllerExtensionModuleSellegance extends Controller {
		
	private $error = array(); 
		
	public function index() {   			

		//Set the title from the language file $_['heading_title'] string
		$language = $this->load->language('extension/module/sellegance');

		$this->document->setTitle($this->language->get('heading_title'));
		//$data = array_merge($data, $language);
		
		//Load the settings model. You can also add any other models you want to load here.
		$this->load->model('setting/setting');

		// Multilanguage
		$this->load->model('localisation/language');
		$data['languages'] = $this->model_localisation_language->getLanguages();
		
		$this->load->model('tool/image');    
				
							 
		// Multistore

		if (isset($this->request->post['store_id'])) {
			$data['store_id'] = $this->request->post['store_id'];
		} else {
			$data['store_id'] = $this->config->get('sellegance_store_id');
		}

		$data['stores'] = array();
		
		$this->load->model('setting/store');
		
		$results = $this->model_setting_store->getStores();
		
		$data['stores'][] = array(
			'name' => 'Default',
			'href' => '',
			'store_id' => 0
		);
			
		foreach ($results as $result) {
			$data['stores'][] = array(
				'name' => $result['name'],
				'href' => $result['url'],
				'store_id' => $result['store_id']
			);
		}
		
		
		if(isset($_GET['store_id'])) {
			$data['store_id'] = $_GET['store_id'];
		} else {
			if (isset($_GET['submit'])) {
				$data['store_id'] = $data['store_id'];
			} else {
				$data['store_id'] = 0;
			}
		}

		$data['fonts'] = array(
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
		
		$data['skins'] = array(
			'light'  => 'Default',
			'dark'   => 'Dark'
		);

		$data['product_details'] = array(
			'tabs'      => 'Tabs',
			'accordion' => 'Accordion'
		);
		$data['title_position'] = array(
			'title_top'      => 'Top',
			'title_right' => 'Right'
		);
		$data['sitelayouts'] = array(
			'boxed' => 'Boxed',
			'fullwidth'  => 'Full Width',
			'framed'  => 'Framed'
		);
		$data['visibility'] = array(
			'all'     => 'All',
			'desktop' => 'Desktop',
			'mobile'  => 'Mobiles'
		);
		$data['responsive'] = array(
			'large'  => 'Responsive large (>1200px)',
			'normal' => 'Responsive regular (960px)'
		);
		$data['zoom'] = array(
			'right'  => 'Right',
			'inside' => 'Inside'
		);
		$data['category_style'] = array(
			'grid' => 'Grid',
			'list' => 'List'
		);
		$data['logo_position'] = array(
			'center'  => 'Center',
			'left' => 'Left'
		);
		$data['homepage_link'] = array(
			'icon'  => 'Icon',
			'text' => 'Text',
			'hidden' => 'Don\'t show'
		);
		$data['menu_category_style'] = array(
			'inline'  => 'Inline',
			'table' => 'Dropdown Table',
			'hidden' => 'Don\'t show'
		);
		$data['menu_infopages_style'] = array(
			'inline'  => 'Inline',
			'vertical' => 'Vertical',
			'hidden' => 'Don\'t show'
		);
		$data['menu_brands_style'] = array(
			'logo' => 'Logo',
			'name' => 'Name',
			'logoname' => 'Logo & Name',
			'hidden' => 'Don\'t show'
		);
		$data['menu_target'] = array(
			'_self' => 'Same tab/window',
			'_blank' => 'New tab/window'
		);
		$data['menu_style'] = array(
			'light'  => 'Light',
			'dark' => 'Dark',
			'transparent' => 'Transparent'
		);
		$data['social_media'] = array(
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
				
		$data['text_image_manager'] = 'Image manager';
		$data['user_token'] = $this->session->data['user_token'];
		
		
		$data['modules'] = array();

		// store config data
		
		$config_data = array(

			'module_sellegance_status',

			'sellegance_skins',
			'sellegance_product_details_layout',
			'sellegance_product_title_position',
			'sellegance_main_layout',
			'sellegance_responsive_layout',
			'sellegance_category_style',

			'sellegance_product_columns',
			'sellegance_subcat_status',
			'sellegance_subcat_thumbnails_status',
			'sellegance_subcat_thumb_width',
			'sellegance_subcat_thumb_height',
			'sellegance_rollover_images',

			'sellegance_quickview_categories',
			'sellegance_quickview_modules',
			'sellegance_quickview_zoom',
			'sellegance_quickview_mobile',

			'sellegance_menu_outside',
			'sellegance_menu_style',

			'sellegance_menu_categories',
			'sellegance_menu_categories_visibility',
			'sellegance_menu_category_icons',
			'sellegance_menu_categories_x_row',
			'sellegance_categories_top_title',
			'sellegance_categories_tag',
			'sellegance_categories_tag_color',
			'sellegance_3rd_level_cat',
			
			'sellegance_menu_brands',
			'sellegance_menu_brands_x_row',
			'sellegance_brands_top_title',
			'sellegance_brands_tag',
			'sellegance_brands_tag_color',
			
			'sellegance_sticky_menu',
			'sellegance_fullwidth_dropdown_menu',
			'sellegance_menu_link',
			'sellegance_homepage_link_style',
			'sellegance_menu_dropdown_status',
			'sellegance_menu_dropdown',
			'sellegance_menu_dropdown_title',
			'sellegance_menu_dropdown_tag',
			'sellegance_menu_dropdown_tag_color',

			'sellegance_menu_blocks',

			'sellegance_menu_infopages',
			'sellegance_infopages_top_title',
			'sellegance_infopages_tag',
			'sellegance_infopages_tag_color',

			'sellegance_custom_colors',

			'sellegance_background_color',
			'sellegance_menu_accent',

			'sellegance_title_color',
			'sellegance_bodytext_color',
			'sellegance_lighttext_color',

			'sellegance_menu_color',
			'sellegance_menu_color',
			'sellegance_menu_hover',
			'sellegance_dropdown_color',
			'sellegance_dropdown_hover',

			'sellegance_links_color',

			'sellegance_footer_text_color',
			'sellegance_footer_links_color',
			'sellegance_content_links_color',

			'sellegance_button_normal_bg',
			'sellegance_button_hover_bg',
			'sellegance_button_text_color',

			'sellegance_2button_normal_bg',
			'sellegance_2button_hover_bg',
			'sellegance_2button_text_color',

			'sellegance_product_name_color',
			'sellegance_normal_price_color',
			'sellegance_old_price_color',
			'sellegance_new_price_color',
			'sellegance_onsale_background_color',
			'sellegance_onsale_text_color',

			'sellegance_show_wishlist',
			'sellegance_show_compare',
			'sellegance_show_sale_bubble',

			'sellegance_categories_menu_color',
			'sellegance_categories_sub_color',
			'sellegance_categories_active_color',

			'sellegance_pattern_overlay',
			'sellegance_custom_image',
			'sellegance_custom_pattern',
			'sellegance_image_preview',
			'sellegance_pattern_preview',
			'sellegance_full_background',
			
			'sellegance_title_font',
			'sellegance_title_font_size',
			'sellegance_body_font',
			'sellegance_body_font_size',
			'sellegance_small_font',
			'sellegance_small_font_size',
			'sellegance_cyrillic_fonts',

			'sellegance_featured_carousel',
			'sellegance_bestseller_carousel',
			'sellegance_latest_carousel',
			'sellegance_special_carousel',
			'sellegance_related_carousel',
			'sellegance_ebay_carousel',

			'sellegance_carousel_autoplay',

			'sellegance_social',
			'sellegance_social_header',
			'sellegance_social_footer',
			'sellegance_facebook_widget',
			'sellegance_custom_icon',

			'sellegance_footer_modules',
			'sellegance_footer_info_text',

			'sellegance_payment_logos',
			'sellegance_copyright',

			'sellegance_slider',
			'sellegance_slider_speed',
			'sellegance_slider_transition_time',

			'sellegance_responsive',
			'sellegance_cloud_zoom',
			'sellegance_zoom_position',
			'sellegance_zoom_width',
			'sellegance_zoom_height',
			'sellegance_zoom_autosize',
			'sellegance_subcat_thumbs',
			'sellegance_display_shadows',
			'sellegance_logo_position',
			'sellegance_searchbox_regular',
			'sellegance_search_navbar',
			'sellegance_header_info_text',
			'sellegance_links_section',

			'sellegance_toggle_sidebar',

			'sellegance_custom_stylesheet',
			'sellegance_custom_css',
			'sellegance_custom_css_status',
			'sellegance_custom_js',
			'sellegance_custom_js_status'
		);
				

		$data['sellegance_conf'] = $this->model_setting_setting->getSetting('sellegance', $data['store_id']);
		
		foreach ($config_data as $conf) {
			if (isset($this->request->post[$conf])) {
				$data[$conf] = $this->request->post[$conf];
			} else {
				if(isset($data['sellegance_conf'][$conf])) {
					$data[$conf] = $data['sellegance_conf'][$conf];
				} else {
					$data[$conf] = false;
				}
			}
		}
		

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
					
			$data['array'] = array(
				'sellegance_store_id' => $this->request->post['store_id']
			);

			$this->model_setting_setting->editSetting('sellegance', $this->request->post, $this->request->post['store_id']);	
			
			$this->model_setting_setting->editSetting('sellegance_store_id', $data['array']);	

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/module/sellegance&submit=true', 'user_token=' . $this->session->data['user_token'], 'true'));
		}
	
		//This creates an error message. The error['warning'] variable is set by the call to function validate() in this controller (below)
		if (isset($this->error['warning'])) {
				$data['error_warning'] = $this->error['warning'];
		} else {
				$data['error_warning'] = '';
		}
				
		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}
		
		//Set up breadcrumb trail.
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'user_token=' . $this->session->data['user_token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_extension'),
			'href' => $this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=module', true)
		);
			
		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('extension/module/sellegance', 'user_token=' . $this->session->data['user_token'], true)
		);
			
		$data['action'] = $this->url->link('extension/module/sellegance', 'user_token=' . $this->session->data['user_token'], true);
			
		$data['cancel'] = $this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=module', true);
							
		$this->load->model('design/layout');
			
		$data['layouts'] = $this->model_design_layout->getLayouts();


		if (isset($data['sellegance_custom_pattern']) && $data['sellegance_custom_pattern'] != "" && file_exists(DIR_IMAGE . $data['sellegance_custom_pattern'])) {
			$data['sellegance_pattern_preview'] = $this->model_tool_image->resize($data['sellegance_custom_pattern'], 70, 70);
		} else {
			$data['sellegance_pattern_preview'] = $this->model_tool_image->resize('no_image.jpg', 70, 70);
		}
			
			
		if (isset($data['sellegance_custom_image']) && $data['sellegance_custom_image'] != "" && file_exists(DIR_IMAGE . $data['sellegance_custom_image'])) {
			$data['sellegance_image_preview'] = $this->model_tool_image->resize($data['sellegance_custom_image'], 70, 70);
		} else {
			$data['sellegance_image_preview'] = $this->model_tool_image->resize('no_image.jpg', 70, 70);
		}

		$data['placeholder'] = $this->model_tool_image->resize('no_image.jpg', 70, 70);

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		//Send the output.
		$this->response->setOutput($this->load->view('extension/module/sellegance', $data));
	
	}
	
	/*
	 * 
	 * This function is called to ensure that the settings chosen by the admin user are allowed/valid.
	 * You can add checks in here of your own.
	 * 
	 */
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/sellegance')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return TRUE;
		} else {
			return FALSE;
		}   
	}

	public function install() {

		// Blog

		$sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "blog` ( ";
		$sql .= "`blog_id` int(11) NOT NULL AUTO_INCREMENT, ";
		$sql .= "`allow_comment` int(1) NOT NULL DEFAULT '1', ";
		$sql .= "`count_read` int(11) NOT NULL DEFAULT '0', ";
		$sql .= "`sort_order` int(3) NOT NULL, ";
		$sql .= "`status` int(1) NOT NULL DEFAULT '1', ";
		$sql .= "`author` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL, ";
		$sql .= "`date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00', ";
		$sql .= "`image` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL, ";
		$sql .= "PRIMARY KEY (`blog_id`) ";
		$sql .= ") ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ; ";
		$this->db->query($sql);
		
		$sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "blog_category` ( ";
		$sql .= "`blog_category_id` int(11) NOT NULL AUTO_INCREMENT, ";
		$sql .= "`parent_id` int(11) NOT NULL DEFAULT '0', ";
		$sql .= "`sort_order` int(3) NOT NULL DEFAULT '0', ";
		$sql .= "`date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00', ";
		$sql .= "`status` int(1) NOT NULL DEFAULT '1', ";
		$sql .= "PRIMARY KEY (`blog_category_id`) ";
		$sql .= ") ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=49 ; ";
		$this->db->query($sql);
		
		$sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "blog_category_description` ( ";
		$sql .= "`blog_category_id` int(11) NOT NULL, ";
		$sql .= "`language_id` int(11) NOT NULL, ";
		$sql .= "`name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '', ";
		$sql .= "`page_title` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '', ";
		$sql .= "`meta_keywords` varchar(255) COLLATE utf8_bin NOT NULL, ";
		$sql .= "`meta_description` varchar(255) COLLATE utf8_bin NOT NULL, ";
		$sql .= "`description` text COLLATE utf8_bin NOT NULL, ";
		$sql .= "PRIMARY KEY (`blog_category_id`,`language_id`), ";
		$sql .= "KEY `name` (`name`) ";
		$sql .= ") ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin; ";
		$this->db->query($sql);
		
		$sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "blog_category_to_layout` ( ";
		$sql .= "`blog_category_id` int(11) NOT NULL, ";
		$sql .= "`store_id` int(11) NOT NULL, ";
		$sql .= "`layout_id` int(11) NOT NULL, ";
		$sql .= "PRIMARY KEY (`blog_category_id`,`store_id`) ";
		$sql .= ") ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin; ";
		$this->db->query($sql);
		
		$sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "blog_category_to_store` ( ";
		$sql .= "`blog_category_id` int(11) NOT NULL, ";
		$sql .= "`store_id` int(11) NOT NULL, ";
		$sql .= "PRIMARY KEY (`blog_category_id`,`store_id`) ";
		$sql .= ") ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin; ";
		$this->db->query($sql);
		
		$sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "blog_comment` ( ";
		$sql .= "`blog_comment_id` int(11) NOT NULL AUTO_INCREMENT, ";
		$sql .= "`blog_id` int(11) NOT NULL DEFAULT '0', ";
		$sql .= "`name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL, ";
		$sql .= "`email` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL, ";
		$sql .= "`comment` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL, ";
		$sql .= "`date_added` datetime DEFAULT '0000-00-00 00:00:00', ";
		$sql .= "`status` int(1) NOT NULL DEFAULT '1', ";
		$sql .= "PRIMARY KEY (`blog_comment_id`) ";
		$sql .= ") ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ; ";
		$this->db->query($sql);
		
		$sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "blog_description` ( ";
		$sql .= "`blog_id` int(11) NOT NULL, ";
		$sql .= "`language_id` int(11) NOT NULL, ";
		$sql .= "`title` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL, ";
		$sql .= "`page_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL, ";
		$sql .= "`meta_keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL, ";
		$sql .= "`meta_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL, ";
		$sql .= "`short_description` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL, ";
		$sql .= "`description` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL, ";
		$sql .= "`tags` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL ";
		$sql .= ") ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin; ";
		$this->db->query($sql);
		
		$sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "blog_related` ( ";
		$sql .= "`parent_blog_id` int(11) NOT NULL DEFAULT '0', ";
		$sql .= "`child_blog_id` int(11) NOT NULL DEFAULT '0' ";
		$sql .= ") ENGINE=MyISAM DEFAULT CHARSET=latin1; ";
		$this->db->query($sql);
		
		$sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "blog_to_category` ( ";
		$sql .= "`blog_id` int(11) NOT NULL, ";
		$sql .= "`blog_category_id` int(11) NOT NULL, ";
		$sql .= "PRIMARY KEY (`blog_id`,`blog_category_id`) ";
		$sql .= ") ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin; ";
		$this->db->query($sql);
		
		$sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "blog_to_layout` ( ";
		$sql .= "`blog_id` int(11) NOT NULL, ";
		$sql .= "`store_id` int(11) NOT NULL, ";
		$sql .= "`layout_id` int(11) NOT NULL, ";
		$sql .= "PRIMARY KEY (`blog_id`,`store_id`) ";
		$sql .= ") ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin; ";
		$this->db->query($sql);
		
		$sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "blog_related_products` ( ";
		$sql .= "`blog_id` int(11) NOT NULL, ";
		$sql .= "`related_id` int(11) NOT NULL, ";
		$sql .= "PRIMARY KEY (`blog_id`,`related_id`) ";
		$sql .= ") ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin; ";
		$this->db->query($sql);
		
		$sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "blog_to_store` ( ";
		$sql .= "`blog_id` int(11) NOT NULL, ";
		$sql .= "`store_id` int(11) NOT NULL ";
		$sql .= ") ENGINE=MyISAM DEFAULT CHARSET=latin1; ";
		$this->db->query($sql);
		
		$sql  = "INSERT INTO  `" . DB_PREFIX . "layout` ( `layout_id` , `name` ) VALUES ( NULL , 'Blog' ); ";
		$query = $this->db->query( $sql );
			
		$id = $this->db->getLastId();
			
		$sql = "INSERT INTO `".DB_PREFIX."layout_route` (
					`layout_route_id` ,
					`layout_id` ,
					`store_id` ,
					`route`
					)
					VALUES (
					NULL , '".$id."', '0', 'blog/%');
			";
			$query = $this->db->query( $sql );

		// Newsletter

		$this->db->query("CREATE TABLE IF NOT EXISTS " . DB_PREFIX . "newsletter (
				email varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '', 
				PRIMARY KEY (`email`)
			) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin
		");
		
		$this->load->model('user/user_group');

		$this->model_user_user_group->addPermission($this->user->getId(), 'access', 'extension/newsletter');
		$this->model_user_user_group->addPermission($this->user->getId(), 'modify', 'extension/newsletter');

		// Testimonial

		$this->load->model('catalog/testimonial');
		$this->model_catalog_testimonial->createDatabaseTables();
		
		$this->model_user_user_group->addPermission($this->user->getId(), 'access', 'catalog/testimonial');
		$this->model_user_user_group->addPermission($this->user->getId(), 'modify', 'catalog/testimonial');
	}

}
?>