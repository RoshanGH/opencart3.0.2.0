<div id="quickViewContent">
		
		<div id="notification"></div>
		
		<div id="quick-content" class="product-page" role="main">
		
			<a href="<?php echo $product_href; ?>" class="more-details"><?php echo $text_more_details; ?></a>
		
			<div class="mainborder">
		
				<div class="row">
		
					<div class="col-sm-6">
		
						<?php if ($thumb || $images) { ?>
		
							<?php if ($thumb) { ?>
		
								<div class="image">
								<?php if ($price && $special) { ?>
								<span class="onsale"><?php echo $text_onsale; ?></span>
								<?php } ?>

								<?php $arrimages=array_filter($images); ?>

								<?php if (!empty($arrimages)) { ?>
		
									<div id="sync1" class="owl-carousel">

										<div class="item">
											<img src="<?php echo $thumb; ?>" id="image" class="img-responsive" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
										</div>

										<?php foreach ($images as $image) { ?>
										<div class="item">
											<img src="<?php echo $image['thumb']; ?>" class="img-responsive">
										</div>
										<?php } ?>

									</div>

									<?php } else { ?>
										<img src="<?php echo $thumb; ?>" id="image" class="img-responsive" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
									<?php } ?>
		
								</div>
		
							<?php } else { ?>
								<img src="<?php echo $thumb; ?>" id="image" class="img-responsive" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
							<?php } ?>
		
							<?php if ($images) { ?>
		
								<div id="sync2" class="owl-carousel image-additional">
		
									<div class="item no-zoom"><img src="<?php echo $small; ?>" /></div>

									<?php foreach ($images as $image) { ?>
										<div class="item no-zoom"><img src="<?php echo $image['small']; ?>"></div>
									<?php } ?>
		
								</div>

								<script type="text/javascript">
									$(document).ready(function() {
									 
									  var sync1 = $("#sync1");
									  var sync2 = $("#sync2");
									 
									  sync1.owlCarousel({
									    singleItem : true,
									    slideSpeed : 1000,
									    navigation: true,
									    navigationText: ['<i class="fa fa-angle-left fa-5x"></i>', '<i class="fa fa-angle-right fa-5x"></i>'],
									    pagination:false,
									    afterAction : syncPosition,
									    responsiveRefreshRate : 200,
									  });
									 
									  sync2.owlCarousel({
									    items : 4,
									    itemsDesktop      : [1199,4],
									    itemsDesktopSmall     : [979,4],
									    itemsTablet       : [768,6],
									    itemsMobile       : [479,4],
									    pagination:false,
									    navigation: true,
									    navigationText: ['<i class="fa fa-angle-left fa-5x"></i>', '<i class="fa fa-angle-right fa-5x"></i>'],
									    responsiveRefreshRate : 100,
									    afterInit : function(el){
									      el.find(".owl-item").eq(0).addClass("synced");
									    }
									  });
									 
									  function syncPosition(el){
									    var current = this.currentItem;
									    $("#sync2")
									      .find(".owl-item")
									      .removeClass("synced")
									      .eq(current)
									      .addClass("synced")
									    if($("#sync2").data("owlCarousel") !== undefined){
									      center(current)
									    }
									  }
									 
									  $("#sync2").on("click", ".owl-item", function(e){
									    e.preventDefault();
									    var number = $(this).data("owlItem");
									    sync1.trigger("owl.goTo",number);
									  });
									 
									  function center(number){
									    var sync2visible = sync2.data("owlCarousel").owl.visibleItems;
									    var num = number;
									    var found = false;
									    for(var i in sync2visible){
									      if(num === sync2visible[i]){
									        var found = true;
									      }
									    }
									 
									    if(found===false){
									      if(num>sync2visible[sync2visible.length-1]){
									        sync2.trigger("owl.goTo", num - sync2visible.length+2)
									      }else{
									        if(num - 1 === -1){
									          num = 0;
									        }
									        sync2.trigger("owl.goTo", num);
									      }
									    } else if(num === sync2visible[sync2visible.length-1]){
									      sync2.trigger("owl.goTo", sync2visible[1])
									    } else if(num === sync2visible[0]){
									      sync2.trigger("owl.goTo", num-1)
									    }
									    
									  }
									 
									});
								</script>
		
							<?php } ?>
		
						<?php } ?> 
					
					</div> <!-- .col-sm-6 LEFT BOX-->
		
		
					<div class="col-sm-6 rightcol">

						<header class="page-header">
							<h1><a href="<?php echo $product_href; ?>"><?php echo $heading_title; ?></a></h1>
						</header>

						<div class="stock">
							<?php if ($quantity && $quantity <= 0) { ?>
							<span class="outstock"><i class="fa fa-times-circle"></i> <?php echo $stock; ?></span>
											<?php } else { ?>
							<span class="instock"><i class="fa fa-check-circle"></i> <?php echo $stock; ?></span>
											<?php } ?>
						</div>
										
						<div id="product">
				
							<div class="options">

									<?php if ($options) { ?>
									<?php foreach ($options as $option) { ?>
									<?php if ($option['type'] == 'select') { ?>
									<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
									  <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
									  <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
									    <option value=""><?php echo $text_select; ?></option>
									    <?php foreach ($option['product_option_value'] as $option_value) { ?>
									    <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
									    <?php if ($option_value['price']) { ?>
									    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
									    <?php } ?>
									    </option>
									    <?php } ?>
									  </select>
									</div>
									<?php } ?>
									<?php if ($option['type'] == 'radio') { ?>
									<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
									  <label class="control-label"><?php echo $option['name']; ?></label>
									  <div id="input-option<?php echo $option['product_option_id']; ?>">
									    <?php foreach ($option['product_option_value'] as $option_value) { ?>
									    <div class="radio">
									      <label>
									        <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
									        <?php echo $option_value['name']; ?>
									        <?php if ($option_value['price']) { ?>
									        (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
									        <?php } ?>
									      </label>
									    </div>
									    <?php } ?>
									  </div>
									</div>
									<?php } ?>
									<?php if ($option['type'] == 'checkbox') { ?>
									<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
									  <label class="control-label"><?php echo $option['name']; ?></label>
									  <div id="input-option<?php echo $option['product_option_id']; ?>">
									    <?php foreach ($option['product_option_value'] as $option_value) { ?>
									    <div class="checkbox">
									      <label>
									        <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
		                    <?php if ($option_value['image']) { ?>
		                    <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> 
		                    <?php } ?>
									        <?php echo $option_value['name']; ?>
									        <?php if ($option_value['price']) { ?>
									        (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
									        <?php } ?>
									      </label>
									    </div>
									    <?php } ?>
									  </div>
									</div>
									<?php } ?>
									<?php if ($option['type'] == 'image') { ?>
									<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
									  <label class="control-label"><?php echo $option['name']; ?></label>
									  <div id="input-option<?php echo $option['product_option_id']; ?>">
									    <?php foreach ($option['product_option_value'] as $option_value) { ?>
									    <div class="radio">
									      <label>
									        <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
									        <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> <?php echo $option_value['name']; ?>
									        <?php if ($option_value['price']) { ?>
									        (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
									        <?php } ?>
									      </label>
									    </div>
									    <?php } ?>
									  </div>
									</div>
									<?php } ?>
									<?php if ($option['type'] == 'text') { ?>
									<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
									  <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
									  <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
									</div>
									<?php } ?>
									<?php if ($option['type'] == 'textarea') { ?>
									<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
									  <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
									  <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
									</div>
									<?php } ?>
									<?php if ($option['type'] == 'file') { ?>
									<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
									  <label class="control-label"><?php echo $option['name']; ?></label>
									  <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
									  <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
									</div>
									<?php } ?>
									<?php if ($option['type'] == 'date') { ?>
									<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
									  <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
									  <div class="input-group date">
		                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
									    <span class="input-group-btn">
									    <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
									    </span></div>
									</div>
									<?php } ?>
									<?php if ($option['type'] == 'datetime') { ?>
									<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
									  <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
									  <div class="input-group datetime">
		                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
									    <span class="input-group-btn">
									    <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
									    </span></div>
									</div>
									<?php } ?>
									<?php if ($option['type'] == 'time') { ?>
									<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
									  <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
									  <div class="input-group time">
		                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
									    <span class="input-group-btn">
									    <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
									    </span></div>
									</div>
									<?php } ?>
									<?php } ?>
									<?php } ?>

							</div>

							<?php if ($price) { ?>
							
								<div class="price">
									
									<?php if (!$special) { ?>
										<span class="price-normal"><?php echo $price; ?></span>
									<?php } else { ?>
										<span class="price-old"><?php echo $price; ?></span> <span class="price-new"><?php echo $special; ?></span>
									<?php } ?>
								
									<?php if ($tax) { ?>
										<div class="price-tax"><?php echo $text_tax; ?> <?php echo $tax; ?></div>
									<?php } ?>

								</div> <!-- .price -->

								<?php if ($discounts) { ?>
									<ul class="discount">
									<?php foreach ($discounts as $discount) { ?>
										<li><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><span><?php echo $discount['price']; ?></span></li>
									<?php } ?>
									</ul>
								<?php } ?>

								<?php if ($points) { ?>
									<div class="points"><?php echo $text_points; ?> <span><?php echo $points; ?></span></div>
								<?php } ?>

								<?php if ($reward) { ?>
									<div class="reward"><?php echo $text_reward; ?> <span><?php echo $reward; ?></span></div>
								<?php } ?>
							
							<?php } ?>
							

									<div class="cart">

										<?php if ($recurrings) { ?>
											<h3><?php echo $text_payment_recurring ?></h3>
											<div class="form-group required">
												<select name="recurring_id" class="form-control">
													<option value=""><?php echo $text_select; ?></option>
													<?php foreach ($recurrings as $recurring) { ?>
													<option value="<?php echo $recurring['recurring_id'] ?>"><?php echo $recurring['name'] ?></option>
													<?php } ?>
												</select>
												<div class="help-block" id="recurring-description"></div>
											</div>
										<?php } ?>

								<div class="row">

									<div class="col-md-4">

										<div class="input-qty">
											<div class="qty-minus" onclick="if ($(this).parent('.input-qty').find('#qty-input').val()>1) { $(this).parent('.input-qty').find('#qty-input').val(parseInt($(this).parent('.input-qty').find('#qty-input').val())-1); }">-</div>
												<div class="qty-input-div">
													<input id="qty-input"  type="text" name="quantity" value="<?php echo $minimum; ?>" class="form-control input-sm" />
												</div>
											<div class="qty-plus" onclick="$(this).parent('.input-qty').find('#qty-input').val(parseInt($(this).parent('.input-qty').find('#qty-input').val())+1);">+</div>
										</div>

										<?php if ($minimum > 1) { ?>
												<div class="minimum"><?php echo $text_minimum; ?></div>
										<?php } ?>

									</div>

									<div class="col-md-8">
									
										<input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
										
										<button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-cart btn-block"><?php echo $button_cart; ?></button>

										<button type="button" class="btn btn-link wishlist" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product_id; ?>');"><i class="fa fa-heart-o"></i> <span><?php echo $button_wishlist; ?></span></button>

										<button type="button" class="btn btn-link compare" data-toggle="tooltip" data-placement="left" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product_id; ?>');"><i class="fa fa-exchange"></i></button>

									</div>

							</div>

							</div> <!-- .cart -->

						</div>

					</div> <!-- .col-sm-6 RIGHT BOX-->
		
				</div>
		
			</div>
			
		</div>

	</div>
	

	<script type="text/javascript"><!--
	$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
		$.ajax({
			url: 'index.php?route=product/product/getRecurringDescription',
			type: 'post',
			data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
			dataType: 'json',
			beforeSend: function() {
				$('#recurring-description').html('');
			},
			success: function(json) {
				$('.alert, .text-danger').remove();
				
				if (json['success']) {
					$('#recurring-description').html(json['success']);
				}
			}
		});
	});
	//--></script> 
	<script type="text/javascript"><!--
	$('#button-cart').on('click', function() {
		$.ajax({
			url: 'index.php?route=checkout/cart/add',
			type: 'post',
			data: $('#quick-content input[type=\'text\'], #quick-content input[type=\'hidden\'], #quick-content input[type=\'radio\']:checked, #quick-content input[type=\'checkbox\']:checked, #quick-content select, #quick-content textarea'),
			dataType: 'json',
			beforeSend: function() {
				$('#quick-content #button-cart').button('loading');
			},
			complete: function() {
				$('#quick-content #button-cart').button('reset');
			},
			success: function(json) {
				$('.alert, .text-danger').remove();
				$('.form-group').removeClass('has-error');

				if (json['error']) {
					if (json['error']['option']) {
						for (i in json['error']['option']) {
							var element = $('#input-option' + i.replace('_', '-'));
							
							if (element.parent().hasClass('input-group')) {
								element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
							} else {
								element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
							}
						}
					}
					
					if (json['error']['recurring']) {
						$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
					}
					
					// Highlight any found errors
					$('.text-danger').parent().addClass('has-error');
				}
				
				if (json['success']) {

					$.magnificPopup.close();

					$('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
					
					$('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');
					
					$('html, body').animate({ scrollTop: 0 }, 'slow');
					
					$('#cart > button').trigger('click');
					
					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
			}
		});
	});
	//--></script> 

	<script src="catalog/view/javascript/jquery/datetimepicker/moment.js" type="text/javascript"></script>
	<script src="catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css" media="screen"/>

	<script type="text/javascript"><!--
	$('.date').datetimepicker({
		pickTime: false
	});

	$('.datetime').datetimepicker({
		pickDate: true,
		pickTime: true
	});

	$('.time').datetimepicker({
		pickDate: false
	});

	$('button[id^=\'button-upload\']').on('click', function() {
		var node = this;
		
		$('#form-upload').remove();
		
		$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');
		
		$('#form-upload input[name=\'file\']').trigger('click');
		
	if (typeof timer != 'undefined') {
		clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);
			
			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$('.text-danger').remove();
					
					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}
					
					if (json['success']) {
						alert(json['success']);
						
						$(node).parent().find('input').attr('value', json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
	});
	//--></script> 


<script type="text/javascript"><!--
	$(document).ready(function() {
		$('.cloud-zoom, .cloud-zoom-gallery').CloudZoom();
	});
	//--></script>
