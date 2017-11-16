<?php
class ControllerExtensionModuleNewsletter extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/module/newsletter');

		$this->document->setTitle(strip_tags($this->language->get('heading_title')));
		
		$this->load->model('setting/module');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && isset($this->request->post['name'])) {

			if ($this->validate()) {
		
			if (!isset($this->request->get['module_id'])) {
				$this->model_setting_module->addModule('newsletter', $this->request->post);
			} else {
				$this->model_setting_module->editModule($this->request->get['module_id'], $this->request->post);
			}
			
			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=module', true));
		}
		
		}
		
		// Global Status setting
		$this->load->model('setting/setting');
		
		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			
			$this->model_setting_setting->editSetting('newsletter', $this->request->post);
						
			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/module/newsletter', 'user_token=' . $this->session->data['user_token'], true));
		}

		
		if (!isset($this->request->get['module_id'])) {
			$data['action_global'] = $this->url->link('extension/module/newsletter', 'user_token=' . $this->session->data['user_token'], true);
		} else {
			$data['action_global'] = $this->url->link('extension/module/newsletter', 'user_token=' . $this->session->data['user_token'] . '&module_id=' . $this->request->get['module_id'], true);
		}
		
		if (isset($this->request->post['newsletter_global_status'])) { 
			$data['newsletter_global_status'] = $this->request->post['newsletter_global_status']; 
		} else { 
			$data['newsletter_global_status'] = $this->config->get('newsletter_global_status');
		}
	
		
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
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'user_token=' . $this->session->data['user_token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_extension'),
			'href' => $this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=module', true)
		);
		
		if (!isset($this->request->get['module_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('extension/module/newsletter', 'user_token=' . $this->session->data['user_token'], true)
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('extension/module/newsletter', 'user_token=' . $this->session->data['user_token'] . '&module_id=' . $this->request->get['module_id'], true)
			);			
		}
		
		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('extension/module/newsletter', 'user_token=' . $this->session->data['user_token'], true);
		} else {
			$data['action'] = $this->url->link('extension/module/newsletter', 'user_token=' . $this->session->data['user_token'] . '&module_id=' . $this->request->get['module_id'], true);
		}
		
		$data['cancel'] = $this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=module', true);
		$data['user_token'] = $this->session->data['user_token'];
		
		
		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_setting_module->getModule($this->request->get['module_id']);
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

		$this->response->setOutput($this->load->view('extension/module/newsletter', $data));
	}
	
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/newsletter')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}
		
		return !$this->error;
	}
	
	
	public function install() {
		$this->db->query("DROP TABLE IF EXISTS " . DB_PREFIX . "newsletter");
		
		$this->db->query("CREATE TABLE IF NOT EXISTS " . DB_PREFIX . "newsletter (
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