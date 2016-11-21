//= require jquery-1.7.1.min
//= require jquery-ui-1.8.16.custom.min
//= require jquery_ujs
//= require jquery.easing.1.3
//= require jquery.prettyPhoto
//= require jquery.sticky 
//= require jquery.stellar.min
//= require waypoints.min
//= require timber.master.min
//= require template-functions
//= require jquery.fancybox.pack


function sliderHeight(){
		
	wh = $(window).height();
	$('#slide1').css({height:wh});
	
}

function mymargtop() {
	var body_h = $(window).height();
	var container_h = $('.filtr_bg').height();	
	var marg_top = Math.abs((body_h - container_h)/2);	
	$('.filtr_bg').css('margin-top', marg_top);
	$('.filtr_bg').css('margin-bottom', marg_top);
}



jQuery(document).ready(function ($) {

    $(".box").fancybox({
		 width: '500',
          helpers: {
              title : {
                  type : 'float'
				  
              }
          }
      });

    $(window).stellar();

    var links = $('.navigation').find('.top-menu');
	console.log(links);
    slide = $('.slide');
    button = $('.button');
    mywindow = $(window);
    htmlbody = $('html,body');
	
	/**/	
	if (mywindow.scrollTop() < 1) {
		$('.navigation li[data-slide="1"]').addClass('active');
	}
	/**/


    slide.waypoint(function (event, direction) {

        dataslide = $(this).attr('data-slide');

        if (direction === 'down') {
            $('.navigation li[data-slide="' + dataslide + '"]').addClass('active').prev().removeClass('active');
			
			$('.navigation li[data-slide="1"]').removeClass('active');
			
        }
        else {
            $('.navigation li[data-slide="' + dataslide + '"]').addClass('active').next().removeClass('active');
        }

    });
 
    mywindow.scroll(function () {
        if (mywindow.scrollTop() == 0) {
            $('.navigation li[data-slide="1"]').addClass('active');
            $('.navigation li[data-slide="2"]').removeClass('active');
        }
    });

    /*function goToByScroll(dataslide) {
        htmlbody.animate({
            scrollTop: $('.slide[data-slide="' + dataslide + '"]').offset().top + 2
        }, 2000, 'easeInOutQuint');
    }*/
      
      
	
	function goToByScroll(dataslide) {
		var goal = $('.slide[data-slide="' + dataslide + '"]').offset().top;
		if (mywindow.scrollTop()<goal) {
			var goalPx = goal + 5;
		} else {
			var goalPx = goal - 76;
		}
        htmlbody.animate({
            scrollTop: goalPx
        }, 2000, 'easeInOutQuint');
    }


    links.click(function (e) {
        e.preventDefault();
        dataslide = $(this).attr('data-slide');
        goToByScroll(dataslide);
    });

    button.click(function (e) {
        e.preventDefault();
        dataslide = $(this).attr('data-slide');
        goToByScroll(dataslide);

    });
	
	
	// Sticky Navigation	
		$(".menu").sticky({topSpacing:0});
    
  //accordion
  	$(".accordion h3").eq(0).addClass("active");
  	$(".accordion .accord_cont").eq(0).show();

  	$(".accordion h3").click(function(){
  		$(this).next(".accord_cont").slideToggle("slow")
  		.siblings(".accord_cont:visible").slideUp("slow");
  		$(this).toggleClass("active");
  		$(this).siblings("h3").removeClass("active");
  	});
		
	//prettyPhoto
		$("a[rel^='prettyPhoto']").prettyPhoto();
	
	
	
	sliderHeight();
	
	mymargtop ();
	
	/*$("#slide1, #slide3, #slide5, #slide7").each(function () {
        var slide_h = $(this).height();
		
		$(this).css('background-size', '100% '+slide_h+'px');
		
    });*/
	
});

$(window).bind('resize',function() {
		
	//Update slider height
	sliderHeight();
	
	mymargtop ();
	
});





