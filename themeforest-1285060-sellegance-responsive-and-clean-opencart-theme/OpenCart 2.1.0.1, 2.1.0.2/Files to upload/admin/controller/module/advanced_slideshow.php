<?php

class ControllerModuleAdvancedSlideshow extends Controller {
	
	private $error = array(); 
	
	public function index() {   
		//Load the language file for this module

		$data['heading_title'] = $this->language->get('heading_title');

		//Set the title from the language file $_['heading_title'] string
		$language = $this->load->language('module/advanced_slideshow');
		$this->document->setTitle($this->language->get('heading_title'));
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
			$data['store_id'] = $this->config->get('aslider_store_id');
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
				if (isset($this->request->post['store_id'])) {
					$data['store_id'] = $this->request->post['store_id'];
				} else {
					$data['store_id'] = 0;
				}
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
			'aslider_general_status',
			'aslider_height',
			'aslider_delay',
			'aslider_main_layout',
			'aslider_slides_qty',
			'aslider_elements_qty',
			'aslider_shuffle_slides',
			'aslider',
		);

		$data['slide_conf'] = $this->model_setting_setting->getSetting('aslider', $data['store_id']);
		
		foreach ($config_data as $conf) {
			if (isset($this->request->post[$conf])) {
				$data[$conf] = $this->request->post[$conf];
			} else {
				if(isset($data['slide_conf'][$conf])) {
					$data[$conf] = $data['slide_conf'][$conf];
				} else {
					$data[$conf] = false;
				}
			}
		}


		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
					
			$data['array'] = array( 'aslider_store_id' => $this->request->post['store_id'] );

			$this->model_setting_setting->editSetting('aslider_store_id', $data['array']);

			$this->model_setting_setting->editSetting('aslider', $this->request->post, $this->request->post['store_id']);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('module/advanced_slideshow&submit=true', 'token=' . $this->session->data['token'], 'SSL'));
						
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
			'href'      => $this->url->link('module/advanced_slideshow', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);
		
		$data['action'] = $this->url->link('module/advanced_slideshow', 'token=' . $this->session->data['token'], 'SSL');
		
		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		$this->load->model('design/layout');
		
		$data['layouts'] = $this->model_design_layout->getLayouts();

		foreach ($data['languages'] as $language) {
		
			$language_id = $language['language_id'];
			
			// Main banner
			for ($i = 1; $i <= $data['aslider_slides_qty']; $i++) {
				if (isset($data['aslider'][$i][$language_id]['banner']) && $data['aslider'][$i][$language_id]['banner'] != "" && file_exists(DIR_IMAGE . $data['aslider'][$i][$language_id]['banner'])) {
					$data['aslider'][$i][$language_id]['banner_preview'] = $this->model_tool_image->resize($data['aslider'][$i][$language_id]['banner'], 70, 70);
				} else {
					$data['aslider'][$i][$language_id]['banner_preview'] = $this->model_tool_image->resize('no_image.jpg', 70, 70);
				}
			}
			
			// Extra image element
			for ($i = 1; $i <= $data['aslider_slides_qty']; $i++) {
				for ($m = 1; $m <= $data['aslider_elements_qty']; $m++) {
					if (isset($data['aslider'][$i][$language_id][$m]['extra_image']) && $data['aslider'][$i][$language_id][$m]['extra_image'] != "" && file_exists(DIR_IMAGE . $data['aslider'][$i][$language_id][$m]['extra_image'])) {
						$data['aslider'][$i][$language_id][$m]['extra_image_preview'] = $this->model_tool_image->resize($data['aslider'][$i][$language_id][$m]['extra_image'], 70, 70);
					} else {
						$data['aslider'][$i][$language_id][$m]['extra_image_preview'] = $this->model_tool_image->resize('no_image.jpg', 70, 70);
					}
				}
			}

		} //End $language_id

		$data['placeholder'] = $this->model_tool_image->resize('no_image.jpg', 70, 70);		


		//Send the output.
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');


		//Send the output.
		$this->response->setOutput($this->load->view('module/advanced_slideshow.tpl', $data));
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
