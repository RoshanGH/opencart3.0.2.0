<?php
/* 
Version: 2.1.0.2
Author: Denise (rei7092@gmail.com)
Page: http://www.opencart.com/index.php?route=extension/extension/info&token=862f82b6be28a025c788dfff38c7a550&extension_id=26240
*/

class ControllerExtensionModuleLiveOptions extends Controller {
	/* ====================================================================================

	SETTINGS

	Below you can find five variables that relate to DOM the structure of the template product/product.tpl. 
	The default values correspond to a default OpenCart theme. 
	If you use customized theme, these containers might have other class or id. In this case you need to clarify their value.

	==================================================================================== */
	public $options_container 			= '#content';		// in default them it is ".product-info"
	public $special_container 	        = '.price-new-live';		// in default them it is ".price-new"
	public $price_container				= '.price-old-live';		// in default them it is ".price-old"
	public $tax_container 		        = '.price-tax-live';		// in default them it is ".price-tax'"
	public $points_container 			= '.spend-points-live';	// in default them it is ".price-points'"
	public $reward_container 			= '.get-reward-live';	// in default them it is ".price-reward'"
	private $error = array();

	public function index() {
		$this->language->load('extension/module/live_options');
		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('live_options', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
		}

 		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		if (isset($this->error['options_container'])) {
			$data['error_options_container'] = $this->error['options_container'];
		} else {
			$data['error_options_container'] = '';
		}
		if (isset($this->error['special_container'])) {
			$data['error_special_container'] = $this->error['special_container'];
		} else {
			$data['error_special_container'] = '';
		}
		if (isset($this->error['price_container'])) {
			$data['error_price_container'] = $this->error['price_container'];
		} else {
			$data['error_price_container'] = '';
		}
		if (isset($this->error['tax_container'])) {
			$data['error_tax_container'] = $this->error['tax_container'];
		} else {
			$data['error_tax_container'] = '';
		}
		if (isset($this->error['points_container'])) {
			$data['error_points_container'] = $this->error['points_container'];
		} else {
			$data['error_points_container'] = '';
		}
		if (isset($this->error['reward_container'])) {
			$data['error_reward_container'] = $this->error['reward_container'];
		} else {
			$data['error_reward_container'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
		    unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		$data['action']                   = $this->url->link('extension/module/live_options', 'token=' . $this->session->data['token'], true);
		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);
		
		// Languages
		$data['heading_title']            = $this->language->get('heading_title');
		$data['text_edit']                = $this->language->get('text_edit');
		$data['text_success']             = $this->language->get('text_success');
		$data['text_enabled']             = $this->language->get('text_enabled');
		$data['text_disabled']            = $this->language->get('text_disabled');
		$data['text_total']               = $this->language->get('text_total');
		$data['text_added']               = $this->language->get('text_added');
		
		$data['entry_show_type']          = $this->language->get('entry_show_type');
		$data['entry_show_options_type']  = $this->language->get('entry_show_options_type');
		$data['entry_use_cache']          = $this->language->get('entry_use_cache');
		$data['entry_calculate_quantity'] = $this->language->get('entry_calculate_quantity');
		$data['entry_status']             = $this->language->get('entry_status');
		$data['entry_options_container']  = $this->language->get('entry_options_container');
		$data['entry_special_container']  = $this->language->get('entry_special_container');
		$data['entry_price_container']    = $this->language->get('entry_price_container');
		$data['entry_tax_container']      = $this->language->get('entry_tax_container');
		$data['entry_points_container']   = $this->language->get('entry_points_container');
		$data['entry_reward_container']   = $this->language->get('entry_reward_container');
		
		$data['help_cache']               = $this->language->get('help_cache');
		$data['help_calculate']           = $this->language->get('help_calculate');
		$data['help_tab_css_desc']        = $this->language->get('help_tab_css_desc');
		$data['help_options_container']   = $this->language->get('help_options_container');
		$data['help_special_container']   = $this->language->get('help_special_container');
		$data['help_price_container']     = $this->language->get('help_price_container');
		$data['help_tax_container']       = $this->language->get('help_tax_container');
		$data['help_points_container']    = $this->language->get('help_points_container');
		$data['help_reward_container']    = $this->language->get('help_reward_container');
		$data['help_use_cache']           = $this->language->get('help_use_cache');
		
		$data['button_save']              = $this->language->get('button_save');
		$data['button_cancel']            = $this->language->get('button_cancel');
		$data['tab_general']              = $this->language->get('tab_general');
		$data['tab_additional']           = $this->language->get('tab_additional');
		
		$data['breadcrumbs']              = array();
		$data['breadcrumbs'][]            = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][]            = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true)
		);

		$data['breadcrumbs'][]            = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/module/live_options', 'token=' . $this->session->data['token'], true)
		);

		if (isset($this->request->post['live_options_show_type'])) {
			$data['live_options_show_type'] = $this->request->post['live_options_show_type'];
		} else {
			$data['live_options_show_type'] = $this->config->get('live_options_show_type');
		}
		if (isset($this->request->post['live_options_show_options_type'])) {
			$data['live_options_show_options_type'] = $this->request->post['live_options_show_options_type'];
		} else {
			$data['live_options_show_options_type'] = $this->config->get('live_options_show_options_type');
		}

		if (isset($this->request->post['live_options_use_cache'])) {
			$data['live_options_use_cache'] = $this->request->post['live_options_use_cache'];
		} else {
			$data['live_options_use_cache'] = $this->config->get('live_options_use_cache');
		}
		if (isset($this->request->post['live_options_calculate_quantity'])) {
			$data['live_options_calculate_quantity'] = $this->request->post['live_options_calculate_quantity'];
		} else {
			$data['live_options_calculate_quantity'] = $this->config->get('live_options_calculate_quantity');
		}
		if (isset($this->request->post['live_options_ajax_status'])) {
			$data['live_options_ajax_status'] = $this->request->post['live_options_ajax_status'];
		} else {
			$data['live_options_ajax_status'] = $this->config->get('live_options_ajax_status');
		}
		// hidden values
		if (isset($this->request->post['live_options_container'])) {
			$data['live_options_container'] = $this->request->post['live_options_container'];
		} elseif (strlen($this->config->get('live_options_container'))) {
			$data['live_options_container'] = $this->config->get('live_options_container');
		} else {
			$data['live_options_container'] = $this->options_container;
		}

		if (isset($this->request->post['live_options_special_container'])) {
			$data['live_options_special_container'] = $this->request->post['live_options_special_container'];
		} elseif (strlen($this->config->get('live_options_special_container'))) {
			$data['live_options_special_container'] = $this->config->get('live_options_special_container');
		} else {
			$data['live_options_special_container'] = $this->special_container;
		}

		if (isset($this->request->post['live_options_price_container'])) {
			$data['live_options_price_container'] = $this->request->post['live_options_price_container'];
		} elseif(strlen($this->config->get('live_options_price_container'))) {
			$data['live_options_price_container'] = $this->config->get('live_options_price_container');
		} else {
			$data['live_options_price_container'] = $this->price_container;
		}

		if (isset($this->request->post['live_options_tax_container'])) {
			$data['live_options_tax_container'] = $this->request->post['live_options_tax_container'];
		} elseif(strlen($this->config->get('live_options_tax_container'))) {
			$data['live_options_tax_container'] = $this->config->get('live_options_tax_container');
		} else {
			$data['live_options_tax_container'] = $this->tax_container;
		}

		if (isset($this->request->post['live_options_points_container'])) {
			$data['live_options_points_container'] = $this->request->post['live_options_points_container'];
		} elseif(strlen($this->config->get('live_options_points_container'))) {
			$data['live_options_points_container'] = $this->config->get('live_options_points_container');
		} else {
			$data['live_options_points_container'] = $this->points_container;
		}

		if (isset($this->request->post['live_options_reward_container'])) {
			$data['live_options_reward_container'] = $this->request->post['live_options_reward_container'];
		} elseif(strlen($this->config->get('live_options_reward_container'))) {
			$data['live_options_reward_container'] = $this->config->get('live_options_reward_container');
		} else {
			$data['live_options_reward_container'] = $this->reward_container;
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
        $data['current_lang_id'] = $this->config->get('config_language_id');

		$this->response->setOutput($this->load->view('extension/module/live_options.tpl', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/live_options')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		if (!$this->request->post['live_options_container']) {
			$this->error['options_container'] = $this->language->get('error_options_container');
		}
		if (!$this->request->post['live_options_special_container']) {
			$this->error['special_container'] = $this->language->get('error_special_container');
		}
		if (!$this->request->post['live_options_price_container']) {
			$this->error['price_container'] = $this->language->get('error_price_container');
		}
		if (!$this->request->post['live_options_tax_container']) {
			$this->error['tax_container'] = $this->language->get('error_tax_container');
		}
		if (!$this->request->post['live_options_points_container']) {
			$this->error['points_container'] = $this->language->get('error_points_container');
		}
		if (!$this->request->post['live_options_reward_container']) {
			$this->error['reward_container'] = $this->language->get('error_reward_container');
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}
		
	}

}
?>