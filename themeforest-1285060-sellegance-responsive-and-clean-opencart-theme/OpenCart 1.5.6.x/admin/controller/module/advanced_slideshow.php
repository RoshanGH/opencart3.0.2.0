<?php

class ControllerModuleAdvancedSlideshow extends Controller {
	
	private $error = array(); 
	
	public function index() {   
		//Load the language file for this module
		$language = $this->load->language('module/advanced_slideshow');
        $this->data = array_merge($this->data, $language);

		//Set the title from the language file $_['heading_title'] string
		$this->document->setTitle($this->language->get('heading_title'));

		//Load the settings model. You can also add any other models you want to load here.
		$this->load->model('setting/setting');

		$this->load->model('tool/image'); 
		
		

		// Multistore

		if (isset($this->request->post['store_id'])) {
			$this->data['store_id'] = $this->request->post['store_id'];
		} else {
			$this->data['store_id'] = $this->config->get('aslider_store_id');
		}

		$this->data['stores'] = array();
		
		$this->load->model('setting/store');
		
		$results = $this->model_setting_store->getStores();
		
		$this->data['stores'][] = array(
			'name' => 'Default',
			'href' => '',
			'store_id' => 0
		);
			
		foreach ($results as $result) {
			$this->data['stores'][] = array(
				'name' => $result['name'],
				'href' => $result['url'],
				'store_id' => $result['store_id']
			);
		}		
		
		
		if(isset($_GET['store_id'])) {
		
			$this->data['store_id'] = $_GET['store_id'];
		
		} else {
			
			if (isset($_GET['submit'])) {
		
				$this->data['store_id'] = $this->data['store_id'];
			
			} else {
			
				$this->data['store_id'] = 0;
			
			}

		}
		
		
		$this->data['text_image_manager'] = 'Image manager';
		$this->data['token'] = $this->session->data['token'];		
		
		$text_strings = array(
				'heading_title',
				'text_enabled',
				'text_disabled',
				'text_content_top',
				'text_content_bottom',
				'text_column_left',
				'text_column_right',
				'entry_layout',
				'entry_position',
				'entry_status',
				'entry_sort_order',
				'button_save',
				'button_cancel',
				'button_add_module',
				'button_remove',
		);
		
		foreach ($text_strings as $text) {
			$this->data[$text] = $this->language->get($text);
		}
		
		// store config data
		
		$config_data = array(
			'slider_general_status',
			'slider_height',
			'slider_delay',
			'slider_main_layout',
			'slides_quantity',
			'elements_quantity',
			'shuffle_slides',
			'slider',
		);

		$this->data['slide_conf'] = $this->model_setting_setting->getSetting('advanced_slideshow', $this->data['store_id']);
		
		foreach ($config_data as $conf) {
            if (isset($this->request->post[$conf])) {
                $this->data[$conf] = $this->request->post[$conf];
            } else {
				if(isset($this->data['slide_conf'][$conf])) {
					$this->data[$conf] = $this->data['slide_conf'][$conf];
				} else {
					$this->data[$conf] = false;
				}
			}
            }

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
					
			$this->data['array'] = array(
				'aslider_store_id' => $this->request->post['store_id']
			);

			$this->model_setting_setting->editSetting('advanced_slideshow', $this->request->post, $this->request->post['store_id']);
			
			$this->model_setting_setting->editSetting('aslider_store_id', $this->data['array']);	

			$this->session->data['success'] = $this->language->get('text_success');

			$this->redirect(HTTPS_SERVER . 'index.php?route=module/advanced_slideshow&submit=true&token=' . $this->session->data['token']);
						
        }
	
		//This creates an error message. The error['warning'] variable is set by the call to function validate() in this controller (below)
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		
            if (isset($this->session->data['success'])) {
                $this->data['success'] = $this->session->data['success'];

                unset($this->session->data['success']);
            } else {
                $this->data['success'] = '';
            }
		
		//Set up breadcrumb trail.
  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/advanced_slideshow', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/advanced_slideshow', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');	
								
		$this->load->model('localisation/language');
		$this->data['languages'] = $this->model_localisation_language->getLanguages();

		//Choose which template file will be used to display this request.
		$this->template = 'module/advanced_slideshow.tpl';
		$this->children = array(
			'common/header',
			'common/footer',
		);

		$this->data['no_image'] = $this->model_tool_image->resize('no_image.jpg', 90, 90);
		
		//Send the output.
		$this->response->setOutput($this->render());
	}
	
	/*
	 * 
	 * This function is called to ensure that the settings chosen by the admin user are allowed/valid.
	 * You can add checks in here of your own.
	 * 
	 */
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/advanced_slideshow')) {
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
