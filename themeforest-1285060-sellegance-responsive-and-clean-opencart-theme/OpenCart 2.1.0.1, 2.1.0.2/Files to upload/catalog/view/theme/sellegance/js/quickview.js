$(document).ready(function() {

	$('.product-layout .product-thumb').on({
		mouseenter:function(){
			$(this).find('.quickview').css({"visibility":"visible"});
		},
		mouseleave:function(){
			$(this).find('.quickview').css({"visibility":"hidden"});
		}
	});

	$('.owl-carousel .item').on({
	    mouseenter:function(){
	        $(this).find('.quickview').css({"visibility":"visible"});
	        
	    },
	    mouseleave:function(){
	        $(this).find('.quickview').css({"visibility":"hidden"});
	        
	    }
	});
});
