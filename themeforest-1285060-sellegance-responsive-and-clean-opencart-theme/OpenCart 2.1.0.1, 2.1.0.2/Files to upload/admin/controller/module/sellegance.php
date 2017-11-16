<?php

class ControllerModuleSellegance extends Controller {
    
    private $error = array(); 
    
    public function index() {   
        //Load the language file for this module
        $data['heading_title'] = $this->language->get('heading_title');

        //Set the title from the language file $_['heading_title'] string
        $language = $this->load->language('module/sellegance');
        $this->document->setTitle('Sellegance Theme Options');
        $data = array_merge($data, $language);
        
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
        
		
        $data['text_image_manager'] = 'Image manager';
        $data['token'] = $this->session->data['token'];
        
        $text_strings = array(
            'heading_title',
            'text_enabled',
            'text_disabled',
            'text_content_top',
            'text_content_bottom',
            'text_column_left',
            'text_column_right',
            'entry_status',
            'entry_sort_order',
            'button_save',
            'button_cancel',
        );
        
        foreach ($text_strings as $text) {
            $data[$text] = $this->language->get($text);
        }
        
        $data['modules'] = array();

        // store config data
        
        $config_data = array(

            'sellegance_status',

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

            $this->response->redirect($this->url->link('module/sellegance&submit=true', 'token=' . $this->session->data['token'], 'SSL'));

            //$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
						
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
            'text'      => $this->language->get('text_home'),
            'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );

        $data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_module'),
            'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );
        
        $data['breadcrumbs'][] = array(
            'text'      => $this->language->get('heading_title'),
            'href'      => $this->url->link('module/sellegance', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );
        
        $data['action'] = $this->url->link('module/sellegance', 'token=' . $this->session->data['token'], 'SSL');
        
        $data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
                
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
        $this->response->setOutput($this->load->view('module/sellegance.tpl', $data));
    }
    
    /*
     * 
     * This function is called to ensure that the settings chosen by the admin user are allowed/valid.
     * You can add checks in here of your own.
     * 
     */
    
    private function validate() {
        if (!$this->user->hasPermission('modify', 'module/sellegance')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }
        
        if (!$this->error) {
            return TRUE;
        } else {
            return FALSE;
        }   
    }


}
?>