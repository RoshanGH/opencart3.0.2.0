<?php
class ControllerModuleBannerplus extends Controller {
	public function index($setting) {
		
		
		if(empty($setting['module_title'][$this->config->get('config_language_id')])) {
			$data['module_title'] = false;
		} else if (isset($setting['module_title'][$this->config->get('config_language_id')])) {
			$data['module_title'] = html_entity_decode($setting['module_title'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
		}
		
		if (isset($setting['title_visibility'])){
			if($setting['title_visibility'] == 'mobile') {
				$data['title_visibility'] = 'hidden-md hidden-lg';
			} else if($setting['title_visibility'] == 'desktop') {
				$data['title_visibility'] = 'hidden-xs hidden-sm';
			} else {
				$data['title_visibility'] = '';
			}
		} else {
			$data['title_visibility'] = false;
		}

		$data['columns'] = $setting['columns'];
		$data['mod_id'] = $setting['mod_id'];

		//static $module = 0;

		
		if (isset($setting['sections'])) {        
						$data['sections'] = array();

						$section_row = 0;
						
						foreach($setting['sections'] as $section) {

								$this->load->model('tool/image');

								if (isset($section['block'][$this->config->get('config_language_id')])){
										$block = html_entity_decode($section['block'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
								} else {
										$block = false;
								}
				
				if (isset($section['url'][$this->config->get('config_language_id')])){
						$url = $section['url'][$this->config->get('config_language_id')];
				} else {
						$url = false;
				}

				if (isset($section['bgcolor'])){
						$bgcolor = $section['bgcolor'];
				} else {
						$bgcolor = false;
				}
				
				if (isset($section['css'])){
					$css = $section['css'];
				} else {
					$css = false;
				}

				if (isset($section['visibility'])){
					if($section['visibility'] == 'mobile') {
						$visibility = 'hidden-md hidden-lg';
					} else if($section['visibility'] == 'desktop') {
						$visibility = 'hidden-xs hidden-sm';
					} else {
						$visibility = '';
					}
				} else {
					$visibility = false;
				}
				
				if (isset($section['thumb_image']) && !empty($section['thumb_image'])){
				$image = 'image/' . $section['thumb_image'];
				} else {
				$image = false;
				}

				$section_row++;

				$data['sections'][] = array(
					'index'       => $section_row,
					'url'         => $url,
					'description' => $block,
					'bgcolor'     => $bgcolor,
					'css'         => $css,
					'visibility'  => $visibility,
					'image'       => $image
					);
				}
		
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/bannerplus.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/bannerplus.tpl', $data);
			} else {
				return $this->load->view('default/template/module/bannerplus.tpl', $data);
			}
		}
	}
}