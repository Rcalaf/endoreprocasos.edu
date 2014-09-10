//= require jquery-1.7.1.min
//= require jquery-ui-1.8.16.custom.min
//= require jquery.fancybox.pack
//= require jquery_ujs


jQuery(function() {

	$(document).ready(function() {
	    $(".box").fancybox({
			 width: '500',
	          helpers: {
	              title : {
	                  type : 'float'
					  
	              }
	          }
	      });
	});
	
	$('.teacher').click(function(){
		$('.teacher').toggle();
		$(this).show();
		//$(this).toggleClass('wide')
		$(this).find('.read').toggle();	
		$(this).find('.back').toggle();	
		$(this).find('.teacher_header').toggleClass('wide').toggleClass('list')
		$(this).find('.cv').toggle();
		$(document).scrollTop(0);
	});
	
});