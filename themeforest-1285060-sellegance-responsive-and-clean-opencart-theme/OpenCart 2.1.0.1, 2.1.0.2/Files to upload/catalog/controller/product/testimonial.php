<?php 
class ControllerProductTestimonial extends Controller {
	public function index() { 
	 
    	$this->load->language('product/testimonial');
		
		$this->load->model('catalog/testimonial');

		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', '', 'SSL'),
      		'separator' => false
   		);

		
		$testimonial_total = $this->model_catalog_testimonial->getTotalTestimonials();
			
		if ($testimonial_total) {

	  		$this->document->SetTitle ($this->language->get('heading_title'));

	   		$data['breadcrumbs'][] = array(
	       		'text'      => $this->language->get('heading_title'),
				'href'      => $this->url->link('product/testimonial', '', 'SSL'),
	      		'separator' => $this->language->get('text_separator')
	   		);

						
      		$data['heading_title'] = $this->language->get('heading_title');
      		$data['text_auteur'] = $this->language->get('text_auteur');
      		$data['text_city'] = $this->language->get('text_city');
      		$data['button_continue'] = $this->language->get('button_continue');
      		$data['showall'] = $this->language->get('text_showall');
      		$data['write'] = $this->language->get('text_write');
      		$data['text_average'] = $this->language->get('text_average');
      		$data['text_stars'] = $this->language->get('text_stars');
      		$data['text_no_rating'] = $this->language->get('text_no_rating');
			
			$data['continue'] = $this->url->link('common/home', '', 'SSL');

			$this->page_limit = $this->config->get('config_product_limit');
			
			if (isset($this->request->get['page'])) {
				$page = $this->request->get['page'];
			} else { 
				$page = 1;
			}	

			$data['testimonials'] = array();
			
			if ( isset($this->request->get['testimonial_id']) ){
				$results = $this->model_catalog_testimonial->getTestimonial($this->request->get['testimonial_id']);
			}
			else{
				$results = $this->model_catalog_testimonial->getTestimonials(($page - 1) * $this->page_limit, $this->page_limit);
			}
			
			foreach ($results as $result) {
				
				$data['testimonials'][] = array(
					'name'		=> $result['name'],
					'title'    		=> $result['title'],
					'rating'		=> $result['rating'],
					'description'	=> $result['description'],
					'city'		=> $result['city'],
					'date_added'	=> date("H:i:s m-d-Y", strtotime($result['date_added'])) //$result['date_added']

				);
			}
			
			$url = '';
	
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			
				$data['write_url'] = $this->url->link('product/testimonialform', '', 'SSL'); 	
			
			if ( isset($this->request->get['testimonial_id']) ){
				$data['showall_url'] = $this->url->link('product/testimonial', '', 'SSL'); 	
			}
			
			else{
				$pagination = new Pagination();
				$pagination->total = $testimonial_total;
				$pagination->page = $page;
				$pagination->limit = $this->page_limit; 
				$pagination->text = $this->language->get('text_pagination');
				$pagination->url = $this->url->link('product/testimonial', '&page={page}', 'SSL');
				$data['pagination'] = $pagination->render();				

			}
			
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');	
			
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/testimonial.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/product/testimonial.tpl', $data));
			} else {
			$this->response->setOutput($this->load->view('default/template/product/testimonial.tpl', $data));
			}
			

    	} else {

				
	  		$this->document->setTitle($this->language->get('text_error'));

			$data['heading_title'] = $this->language->get('text_error');

			$data['text_error'] = $this->language->get('text_error');

			$data['button_continue'] = $this->language->get('button_continue');

			$data['continue'] = $this->url->link('common/home');

			$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');
			
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');
			
			
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/error/not_found.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/error/not_found.tpl', $data));
			}
			
		
    	}
  	}
}