<?php  
class ControllerExtensionModuleNewsletter extends Controller {
	public function index($setting) {
		
		static $module = 0;
		$this->load->language('extension/module/newsletter');
		
    $data['heading_title'] = $this->language->get('heading_title1');
		$data['text_email'] = $this->language->get('text_email1');
		$data['entry_email'] = $this->language->get('entry_email1');
		$data['button_join'] = $this->language->get('button_join');
		
		$this->load->model('localisation/language');
		
		if(empty($setting['block'][$this->config->get('config_language_id')])) {
			$data['block'] = false;
		} else if (isset($setting['block'][$this->config->get('config_language_id')])) {
			$data['block'] = html_entity_decode($setting['block'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
		}
		
		$data['module'] = $module++;

		return $this->load->view('extension/module/newsletter', $data);
	}
	
	public function unsubscribe() {
		if (isset($this->request->get['id'])) {
			$this->load->language('extension/module/newsletter');
			
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "newsletter WHERE md5(CONCAT('newsletter', email)) = '" . $this->db->escape($this->request->get['id']) . "'");
			
			$query1 = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer WHERE md5(CONCAT('newsletter', email)) = '" . $this->db->escape($this->request->get['id']) . "'");

			if ($query->num_rows) {
				$this->db->query("DELETE FROM " . DB_PREFIX . "newsletter WHERE email = '" . $this->db->escape($query->row['email']) . "'");
				
				$data['text_message'] = sprintf($this->language->get('text_message'), $query->row['email']);
			} elseif  ($query1->num_rows) {
				$this->db->query("UPDATE " . DB_PREFIX . "customer SET newsletter = '0' WHERE email = '" . $this->db->escape($query1->row['email']) . "'");
				
				$data['text_message'] = sprintf($this->language->get('text_message'), $query1->row['email']);
			} else {
				$data['text_message'] = $this->language->get('error_unsubscribe');
			}		
		
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('common/success', $data));

		} else {
			$this->response->redirect($this->url->link('common/home'));
		}
	}
	
	public function validate() {
		$this->load->language('extension/module/newsletter');
		
		$json = array();
		
		if ((strlen($this->request->post['email']) > 96) || !preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $this->request->post['email'])) {
			$json['error']['warning'] = $this->language->get('error_email');
		} elseif (strlen($this->request->post['email']) < 3) {
			$json['error']['warning'] = $this->language->get('error_message');
		}
		
		if(!$json) {
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer WHERE email = '" . $this->db->escape($this->request->post['email']) . "'");
			
			if ($query->num_rows) {
				$query = $this->db->query("SELECT newsletter FROM " . DB_PREFIX . "customer WHERE email = '" . $this->db->escape($this->request->post['email']) . "'");
				
				if ($query->row['newsletter']) {
					$this->db->query("UPDATE " . DB_PREFIX . "customer SET newsletter = '0' WHERE email = '" . $this->db->escape($this->request->post['email']) . "'");
					
					$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "newsletter WHERE email = '" . $this->db->escape($this->request->post['email']) . "'");
					
					if ($query->num_rows) {
						$this->db->query("DELETE FROM " . DB_PREFIX . "newsletter WHERE email = '" . $this->db->escape($this->request->post['email']) . "'");
					}
					
					$json['success'] = $this->language->get('text_unsubscribe');
				} else {
					$this->db->query("UPDATE " . DB_PREFIX . "customer SET newsletter = '1' WHERE email = '" . $this->db->escape($this->request->post['email']) . "'");
					
					$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "newsletter WHERE email = '" . $this->db->escape($this->request->post['email']) . "'");
					
					if ($query->num_rows) {
						$this->db->query("DELETE FROM " . DB_PREFIX . "newsletter WHERE email = '" . $this->db->escape($this->request->post['email']) . "'");
					}
					
					$json['success'] = $this->language->get('text_subscribe');
				}
			} else {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "newsletter WHERE email = '" . $this->db->escape($this->request->post['email']) . "'");
				
				if ($query->num_rows) {
					$this->db->query("DELETE FROM " . DB_PREFIX . "newsletter WHERE email = '" . $this->db->escape($this->request->post['email']) . "'");
					
					$json['success'] = $this->language->get('text_unsubscribe');
				} else {
					$this->db->query("INSERT INTO " . DB_PREFIX . "newsletter SET email = '" . $this->db->escape($this->request->post['email']) . "'");
					
					$json['success'] = $this->language->get('text_subscribe');
				}
			}
		}
		
		$this->response->setOutput(json_encode($json));	
	}
}