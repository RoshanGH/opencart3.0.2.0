<?php
class ControllerCommonFooterModules extends Controller {
	public function index() {
		$this->load->model('design/layout');

		$layout_id = $this->model_design_layout->getLayoutForAllPages();
		$this->load->model('extension/module');
		
		$data['sellegance_footer_modules'] = $this->config->get('sellegance_footer_modules');
		$data['modules'] = array();		

		$modules = $this->model_design_layout->getLayoutModules($layout_id, 'footer');
		
		foreach ($modules as $module) {

			$part = explode('.', $module['code']);
			
			if (isset($part[0]) && $this->config->get($part[0] . '_status')) {
				$module_data = $this->load->controller('extension/module/' . $part[0]);

				if ($module_data) {
					$data['modules'][] = $module_data;
				}
			}
			
			if (isset($part[1])) {
				$setting_info = $this->model_extension_module->getModule($part[1]);
				
				if ($setting_info && $setting_info['status']) {
					$module_data = $this->load->controller('extension/module/' . $part[0], $setting_info);

					if ($module_data) {
						$data['modules'][] = $module_data;
					}
				}
			}
		}

		return $this->load->view('common/footer_modules', $data);
	}
}