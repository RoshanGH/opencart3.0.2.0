function resetOverlays() {
      var dialogs = $("div.ui-dialog");
      if(dialogs.length == 0)
      {
        $(".ui-widget-overlay").remove();
      }
}

function minicartDetailPopup(){
	$('#cart').addClass('active');
	$('#cart').load('index.php?route=module/cart #cart > *').hide().fadeIn('slow');
	setTimeout(function() {
		$('#cart .content').fadeOut('slow', function() {
        	$('#cart').removeClass('active');
      	});
	}, 6000);
}

function ajaxLoading () {
    // Called directly with HTML
	$.colorbox({html:'<div id="loadingdialog" style="display:block; min-width:300px;min-height:100px;"><span class="ajaxloading"><style>#cboxLoadingOverlay {display:block !important;} #cboxClose {display:none !important;} </style></span></div>',initialWidth:300,initialHeight:100,width:'auto',height:'auto',
	overlayClose: false,
	title:function(){
		$('#cboxLoadingOverlay').html('<style>#cboxLoadingOverlay {display:block !important;}</style>');
		$('#cboxLoadingGraphic').html('<style>#cboxLoadingGraphic {display:block !important;}</style>');
						
	},
	onClosed:function(){ 
		$('#cboxLoadingOverlay').html('');
		$('#cboxLoadingGraphic').html('');
	}
	});      
        
}

function ajaxDialog(url,c) {
		// Called directly, without assignment to an element:
		$.colorbox({
			href:url,
			initialWidth:300,
			initialHeight:100,
			height:760,
			maxWidth: 890,
			width:'100%',
			opacity: 0.45,
			overlayClose: true,
			onOpen:function(){ 
				$('#cboxLoadingOverlay').html('');
				$('#cboxLoadingGraphic').html('');
			},
			onLoad:function(){
				$('#colorbox').addClass('quickview-box');
				$('#cboxClose').hide();
			},
			onClosed:function(){ 
				$('#cboxLoadingOverlay').html('');
				$('#cboxLoadingGraphic').html('');
			},
			onComplete:function(){ 
				$('.colorbox').colorbox({
    				rel:'colorbox',
					opacity: 0.5,
					width:'auto',
					height:'auto',
					current:false,
					overlayClose: false,
					title:function(){
						$('#cboxLoadingOverlay').html('<style>#cboxLoadingOverlay {display:none !important;}</style>');
						$('#cboxLoadingGraphic').html('<style>#cboxLoadingGraphic {display:none !important;}</style>');
						
					},
					onClosed:function(){ 
						$('#cboxLoadingOverlay').html('');
						$('#cboxLoadingGraphic').html('');
					}
				});
				$('.cloud-zoom, .cloud-zoom-gallery').CloudZoom();
				$('#cboxClose').show();
			}
		});
        return false;
}

$(document).ready(function() {
	//Quick Buy link
	$('.product-grid .inner').live({
		mouseenter:function(){
			$(this).find('.quickview').css({"visibility":"visible"});
		},
		mouseleave:function(){
			$(this).find('.quickview').css({"visibility":"hidden"});
		}
	});
	$('.product-list > div').live({
		mouseenter:function(){
			$(this).find('.quickview').css({"visibility":"visible"});
		},
		mouseleave:function(){
			$(this).find('.quickview').css({"visibility":"hidden"});
		}
	});
	$('.product-box .inner').live({
		mouseenter:function(){
			$(this).find('.quickview').css({"visibility":"visible"});
			
		},
		mouseleave:function(){
			$(this).find('.quickview').css({"visibility":"hidden"});
			
		}
	});
	$('.product-slider ul li .inner').live({
	    mouseenter:function(){
	        $(this).find('.quickview').css({"visibility":"visible"});
	        
	    },
	    mouseleave:function(){
	        $(this).find('.quickview').css({"visibility":"hidden"});
	        
	    }
	});
});
