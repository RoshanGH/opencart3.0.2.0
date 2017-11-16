<?php
class ControllerExtensionModuletestimonial extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/module/testimonial');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		$this->load->model('setting/module');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			if (!isset($this->request->get['module_id'])) {
				$this->model_setting_module->addModule('testimonial', $this->request->post);
			} else {
				$this->model_setting_module->editModule($this->request->get['module_id'], $this->request->post);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=module', true));
		}
		
		$data['to_list_link'] = $this->url->link('catalog/testimonial', 'user_token=' . $this->session->data['user_token'], 'true');

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

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/module/testimonial', 'user_token=' . $this->session->data['user_token'], true)
		);

		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('extension/module/testimonial', 'user_token=' . $this->session->data['user_token'], true);
		} else {
			$data['action'] = $this->url->link('extension/module/testimonial', 'user_token=' . $this->session->data['user_token'] . '&module_id=' . $this->request->get['module_id'], true);
		}

		$data['cancel'] = $this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=module', true);

		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_setting_module->getModule($this->request->get['module_id']);
		}

		$data['user_token'] = $this->session->data['user_token'];

		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($module_info)) {
			$data['name'] = $module_info['name'];
		} else {
			$data['name'] = '';
		}
		
		if (isset($this->request->post['testimonial_title'])) {
			$data['testimonial_title'] = $this->request->post['testimonial_title'];
		} elseif (!empty($module_info)) {
			$data['testimonial_title'] = $module_info['testimonial_title'];
		} else {
			$data['testimonial_title'] = '';
		}
		
		
		
		if (isset($this->request->post['testimonial_random'])) {
		$data['testimonial_random'] = $this->request->post['testimonial_random'];
		} elseif (!empty($module_info['testimonial_random'])) {
		$data['testimonial_random'] = $module_info['testimonial_random'];
		} else {

		}
							
		
		if (isset($this->request->post['testimonial_carousel'])) {
			$data['testimonial_carousel'] = $this->request->post['testimonial_carousel'];
		} elseif (!empty($module_info['testimonial_carousel'])) {
			$data['testimonial_carousel'] = $module_info['testimonial_carousel'];
		} else {
			
		}

		if (isset($this->request->post['testimonial_links'])) {
			$data['testimonial_links'] = $this->request->post['testimonial_links'];
		} elseif (!empty($module_info['testimonial_links'])) {
			$data['testimonial_links'] = $module_info['testimonial_links'];
		} else {
			
		}
			
		if (isset($this->request->post['testimonial_columns'])) {
			$data['testimonial_columns'] = $this->request->post['testimonial_columns'];
		} elseif (!empty($module_info)) {
			$data['testimonial_columns'] = $module_info['testimonial_columns'];
		} else {
			$data['testimonial_columns'] = 'grid3';
		}
	
		
		if (isset($this->request->post['testimonial_character_limit'])) {
			$data['testimonial_character_limit'] = $this->request->post['testimonial_character_limit'];
		} elseif (!empty($module_info)) {
			$data['testimonial_character_limit'] = $module_info['testimonial_character_limit'];
		} else {
			$data['testimonial_character_limit'] = 190;
		}
		
		$this->load->model('localisation/language');
		$data['languages'] = $this->model_localisation_language->getLanguages();
		
		if (isset($this->request->post['testimonial_limit'])) {
			$data['testimonial_limit'] = $this->request->post['testimonial_limit'];
		} elseif (!empty($module_info)) {
			$data['testimonial_limit'] = $module_info['testimonial_limit'];
		} else {
			$data['testimonial_limit'] = 5;
		}

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($module_info)) {
			$data['status'] = $module_info['status'];
		} else {
			$data['status'] = '';
		}
		
		
				
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/testimonial', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/testimonial')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		return !$this->error;
	}
	
	public function install() {
		$this->load->model('catalog/testimonial');
		$this->model_catalog_testimonial->createDatabaseTables();
		
		$this->model_user_user_group->addPermission($this->user->getId(), 'access', 'catalog/testimonial');
		$this->model_user_user_group->addPermission($this->user->getId(), 'modify', 'catalog/testimonial');
	}

	public function uninstall() {

		$this->load->model('catalog/testimonial');
		$this->model_catalog_testimonial->dropDatabaseTables();
	}
}
