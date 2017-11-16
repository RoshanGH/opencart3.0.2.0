/*  
Theme Name: Sellegance
Version: 1.7.1 / 2.3.0.2, 3.0.2.0
*/

$(document).ready(function(){

	/* Quick View */

	$("a[rel^='mp-quickview']").magnificPopup({
		type:'ajax'
	});
	

	/* Search */

	$('.btn-search').bind('click', function() {
		url = $('base').attr('href') + 'index.php?route=product/search';
		var value = $('header input[name=\'search\']').val();
		if (value) {
			url += '&search=' + encodeURIComponent(search);
		}
		location = url;
	});
	
	$('#header input[name=\'search\']').bind('keydown', function(e) {
		if (e.keyCode == 13) {
			url = $('base').attr('href') + 'index.php?route=product/search';
			var value = $('#header input[name=\'search\']').val();
			if (value) {
				url += '&search=' + encodeURIComponent(value);
			}
			location = url;
		}
	});

	$('#header .search-trigger').click(function(e) {
		e.preventDefault();
		if ($('#header .search-area').hasClass('open')) {
			$('#header .search-area').fadeOut('fast');
			$('#header .search-area').removeClass('open');
		} else {
			$('#header .search-area').fadeIn('fast', function(){				
				$(this).find('input').focus();
				$(this).addClass('open');
			});
		}
		return false;
	});

	$('#header .search-area-close a').click(function() {
		$('#header .search-area').fadeOut('fast');
		$('#header .search-area').removeClass('open');
		return false;
	});	



	/* Top Menu */

	$('#menu .dropdown-menu').each(function() {
		var menu = $('#menu .navbar').offset();
		var dropdown = $(this).parent().offset();

		var i = (dropdown.left + $(this).outerWidth()) - (menu.left + $('#menu .navbar').outerWidth());

		if (i > 0) {
			$(this).css('margin-left', '-' + (i + 10) + 'px');
		}
	});


	/* Footer menu */

	$(".column .header").click(function () {

		$screensize = $(window).width();

		if ($screensize < 767) {
			$(this).toggleClass("active");  
			$(this).parent().find(".content").slideToggle('medium');
		}

	});


	/* Scroll to top */
	
	$().UItoTop({ 
		easingType: 'easeOutQuart',
		scrollSpeed: 1200
	});

	
	/* Tooltips */

	$('.tooltp').tooltip();


	/* Accordion */

	$('.panel-default:first-child .accordion-toggle').addClass('active');

  $('.panel-default').on('show.bs.collapse', function (e) {
       $(e.target).prev('.panel-heading').find('.accordion-toggle').addClass('active');
  });

  $('.panel-default').on('hidden.bs.collapse', function (e) {
      $(this).find('.accordion-toggle').not($(e.target)).removeClass('active');
  });


	// Add slidedown & fadein animation to dropdown
	$('.dropdown').on('show.bs.dropdown', function(e){
	  var $dropdown = $(this).find('.dropdown-menu');
	  var orig_margin_top = parseInt($dropdown.css('margin-top'));
	  $dropdown.css({'margin-top': (orig_margin_top + 10) + 'px', opacity: 0}).animate({'margin-top': orig_margin_top + 'px', opacity: 1}, 300, function(){
	     $(this).css({'margin-top':''});
	  });
	});

});


/* Same height for all grid boxes */

// Adjust boxes height when the page is completely loaded
$(window).load(function(){
	
	doAdjust = true;
	previousWidth = 0;
	adjustBoxHeights(); // Uncomment to run the function

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
		adjustBoxHeights(); // Uncomment to run the function
		doAdjust = false;
	}
}

// Loop through the DIVs and find the height of the tallest one, then loop again and set them all to that height

function adjustBoxHeights() {
	var maxHeight = 0;
	$('.product-grid .caption, .home-top-full h4.name, .content-top h4.name, .content-bottom h4.name').each(function(){
		$(this).height('auto');
		if (maxHeight < $(this).height()) {maxHeight = $(this).height()}
	});
	$('.product-grid .caption, .home-top-full h4.name, .content-top h4.name, .content-bottom h4.name').each(function(){
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


/* Responsive video embeds */

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
