<?php
/*
* Twitter Timeline Module
* Developed for OpenCart 2.x
* Author Gedielson Peixoto - http://www.gepeixoto.com.br
* @03/2015
* Under GPL license.
*/
class ControllerModuleTwittertl extends Controller {
	public function index() {
		$data['heading_title'] = ($this->config->get('twittertl_title')) ? html_entity_decode($this->config->get('twittertl_title'), ENT_QUOTES, 'UTF-8') : false;
		$data['widget_id'] = $this->config->get('twittertl_widget_id');
		$data['width'] = $this->config->get('twittertl_width');
		$data['height'] = $this->config->get('twittertl_height');
		$data['theme'] = $this->config->get('twittertl_theme');
		$data['show_replies'] = $this->config->get('twittertl_show_replies');
		$data['limit'] = ($this->config->get('twittertl_limit')) ? $this->config->get('twittertl_limit') : false;
		$data['related_users'] = ($this->config->get('twittertl_related_users')) ? $this->config->get('twittertl_related_users') : false;

		return $this->load->view('module/twittertl', $data);
	}
}