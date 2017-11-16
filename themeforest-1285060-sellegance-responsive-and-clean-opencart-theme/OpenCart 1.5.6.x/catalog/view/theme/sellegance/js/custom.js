/*  
Theme Name: Sellegance
Version: 1.5.5.4
*/

$(document).ready(function(){

	/* ---------------------------------------------------------------------- */
	/*	Forms Validation
	/* ---------------------------------------------------------------------- */

		jQuery.validator.setDefaults({
			errorClass: "error",  
			validClass: "",  
			errorElement: "span",  
			highlight: function(element, errorClass, validClass) {	
				if (element.type === 'radio') { 
					this.findByName(element.name).parent("div").parent("div").removeClass(validClass).addClass(errorClass);	
				} else { $(element).parent("div").parent("div").removeClass(validClass).addClass(errorClass);	}  
			},  
			unhighlight: function(element, errorClass, validClass) { 
				if (element.type === 'radio') { this.findByName(element.name).parent("div").parent("div").removeClass(errorClass).addClass(validClass);	
				} else { $(element).parent("div").parent("div").removeClass(errorClass).addClass(validClass);	}  
			},
			errorPlacement: function(error, element) {
				error.insertAfter(element);
			}
		});

		$("#contact-form").validate({
			rules: {
				enquiry: {
					required: true,
					minlength: 10
				}
			}
		});

		$("#register-form, #password-form").validate({
			rules: {
				password: {
					required: true, minlength: 3
				},
				confirm: {
					required: function(element) {
						var str = $("#password").val();

						return str.length > 0;
					},
					equalTo: "#password",
					minlength: 3
				}
			}
		});

		$("#edit-account, #voucher, #address, #return, #login, #forgotten").validate();

	/* ---------------------------------------------------------------------- */
	/*	Search
	/* ---------------------------------------------------------------------- */

		$('.btn-search').bind('click', function() {
			url = $('base').attr('href') + 'index.php?route=product/search';
			var search = $('input[name=\'search\']').attr('value');
			if (search) {
				url += '&search=' + encodeURIComponent(search);
			}
			location = url;
		});
		
		$('#header input[name=\'search\']').bind('keydown', function(e) {
			if (e.keyCode == 13) {
				url = $('base').attr('href') + 'index.php?route=product/search';
				var search = $('input[name=\'search\']').attr('value');
				if (search) {
					url += '&search=' + encodeURIComponent(search);
				}
				location = url;
			}
		});

		$('#sticky-search input[name=\'sticky-search\']').bind('keydown', function(e) {
			if (e.keyCode == 13) {
				url = $('base').attr('href') + 'index.php?route=product/search';
				var search = $('input[name=\'sticky-search\']').attr('value');
				if (search) {
					url += '&search=' + encodeURIComponent(search);
				}
				location = url;
			}
		});

		$('#search .search-trigger').click(function() {
			$('#search .search-trigger').hide();
			$('.rightbox .cart-block').addClass('cart-hidden');
			$('#search .search-area').fadeIn('fast', function(){				
				$(this).find('input').focus();
			});
			return false;
		});
		
		$('#search .search-area-close a').click(function() {
			$('#search .search-area').fadeOut('fast');
			$('#search .search-trigger').fadeIn('fast');
			$('.rightbox .cart-block').removeClass('cart-hidden');
			return false;
		});

		$('#sticky-search .search-trigger').click(function() {
			$('#sticky-search .search-trigger').hide();
			$('.navbar-fixed-top .cart-block').addClass('cart-hidden');
			$('#sticky-search .search-area').fadeIn('fast', function(){
				$(this).find('input').focus();
			});
			return false;
		});
		
		$('#sticky-search .search-area-close a').click(function() {
			$('#sticky-search .search-area').fadeOut('fast');
			$('#sticky-search .search-trigger').fadeIn('fast');
			$('.navbar-fixed-top .cart-block').removeClass('cart-hidden');
			return false;
		});

	/* ---------------------------------------------------------------------- */
	/*	Opacity animation on hover
	/* ---------------------------------------------------------------------- */

		if ($.browser.msie && ($.browser.version == 8 || $.browser.version == 7 || $.browser.version == 6)) {

		} else {

			$(".image-additional > a").hover(function() { 
				$(this).siblings().stop().animate({ opacity: .85 }, 500)}, function () {
					$(this).siblings().stop().animate({ opacity: 1 }, 300) }
			);

			$("#toggle_sidebar").hover(function() {
				$(".sidebar").stop().animate({ opacity: .55 }, 300)}, function () {
					$(".sidebar").stop().animate({ opacity: 1 }, 300)}
			);
		}


	/* ---------------------------------------------------------------------- */
	/*	Ajax Minicart
	/* ---------------------------------------------------------------------- */

		(function($){
			/* hoverIntent by Brian Cherne */
			$.fn.hoverIntent = function(f,g) {
				// default configuration options
				var cfg = {
					sensitivity: 7,
					interval: 100,
					timeout: 0
				};
				// override configuration options with user supplied object
				cfg = $.extend(cfg, g ? { over: f, out: g } : f );

				// instantiate variables
				// cX, cY = current X and Y position of mouse, updated by mousemove event
				// pX, pY = previous X and Y position of mouse, set by mouseover and polling interval
				var cX, cY, pX, pY;

				// A private function for getting mouse position
				var track = function(ev) {
					cX = ev.pageX;
					cY = ev.pageY;
				};

				// A private function for comparing current and previous mouse position
				var compare = function(ev,ob) {
					ob.hoverIntent_t = clearTimeout(ob.hoverIntent_t);
					// compare mouse positions to see if they've crossed the threshold
					if ( ( Math.abs(pX-cX) + Math.abs(pY-cY) ) < cfg.sensitivity ) {
						$(ob).unbind("mousemove",track);
						// set hoverIntent state to true (so mouseOut can be called)
						ob.hoverIntent_s = 1;
						return cfg.over.apply(ob,[ev]);
					} else {
						// set previous coordinates for next time
						pX = cX; pY = cY;
						// use self-calling timeout, guarantees intervals are spaced out properly (avoids JavaScript timer bugs)
						ob.hoverIntent_t = setTimeout( function(){compare(ev, ob);} , cfg.interval );
					}
				};

				// A private function for delaying the mouseOut function
				var delay = function(ev,ob) {
					ob.hoverIntent_t = clearTimeout(ob.hoverIntent_t);
					ob.hoverIntent_s = 0;
					return cfg.out.apply(ob,[ev]);
				};

				// A private function for handling mouse 'hovering'
				var handleHover = function(e) {
					// next three lines copied from jQuery.hover, ignore children onMouseOver/onMouseOut
					var p = (e.type == "mouseover" ? e.fromElement : e.toElement) || e.relatedTarget;
					while ( p && p != this ) { try { p = p.parentNode; } catch(e) { p = this; } }
					if ( p == this ) { return false; }

					// copy objects to be passed into t (required for event object to be passed in IE)
					var ev = jQuery.extend({},e);
					var ob = this;

					// cancel hoverIntent timer if it exists
					if (ob.hoverIntent_t) { ob.hoverIntent_t = clearTimeout(ob.hoverIntent_t); }

					// else e.type == "onmouseover"
					if (e.type == "mouseover") {
						// set "previous" X and Y position based on initial entry point
						pX = ev.pageX; pY = ev.pageY;
						// update "current" X and Y position based on mousemove
						$(ob).bind("mousemove",track);
						// start polling interval (self-calling timeout) to compare mouse coordinates over time
						if (ob.hoverIntent_s != 1) { ob.hoverIntent_t = setTimeout( function(){compare(ev,ob);} , cfg.interval );}

					// else e.type == "onmouseout"
					} else {
						// unbind expensive mousemove event
						$(ob).unbind("mousemove",track);
						// if hoverIntent state is true, then call the mouseOut function after the specified delay
						if (ob.hoverIntent_s == 1) { ob.hoverIntent_t = setTimeout( function(){delay(ev,ob);} , cfg.timeout );}
					}
				};

				// bind the function to the two event listeners
				return this.mouseover(handleHover).mouseout(handleHover);
			};
			
		})(jQuery);

		$(".cart-block").live("mouseenter", function() {
			if(!$(this).data('init'))
			{
				$(this).data('init', true);
				$(this).hoverIntent
				(
					function()
					{
						$('.cart-block > content').fadeIn(100);
						$(this).addClass('active');
						$(this).load('index.php?route=module/cart #cart > *');
					},

					function()
					{
						$('.cart-block > content').fadeOut(100);
						$(this).removeClass('active');
					}
				);
				$(this).trigger('mouseenter');
			}
		});		



	/* ---------------------------------------------------------------------- */
	/*	Language/Currency dropdowns
	/* ---------------------------------------------------------------------- */

		$('.dropd').click(function() {

			$(this).find('.options').slideDown('fast');
			$(this).addClass('active');

			$(this).bind('mouseleave', function() {
				$(this).find('.options').slideUp('fast');
				$(this).removeClass('active');
			});

		});

	/* ---------------------------------------------------------------------- */
	/*	Footer menu
	/* ---------------------------------------------------------------------- */

		$(".column .header").click(function () {

			$screensize = $(window).width();

			if ($screensize < 767) {
				$(this).toggleClass("active");  
				$(this).parent().find(".content").slideToggle('medium');
			}

		});


	/* ---------------------------------------------------------------------- */
	/*	Scroll to top
	/* ---------------------------------------------------------------------- */
	
		$().UItoTop({ 
			easingType: 'easeOutQuart',
			scrollSpeed: 1200
		});


	/* ---------------------------------------------------------------------- */
	/*	Toggle sidebar
	/* ---------------------------------------------------------------------- */
		
		$("#toggle_sidebar").click(function () {

			$(this).toggleClass("collapse");

			$(".sidebar").toggleClass("close");

			if ($("#maincontent").hasClass("middle")) {
				$("#maincontent").toggleClass('col-sm-6 col-sm-12');
			} else { 
				$("#maincontent").toggleClass('col-sm-9 col-sm-12');
			}

		});
	
	/* ---------------------------------------------------------------------- */
	/*	Tooltips
	/* ---------------------------------------------------------------------- */

		$('.tooltp').tooltip();


	/* ---------------------------------------------------------------------- */
	/*	Mobile menu
	/* ---------------------------------------------------------------------- */
		$('#mobileMenu').change(function(){
			if($(this).val() !== null){document.location.href = $(this).val()}
		});


	/* ---------------------------------------------------------------------- */
	/*	Accordion
	/* ---------------------------------------------------------------------- */

		$('.panel-default:first-child .accordion-toggle').addClass('active');

	    $('.panel-default').on('show.bs.collapse', function (e) {
	         $(e.target).prev('.panel-heading').find('.accordion-toggle').addClass('active');
	    });

	    $('.panel-default').on('hidden.bs.collapse', function (e) {
	        $(this).find('.accordion-toggle').not($(e.target)).removeClass('active');
	    });


	/* ---------------------------------------------------------------------- */
	/*	Tabs
	/* ---------------------------------------------------------------------- */

		$('#tabs a').tabs();


	/* ---------------------------------------------------------------------- */
	/*	Banners
	/* ---------------------------------------------------------------------- */

		var banner = function() {
			$('.banner').cycle({
				before: function(current, next) {
					$(next).parent().height($(next).outerHeight());
				}
			});
		}

		setTimeout(banner, 2000);


	/* ---------------------------------------------------------------------- */
	/*	Alert boxes
	/* ---------------------------------------------------------------------- */

		$('.success img, .warning img, .attention img, .information img').live('click', function() {
			$(this).parent().fadeOut('slow', function() {
				$(this).remove();
			});
		});	

});


	/* ---------------------------------------------------------------------- */
	/*	Same height for all grid boxes
	/* ---------------------------------------------------------------------- */

		// Adjust boxes height when the page is completely loaded
		$(window).load(function(){
			
			doAdjust = true;
			previousWidth = 0;
			adjustBoxHeights();
		
			// Raise doAdjust flag every time the window width changes

			$(window).resize(function() {
				var currentWidth = $(window).width();
				if (previousWidth != currentWidth) {
					doAdjust = true;
				}
				previousWidth = currentWidth;
			})

			// Run every half second

			$(function() {
				setInterval('maybeAdjust()', 500);
			});

		});

		
		// Check the doAdjust flag

		function maybeAdjust() {
			if (doAdjust) {
				adjustBoxHeights();
				doAdjust = false;
			}
		}

		// Loop through the DIVs and find the height of the tallest one, then loop again and set them all to that height

		function adjustBoxHeights() {
			var maxHeight = 0;
			$('.product-grid .grid-box, .content-top .product-box > div, .content-bottom .product-box > div').each(function(){
				$(this).height('auto');
				if (maxHeight < $(this).height()) {maxHeight = $(this).height()}
			});
			$('.product-grid .grid-box, .content-top .product-box > div, .content-bottom .product-box > div').each(function(){
				$(this).height(maxHeight);
			});
		}



	function getURLVar(urlVarName) {
		var urlHalves = String(document.location).toLowerCase().split('?');
		var urlVarValue = '';
		
		if (urlHalves[1]) {
			var urlVars = urlHalves[1].split('&');

			for (var i = 0; i <= (urlVars.length); i++) {
				if (urlVars[i]) {
					var urlVarPair = urlVars[i].split('=');
					
					if (urlVarPair[0] && urlVarPair[0] == urlVarName.toLowerCase()) {
						urlVarValue = urlVarPair[1];
					}
				}
			}
		}
		
		return urlVarValue;
	}

	/* ---------------------------------------------------------------------- */
	/*	Add to Cart
	/* ---------------------------------------------------------------------- */

		function addToCart(product_id, quantity) {
			quantity = typeof(quantity) != 'undefined' ? quantity : 1;

			$.ajax({
				url: 'index.php?route=checkout/cart/add',
				type: 'post',
				data: 'product_id=' + product_id + '&quantity=' + quantity,
				dataType: 'json',
				success: function(json) {
					$('.success, .warning, .attention, .information, .error').remove();
					
					if (json['redirect']) {
						location = json['redirect'];
					}
					
					if (json['success']) {

						$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/sellegance/images/close.png" alt="" class="close" /></div>');

						$('.success').fadeIn('slow');

						$('html, body').animate({ scrollTop: 0 }, 'slow');

						$('.cart-total').html(json['total']);

					}	
				}
			});
		}

	/* ---------------------------------------------------------------------- */
	/*	Add to Wishlist
	/* ---------------------------------------------------------------------- */

		function addToWishList(product_id) {
			$.ajax({
				url: 'index.php?route=account/wishlist/add',
				type: 'post',
				data: 'product_id=' + product_id,
				dataType: 'json',
				success: function(json) {
					$('.success, .warning, .attention, .information').remove();
								
					if (json['success']) {
						$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/sellegance/images/close.png" alt="" class="close" /></div>');
						
						$('.success').fadeIn('slow');
						
						$('#wishlist-total').html(json['total']);
						
						$('html, body').animate({ scrollTop: 0 }, 'slow');
					}	
				}
			});
		}

	/* ---------------------------------------------------------------------- */
	/*	Add to Compare
	/* ---------------------------------------------------------------------- */

		function addToCompare(product_id) { 
			$.ajax({
				url: 'index.php?route=product/compare/add',
				type: 'post',
				data: 'product_id=' + product_id,
				dataType: 'json',
				success: function(json) {
					$('.success, .warning, .attention, .information').remove();
								
					if (json['success']) {
						$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/sellegance/images/close.png" alt="" class="close" /></div>');
						
						$('.success').fadeIn('slow');
						
						$('#compare-total').html(json['total']);
						
						$('html, body').animate({ scrollTop: 0 }, 'slow'); 
					}	
				}
			});
		}

	/* ---------------------------------------------------------------------- */
	/*	Grid/List view
	/* ---------------------------------------------------------------------- */

		function display(view) {

			if (view == 'list') {

				$('#list').parent().addClass('active');
				$('#grid').parent().removeClass('active');

				$('.product-grid').toggleClass('product-grid product-list');
				
				$('.product-list > div').each(function(index, element) {

					$(this).height('auto');

					var special = $(element).find('.onsale').html();

					if (special != null) {
						html = '<span class="onsale">' + special  + '</span>';
						html += '<div class="row">';
					} else {
						html = '<div class="row">';
					}
				
					var image = $(element).find('.image').html();

					if (image != null) { 
						html += '<div class="col-sm-3"><div class="image">' + image + '</div></div>';
					} else {
						html += '<div class="col-sm-3"><div class="image">&nbsp;</div></div>';
					}
					
					html += '<div class="name-desc col-sm-4">';

					html += '<div class="name">' + $(element).find('.name').html() + '</div>';
					var rating = $(element).find('.rating').html();
					
					if (rating != null) {
						html += '<div class="rating">' + rating + '</div>';
					}
					html += '<div class="description">' + $(element).find('.description').html() + '</div>';

					var quickview = $(element).find('.quickview').html();
					
					if (quickview != null) {
						html += '<div class="quickview">' + quickview  + '</div>';
					}

					html += '</div>';
					
					var price = $(element).find('.price').html();
					
					if (price != null) {
						html += '<div class="price col-sm-2">' + price  + '</div>';
					} else {
						html += '<div class="price col-sm-2">&nbsp;</div>';
					}

					html += '<div class="actions col-sm-3">';
					html += '  <div class="cart">' + $(element).find('.cart').html() + '</div>';
					
					html += ' <div class="links">';
					
					var wishlist = $(element).find('.wishlist').html();
					if (wishlist != null) {
						html += '  <span class="wishlist">' + wishlist + '</span>';
					}

					var compare = $(element).find('.compare').html();
					if (compare != null) {
						html += '  <span class="compare">' + compare + '</span>';
					}
					html += '</div>';

					html += '</div>';

					html += '</div>';

								
					$(element).html(html);
				});
				
				$.totalStorage('display', 'list'); 

			} else {

				$('#grid').parent().addClass('active');
				$('#list').parent().removeClass('active');
				
				$('.product-list').toggleClass('product-list product-grid');
				
				$('.product-grid > div').each(function(index, element) {
					
					html = '';
					
					var image = $(element).find('.image').html();

					html += '<div class="inner">';

					var special = $(element).find('.onsale').html();
					
					if (special != null) {
						html += '<span class="onsale">' + special  + '</span>';
					}
					
					if (image != null) {
						html += '<div class="image">' + image + '</div>';
					}

					var special = $(element).find('.quickview').html();
					
					if (special != null) {
						html += '<div class="quickview">' + special  + '</div>';
					}
					
					html += '<div class="name">' + $(element).find('.name').html() + '</div>';

					html += '<div class="description">' + $(element).find('.description').html() + '</div>';
					
					var price = $(element).find('.price').html();
					
					if (price != null) {
						html += '<div class="price">' + price  + '</div>';
					}
								
					html += '<div class="cart">' + $(element).find('.cart').html() + '</div>';

					var rating = $(element).find('.rating').html();
					
					if (rating != null) {
						html += '<div class="rating">' + rating + '</div>';
					}
					
					html += ' <div class="links">';
					
					var wishlist = $(element).find('.wishlist').html();
					if (wishlist != null) {
						html += '  <span class="wishlist">' + wishlist + '</span>';
					}

					var compare = $(element).find('.compare').html();
					if (compare != null) {
						html += '  <span class="compare">' + compare + '</span>';
					}
					html += '</div>';

					html += '</div>';
					
					$(element).html(html);

				});
										
				$.totalStorage('display', 'grid');

				adjustBoxHeights();

			}

			$('.tooltp').tooltip();

		}

		view = $.totalStorage('display');



	/* ---------------------------------------------------------------------- */
	/*	Responsive video embeds
	/* ---------------------------------------------------------------------- */

		/*!
		* FitVids 1.0
		*
		* Copyright 2011, Chris Coyier - http://css-tricks.com + Dave Rupert - http://daverupert.com
		* Credit to Thierry Koblentz - http://www.alistapart.com/articles/creating-intrinsic-ratios-for-video/
		* Released under the WTFPL license - http://sam.zoy.org/wtfpl/
		*
		*/

		(function( $ ){

		  $.fn.fitVids = function( options ) {
		    var settings = {
		      customSelector: null
		    }

		    if ( options ) {
		      $.extend( settings, options );
		    }

		    return this.each(function(){
		      var selectors = [
		        "iframe[src*='player.vimeo.com']",
		        "iframe[src*='www.youtube.com']",
		        "iframe[src*='www.kickstarter.com']",
		        "object",
		        "embed"
		      ];

		      if (settings.customSelector) {
		        selectors.push(settings.customSelector);
		      }

		      var $allVideos = $(this).find(selectors.join(','));

		      $allVideos.each(function(){
		        var $this = $(this);
		        if (this.tagName.toLowerCase() == 'embed' && $this.parent('object').length || $this.parent('.fluid-width-video-wrapper').length) { return; }
		        var height = ( this.tagName.toLowerCase() == 'object' || $this.attr('height') ) ? $this.attr('height') : $this.height(),
		            width = $this.attr('width') ? $this.attr('width') : $this.width(),
		            aspectRatio = height / width;
		        if(!$this.attr('id')){
		          var videoID = 'fitvid' + Math.floor(Math.random()*999999);
		          $this.attr('id', videoID);
		        }
		        $this.wrap('<div class="fluid-width-video-wrapper"></div>').parent('.fluid-width-video-wrapper').css('padding-top', (aspectRatio * 100)+"%");
		        $this.removeAttr('height').removeAttr('width');
		      });
		    });
		  }
		})( jQuery );

		if($("body").hasClass("home") || $("body").hasClass("page_external")) { /*do nothing*/ }
		else { $(".container").fitVids(); }