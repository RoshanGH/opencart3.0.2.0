<?php
/**
 * Name: Ajax Live Options
 * Apply Version: 2.3.X.X
 * Version: 2.3.X.X
 * Author: 		Denise (rei7092@gmail.com)
 */
class ControllerProductLiveOptions extends Controller {
	private $error = array(); 
	private $data  = array(); 

	public function __construct($params) {
    	parent::__construct($params);

		$this->use_cache               = $this->config->get('live_options_use_cache') ? TRUE : FALSE;
		$this->calculate_quantity      = $this->config->get('live_options_calculate_quantity') ? TRUE : FALSE;
		$this->show_type               = $this->config->get('live_options_show_type') ? TRUE : FALSE;
		$this->show_option_type        = $this->config->get('live_options_show_options_type') ? TRUE : FALSE;

		$this->options_container       = $this->config->get('live_options_container');
		$this->special_price_container = $this->config->get('live_options_special_container');
		$this->price_container         = $this->config->get('live_options_price_container');
		$this->tax_price_container     = $this->config->get('live_options_tax_container');
		$this->points_container        = $this->config->get('live_options_points_container');
		$this->reward_container        = $this->config->get('live_options_reward_container');
	}
	public function index() { 
		$json           = array();
		$update_cache   = false;
		$options_makeup = $options_makeup_notax = $options_points = 0;
		if (version_compare(VERSION, '2.0.0.0', '>=') && version_compare(VERSION, '2.2.0.0', '<')) {
			$currency_cache = $this->currency->getCode();
			$currency_code = false;
		}
		elseif(version_compare(VERSION, '2.2.0.0', '>=') && version_compare(VERSION, '2.4.0.0', '<')){
			$currency_cache = $currency_code = $this->session->data['currency'];
		}
		else{
			$json['success'] = false;
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
			exit;
		}

		if (isset($this->request->get['product_id'])) {
			$product_id = (int)$this->request->get['product_id'];
		} else {
			$product_id = 0;
		}

		if ($this->calculate_quantity && isset($this->request->post['quantity'])) {
			$quantity = (int)$this->request->post['quantity'];
		} else {
			$quantity = 1;
		}

		$this->load->model('catalog/product');

		// Cache name
		if (isset($this->request->post['option']) && is_array($this->request->post['option'])) {
			$options_hash = serialize($this->request->post['option']);
		} else {
			$options_hash = '';
		}
		$cache_key = 'live_options_'. md5($product_id . $quantity. $options_hash . $currency_cache . $this->session->data['language'] . $this->show_type . $this->show_option_type . $this->calculate_quantity);
		if (!$this->use_cache || (!$json = $this->cache->get($cache_key))) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			// Prepare data
			if ($product_info) {
				$update_cache = true;

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$this->data['price'] = $this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax'));
				} else {
					$this->data['price'] = false;
				}

				if ((float)$product_info['special']) {
					$this->data['special'] = $this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax'));
				} else {
					$this->data['special'] = false;
				}

				// Discount
				$discount_price = $this->get_discount_price($product_id, $quantity);
				if($discount_price && !$this->data['special']){
					if ((float)$discount_price) {
						$this->data['price'] = $this->tax->calculate($discount_price, $product_info['tax_class_id'], $this->config->get('config_tax'));
					} else {
						$this->data['price'] = false;
					}
				}

				// If some options are selected
				if (isset($this->request->post['option']) && $this->request->post['option']) {
					$option_tax = $this->config->get('config_tax') ? 'P' : false;
					foreach ($this->model_catalog_product->getProductOptions($product_id) as $option) { 
						foreach ($option['product_option_value'] as $option_value) {
							if (isset($this->request->post['option'][$option['product_option_id']])) {
								if(is_array($this->request->post['option'][$option['product_option_id']])){
									foreach ($this->request->post['option'][$option['product_option_id']] as $product_option_id) {
										if($product_option_id == $option_value['product_option_value_id']){
											$options_makeup += $this->get_options_makeup($option_value, $product_info['tax_class_id'], $option_tax);
											$options_makeup_notax += $this->get_options_makeup($option_value, 0, $option_tax);

											// add points
											if($option_value['points']){
												$options_points += $this->get_options_makeup($option_value, $product_info['tax_class_id'], false, 'points');
											}
										}
									}
								}
								elseif($this->request->post['option'][$option['product_option_id']] == $option_value['product_option_value_id']){
									$options_makeup += $this->get_options_makeup($option_value, $product_info['tax_class_id'], $option_tax);
									$options_makeup_notax += $this->get_options_makeup($option_value, 0, $option_tax);

									// add points
									if($option_value['points']){
										$options_points += $this->get_options_makeup($option_value, $product_info['tax_class_id'], false, 'points');
									}
								}
							}
						}
					}
				}

				// Show extra price
				if($this->show_type){
					$prefix_makeup = $options_makeup > 0 ? ' + ' : '';
					$options_makeup = ($options_makeup == 0) ? '' : ' ('.$prefix_makeup.$this->currency->format($options_makeup * $quantity, $currency_code).')';
					$options_makeup_notax = ($options_makeup_notax == 0) ? '' : ' ('.$prefix_makeup.$this->currency->format($options_makeup_notax * $quantity, $currency_code).')';

					if ($this->data['price']) {
						$json['new_price']['price'] = $this->currency->format($this->data['price'] * $quantity, $currency_code) . $options_makeup;
					} else {
						$json['new_price']['price'] = false;
					}
					if ($this->data['special']) {
						$json['new_price']['special'] = $this->currency->format($this->data['special'] * $quantity, $currency_code) . $options_makeup;
					} else {
						$json['new_price']['special'] = false;
					}
					if ($this->config->get('config_tax')) {
						$json['new_price']['tax'] = $this->currency->format(((float)$product_info['special'] ? $product_info['special'] : $product_info['price']) * $quantity, $currency_code ) . $options_makeup_notax;
					} else {
						$json['new_price']['tax'] = false;
					}
				}
				// Show total price
				else{
					if ($this->data['price']) {
						$json['new_price']['price'] = $this->currency->format(($this->data['price'] + $options_makeup) * $quantity, $currency_code);
					} else {
						$json['new_price']['price'] = false;
					}

					if ($this->data['special']) {
						$json['new_price']['special'] = $this->currency->format(($this->data['special'] + $options_makeup) * $quantity, $currency_code);
					} else {
						$json['new_price']['special'] = false;
					}

					if ($this->config->get('config_tax')) {
						$json['new_price']['tax'] = $this->currency->format(((float)$product_info['special'] ? ($product_info['special'] + $options_makeup) : ($product_info['price'] + $options_makeup_notax)) * $quantity, $currency_code );
					} else {
						$json['new_price']['tax'] = false;
					}
				}
				$json['new_price']['reward'] = ($product_info['reward'] > 0) ? (abs($product_info['reward']) * $quantity) : 0;
				$json['new_price']['points'] = ($product_info['points'] + $options_points > 0) ? abs($product_info['points'] + $options_points) * $quantity : 0;

				$json['success'] = true;
			} else {
				$json['success'] = false;
			}
		}

		if ($update_cache && $this->use_cache) {
			$this->cache->set($cache_key, $json);
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
  	}
	private function get_options_makeup($option_value, $tax_class_id, $tax_type, $param = 'price'){
		$options_makeup = 0;
		if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
			if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value[$param]) {
				$price = $this->tax->calculate($option_value[$param], $tax_class_id, $tax_type);
			} else {
				$price = false;
			}
			if ($price) {
				if ($option_value[$param.'_prefix'] === '+') {
					$options_makeup = $options_makeup + (float)$price;
				} else {
					$options_makeup = $options_makeup - (float)$price;
				}
			}
			unset($price);
		}
		return $options_makeup;
	}

	private function get_discount_price($product_id, $discount_quantity){
		$price = false;
		$product_discount_query = $this->db->query("SELECT price FROM " . DB_PREFIX . "product_discount WHERE product_id = '" . (int)$product_id . "' AND customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "' AND quantity <= '" . (int)$discount_quantity . "' AND ((date_start = '0000-00-00' OR date_start < NOW()) AND (date_end = '0000-00-00' OR date_end > NOW())) ORDER BY quantity DESC, priority ASC, price ASC LIMIT 1");

		if ($product_discount_query->num_rows) {
			$price = (float)$product_discount_query->row['price'];
		}
		return $price;
	}
	function js() {
		header('Content-Type: application/javascript'); 
		$product_id = isset($this->request->get['product_id']) ? (int)$this->request->get['product_id'] : 0;
		if ($product_id == 0 || !$this->config->get('live_options_ajax_status')) {
			exit;
		}

		$js = <<<HTML
			var price_with_options_ajax_call = function() {
				$.ajax({
					type: 'POST',
					url: 'index.php?route=product/live_options/index&product_id=$product_id',
					data: $('{$this->options_container} input[type=\'text\'], {$this->options_container} input[type=\'number\'], {$this->options_container} input[type=\'hidden\'], {$this->options_container} input[type=\'radio\']:checked, {$this->options_container} input[type=\'checkbox\']:checked, {$this->options_container} select, {$this->options_container} textarea'),
					dataType: 'json',
					beforeSend: function() {
						// you can add smth useful here
					},
					complete: function() {
						// you can add smth useful here
					},
					success: function(json) {
						if (json.success) {
							if ($('{$this->options_container} {$this->tax_price_container}').length > 0 && json.new_price.tax) {
								animation_on_change_price_with_options('{$this->options_container} {$this->tax_price_container}', json.new_price.tax);
							}
							if ($('{$this->options_container} {$this->special_price_container}').length > 0 && json.new_price.special) {
								animation_on_change_price_with_options('{$this->options_container} {$this->special_price_container}', json.new_price.special);
							}
							if ($('{$this->options_container} {$this->price_container}').length > 0 && json.new_price.price) {
								animation_on_change_price_with_options('{$this->options_container} {$this->price_container}', json.new_price.price);
							}
							// points
							if ($('{$this->options_container} {$this->points_container}').length > 0 && json.new_price.points) {
								animation_on_change_price_with_options('{$this->options_container} {$this->points_container}', json.new_price.points);
							}
							// reward
							if ($('{$this->options_container} {$this->reward_container}').length > 0 && json.new_price.reward) {
								animation_on_change_price_with_options('{$this->options_container} {$this->reward_container}', json.new_price.reward);
							}
						}
					},
					error: function(error) {
						console.log('error: '+error);
					}
				});
			}
			
			var animation_on_change_price_with_options = function(selector_class_or_id, new_html_content) {
				$(selector_class_or_id).fadeOut(150, function() {
					$(this).html(new_html_content).fadeIn(50);
				});
			}

			if ($('{$this->options_container} input[name=\'quantity\']').val() > 1)
			{
				price_with_options_ajax_call();
			}

			if ( jQuery.isFunction(jQuery.fn.on) ) 
			{
				$(document).on('change', '{$this->options_container} input[type=\'hidden\'], {$this->options_container} input[type=\'radio\']:checked, {$this->options_container} input[type=\'checkbox\'], {$this->options_container} select, {$this->options_container} textarea', function () {
					
					price_with_options_ajax_call();
				});
				$(document).on('input', '{$this->options_container} input[type=\'text\'], {$this->options_container} input[type=\'number\'], {$this->options_container} input[name=\'quantity\']', function () {
					
					price_with_options_ajax_call();
				});
			} 
			else 
			{
				$('{$this->options_container} input[type=\'text\'], {$this->options_container} input[type=\'number\'], {$this->options_container} input[type=\'hidden\'], {$this->options_container} input[type=\'radio\']:checked, {$this->options_container} input[type=\'checkbox\'], {$this->options_container} select, {$this->options_container} textarea, {$this->options_container} input[name=\'quantity\']').live('change', function() {
					price_with_options_ajax_call();
				});
			}
			// Support spinner_quantity
			if( $('.number-spinner button').length ){
				$(document).on('click', '.number-spinner button', function () {
					setTimeout(function() {
						price_with_options_ajax_call();
					}, 100);
				});
			}
			// Support bt_claudine
			if( $('.increase').length || $('.decrease').length ){
				$(document).on('click', '.increase', function () {
					setTimeout(function() {
						price_with_options_ajax_call();
					}, 100);
				});
				$(document).on('click', '.decrease', function () {
					setTimeout(function() {
						price_with_options_ajax_call();
					}, 100);
				});
			}
			// Support Pav theme
			if( $('.quantity-adder .add-action').length ){
				$(".quantity-adder .add-action").bind( "mouseup touchend", function(e){
					setTimeout(function() {
						price_with_options_ajax_call();
					}, 100);
				});
			}
			// Support vitalia
			if( $('#q_up').length || $('#q_down').length ){
				$('#q_up,#q_down').click(function(){
					setTimeout(function() {
						price_with_options_ajax_call();
					}, 100);
				});
			}
HTML;

		echo $js;
		exit;
	}
}

?>