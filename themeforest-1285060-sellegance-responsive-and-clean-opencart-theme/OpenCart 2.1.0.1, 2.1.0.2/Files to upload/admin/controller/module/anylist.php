<?php
class ControllerModuleAnylist extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->load->language('module/anylist');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('extension/module');
		$this->load->model('catalog/product');
		$this->load->model('setting/store');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			if (!isset($this->request->get['module_id'])) {
				$this->model_extension_module->addModule('anylist', array_merge($this->request->post,array('module_id'=>$this->request->get['module_id'])));
			} else {
				$this->model_extension_module->editModule($this->request->get['module_id'], array_merge($this->request->post,array('module_id'=>$this->request->get['module_id'])));
			}
			$this->session->data['success'] = $this->language->get('text_success');
			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}


        $data = array();
				
		$data['heading_title'] = $this->language->get('heading_title');
        
		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_title'] = $this->language->get('entry_title');
		$data['entry_selection'] = $this->language->get('entry_selection');
		$data['entry_dimension'] = $this->language->get('entry_dimension');
		$data['entry_limit'] = $this->language->get('entry_limit');
		$data['entry_filter'] = $this->language->get('entry_filter');
		$data['entry_status'] = $this->language->get('entry_status');

		$data['entry_titlelink'] = $this->language->get('entry_titlelink');
		$data['entry_code'] = $this->language->get('entry_code');
		$data['entry_title'] = $this->language->get('entry_title');
		$data['entry_category'] = $this->language->get('entry_category');
		$data['help_category'] = $this->language->get('help_category');
		$data['entry_products'] = $this->language->get('entry_products');
		$data['entry_manufacturer'] = $this->language->get('entry_manufacturer');
		$data['entry_limit_help'] = $this->language->get('entry_limit_help');
		$data['entry_latest_text'] = $this->language->get('entry_latest_text');
		$data['entry_latest_products'] = $this->language->get('entry_latest_products');
		$data['entry_specials_text'] = $this->language->get('entry_specials_text');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$data['entry_sort_descending'] = $this->language->get('entry_sort_descending');
		$data['entry_product'] = $this->language->get('entry_product');
		$data['entry_store'] = $this->language->get('entry_store');

		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_period'] = $this->language->get('text_period');
		$data['text_select'] = $this->language->get('text_select');
		$data['text_unselect'] = $this->language->get('text_unselect');
		$data['text_default'] = $this->language->get('text_default');


		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_save'] = $this->language->get('button_save');

 		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
		);

		if (!isset($this->request->get['module_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('module/anylist', 'token=' . $this->session->data['token'], 'SSL')
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('module/anylist', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL')
			);			
		}

		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('module/anylist', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$data['action'] = $this->url->link('module/anylist', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL');
		}
		
		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');


		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}

		
		$data['token'] = $this->session->data['token'];


		$data['name'] = (isset($module_info['name'])) ? $module_info['name'] : '';
		$data['titlelink'] = (isset($module_info['titlelink'])) ? $module_info['titlelink'] : '';
		$data['code'] = (isset($module_info['code'])) ? $module_info['code'] : '';
		$data['title'] = (isset($module_info['title'])) ? $module_info['title'] : array();
		$data['products'] = (isset($module_info['products'])) ? $module_info['products'] : array();
		$data['categories'] = (isset($module_info['categories'])) ? $module_info['categories'] : array();
		$data['latest'] = (isset($module_info['latest'])) ? $module_info['latest'] : '';
		$data['specials'] = (isset($module_info['specials'])) ? $module_info['specials'] : 0;
		$data['sortfield'] = (isset($module_info['sortfield'])) ? $module_info['sortfield'] : '';
		$data['width'] = (isset($module_info['width'])) ? $module_info['width'] : 80;
		$data['height'] = (isset($module_info['height'])) ? $module_info['height'] : 80;
		$data['limit'] = (isset($module_info['limit'])) ? $module_info['limit'] : 0;
		$data['date_start'] = (isset($module_info['date_start'])) ? $module_info['date_start'] : '';
		$data['date_end'] = (isset($module_info['date_end'])) ? $module_info['date_end'] : '';
		$data['status'] = (isset($module_info['status'])) ? $module_info['status'] : 0;
		$data['limitmanufacturer'] = (isset($module_info['limitmanufacturer'])) ? $module_info['limitmanufacturer'] : array();
		$data['limitcategory'] = (isset($module_info['limitcategory'])) ? $module_info['limitcategory'] : array();
		$data['anylist_stores'] = (isset($module_info['anylist_stores'])) ? $module_info['anylist_stores'] : array();

		$data['products_list'] = array();
        $data['category_list'] = array();


		$this->load->model('catalog/category');
		$data['all_categories'] = $this->model_catalog_category->getCategories(0);

		$this->load->model('catalog/manufacturer');
		$data['all_manufacturers'] = $results = $this->model_catalog_manufacturer->getManufacturers();

		$this->load->model('localisation/language');
		$data['languages'] = $this->model_localisation_language->getLanguages();



		$data['stores'] = $this->model_setting_store->getStores();


		$data['prodfields'] = array();
		$p = $this->model_catalog_product->getProducts(array('start'=>0,'limit'=>1));
		$data['prodfields'] = array_keys($p[0]);

		//if ($p[0]) foreach($p[0] as $f=>$v) $data['prodfields'][] = $f;


		if ($data['products']) {
			foreach($data['products'] as $pid) {
				if ($p = $this->model_catalog_product->getProduct($pid))
					$data['products_list'][] = $p; 
			}
		}

        if ($data['categories']) {
            foreach($data['categories'] as $cid) {
				if ($c = $this->model_catalog_category->getCategory($cid))
					$data['category_list'][] = $c; 
			}
        }            
				
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
				
		$this->response->setOutput($this->load->view('module/anylist.tpl', $data));
	}
    
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/anylist')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (isset($this->request->post['anylist_module'])) {
			foreach ($this->request->post['anylist_module'] as $key => $value) {
				if (!$value['width'] || !$value['height']) {
					$this->error['dimension'][$key] = $this->language->get('error_dimension');
				}			
			}
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}
?>