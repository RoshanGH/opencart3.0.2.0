<?php
class ControllerModuleNewsletter extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('module/newsletter');

		$this->document->setTitle(strip_tags($this->language->get('heading_title')));
		
		$this->load->model('extension/module');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && isset($this->request->post['name'])) {

			if ($this->validate()) {
		
			if (!isset($this->request->get['module_id'])) {
				$this->model_extension_module->addModule('newsletter', $this->request->post);
			} else {
				$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
			}
			
			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'true'));
		}
		
		}
		
		// Global Status setting
		$this->load->model('setting/setting');
		
		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			
			$this->model_setting_setting->editSetting('newsletter', $this->request->post);
						
			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('module/newsletter', 'token=' . $this->session->data['token'], 'true'));
		}

		
		if (!isset($this->request->get['module_id'])) {
			$data['action_global'] = $this->url->link('module/newsletter', 'token=' . $this->session->data['token'], 'true');
		} else {
			$data['action_global'] = $this->url->link('module/newsletter', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'true');
		}
		
		if (isset($this->request->post['newsletter_global_status'])) { 
			$data['newsletter_global_status'] = $this->request->post['newsletter_global_status']; 
		} else { 
			$data['newsletter_global_status'] = $this->config->get('newsletter_global_status');
		}
		//
		
		
		$data['heading_title'] = $this->language->get('heading_title');
	
		$data['entry_status'] = $this->language->get('entry_status');
		
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled']	= $this->language->get('text_enabled');
		$data['text_disabled']	= $this->language->get('text_disabled');

		$data['tab_general'] = $this->language->get('tab_general');
		
		$data['entry_name'] = $this->language->get('entry_name');
		$data['warning_off'] = $this->language->get('warning_off');
		$data['button_save_global'] = $this->language->get('button_save_global');
		
		$data['heading_global'] = $this->language->get('heading_global');
		$data['heading_popup'] = $this->language->get('heading_popup');
		
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		
 		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		
		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}
		
  		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'true')
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'true')
   		);
		
		if (!isset($this->request->get['module_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('module/newsletter', 'token=' . $this->session->data['token'], 'true')
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('module/newsletter', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'true')
			);			
		}
		
		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('module/newsletter', 'token=' . $this->session->data['token'], 'true');
		} else {
			$data['action'] = $this->url->link('module/newsletter', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'true');
		}
		
		
		
		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'true');
		$data['token'] = $this->session->data['token'];
		
		
		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}
		
		
		// Module wide setting
		
		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($module_info)) {
			$data['status'] = $module_info['status'];
		} else {
			$data['status'] = '';
		}
		
		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($module_info)) {
			$data['name'] = $module_info['name'];
		} else {
			$data['name'] = '';
		}
		
		$this->load->model('localisation/language');
		$data['languages'] = $this->model_localisation_language->getLanguages();
		
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/newsletter', $data));
	}
	
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/newsletter')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}
		
		return !$this->error;
	}
	
	
	public function install() {
		$this->db->query("DROP TABLE IF EXISTS " . DB_PREFIX . "newsletter");
		
		$this->db->query("CREATE TABLE " . DB_PREFIX . "newsletter (
				email varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '', 
				PRIMARY KEY (`email`)
			) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin
		");
	
		$this->load->model('user/user_group');

		$this->model_user_user_group->addPermission($this->user->getId(), 'access', 'extension/newsletter');
		$this->model_user_user_group->addPermission($this->user->getId(), 'modify', 'extension/newsletter');
	}
	
	public function uninstall() {
		$this->db->query("DROP TABLE IF EXISTS " . DB_PREFIX . "newsletter");
	}
}