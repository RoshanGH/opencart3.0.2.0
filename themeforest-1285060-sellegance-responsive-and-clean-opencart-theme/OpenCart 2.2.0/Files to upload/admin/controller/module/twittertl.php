<?php
/*
* Twitter Timeline Module
* Developed for OpenCart 2.x
* Author Gedielson Peixoto - http://www.gepeixoto.com.br
* @03/2015
* Under GPL license.
*/
class ControllerModuleTwittertl extends Controller {
  private $error = array(); 

  public function index() {
    $this->load->language('module/twittertl');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('twittertl', $this->request->post);
			
			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'true'));
		}
    
    $texts = array(
      'heading_title',
      'text_module',
      'text_success',
      'text_edit',
      'text_yes',
      'text_no',
      'text_light',
      'text_dark',
      'text_enabled',
      'text_disabled',
      'entry_title',
      'entry_widget_id',
      'entry_width',
      'entry_height',
      'entry_theme',
      'entry_limit',
      'entry_show_replies',
      'entry_related_users',
      'entry_status',
      'help_title',
      'help_widget_id',
      'help_limit',
      'help_related_users',
      'button_save',
      'button_cancel'
    );
    
    foreach($texts as $text) {
      $data[$text] = $this->language->get($text);
    }
    
    if (isset($this->error['warning'])) {
      $data['error_warning'] = $this->error['warning'];
    } else {
      $data['error_warning'] = '';
    }
    
    if (isset($this->error['widget_id'])) {
      $data['error_widget_id'] = $this->error['widget_id'];
    } else {
      $data['error_widget_id'] = '';
    }
    
    if (isset($this->error['width'])) {
      $data['error_width'] = $this->error['width'];
    } else {
      $data['error_width'] = '';
    }
    
    if (isset($this->error['height'])) {
      $data['error_height'] = $this->error['height'];
    } else {
      $data['error_height'] = '';
    }
    
    if (isset($this->error['limit'])) {
      $data['error_limit'] = $this->error['limit'];
    } else {
      $data['error_limit'] = '';
    }
    
    $data['breadcrumbs'] = array();

    $data['breadcrumbs'][] = array(
      'text'      => $this->language->get('text_home'),
      'href'      => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'true')
    );

    $data['breadcrumbs'][] = array(
      'text'      => $this->language->get('text_module'),
      'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'true')
    );

    $data['breadcrumbs'][] = array(
      'text'      => $this->language->get('heading_title'),
      'href'      => $this->url->link('module/twittertl', 'token=' . $this->session->data['token'], 'true')
    );
    
    $data['action'] = $this->url->link('module/twittertl', 'token=' . $this->session->data['token'], 'true');
    $data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'true');
    
    $datas = array(
      'twittertl_title' => '',
      'twittertl_widget_id' => '',
      'twittertl_width' => '250',
      'twittertl_height' => '250',
      'twittertl_theme' => 'light',
      'twittertl_limit' => '',
      'twittertl_show_replies' => 'false',
      'twittertl_related_users' => '',
      'twittertl_status' => 0
    );
    
    foreach ($datas as $key => $value) {
      if (isset($this->request->post[$key])) {
        $data[$key] = $this->request->post[$key];
      } elseif ($this->config->get($key)) {
        $data[$key] = $this->config->get($key);
      } else $data[$key] = $value;
    }
    
    $data['header'] = $this->load->controller('common/header');
    $data['column_left'] = $this->load->controller('common/column_left');
    $data['footer'] = $this->load->controller('common/footer');

    $this->response->setOutput($this->load->view('module/twittertl', $data));
  }
  
  protected function validate() {
    if (!$this->user->hasPermission('modify', 'module/twittertl')) {
      $this->error['warning'] = $this->language->get('error_permission');
    }
    
    if (!$this->request->post['twittertl_widget_id']) {
      $this->error['widget_id'] = $this->language->get('error_widget_id');
    }
    
    if ($this->request->post['twittertl_width'] < 180 || $this->request->post['twittertl_width'] > 520) {
      $this->error['width'] = $this->language->get('error_width');
    }
    
    if ($this->request->post['twittertl_height'] < 250 || $this->request->post['twittertl_height'] > 2000) {
      $this->error['height'] = $this->language->get('error_height');
    }
    
    if (!empty($this->request->post['twittertl_limit']) && ($this->request->post['twittertl_limit'] < 1 || $this->request->post['twittertl_limit'] > 20)) {
      $this->error['limit'] = $this->language->get('error_limit');
    }

    return !$this->error;
  }
}