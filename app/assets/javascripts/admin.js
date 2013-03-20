//= require jquery-1.7.1.min
//= require jquery-ui-1.8.16.custom.min
//= require jquery_ujs

jQuery(function() {
	
	$(document).ready(function () { $(".notification").slideDown(1000); });
	$(document).ready(function () {
		if ($('.notification')){
			setTimeout(function(){$('.notification').slideUp(1000,function(){$(".notification").remove(); })},5000);
		}
	});
	

	$('#sort-pages').sortable({
		 update : function () {		
			var order = $("#sort-pages").sortable('serialize');
			$.post('/admin/pages/sort', {'sort_data':order});
		  }
	});
	
	$('#sort-contents').sortable({
		 update : function () {		
			var order = $("#sort-contents").sortable('serialize');
			$.post('/admin/contents/sort', {'sort_data':order});
		  }
	});
	

	$(document).ready(function () {
		$('.alumni').click(function(){
			$('.password').hide('slow');
		});

		$('.teacher').click(function(){
			$('.password').show('slow');
		});
	});

	$(document).ready(function () {
		$('.sub_questions').hide();
		$('.sub_questions:last').show();	
	});
	
	$('.pregunta').click(function (){
		$('.sub_questions').hide();	
		$('#resposta_'+$(this).attr('id')).show('slow');
	})

	$(document).ready(function () {
		
		$('.add_content_menu li').click(function(){
			$('#text').removeClass("active");
			$('#image').removeClass("active");
			$('#embed').removeClass("active");
			switch($(this).attr('id')){
				case 'image':
				  $(this).addClass("active");
			  	  $('.text').hide();
				  $('.embed').hide();
				  $('.image').show('slow');
				  $('#content_content_type').attr('value','image');
				  break;
				case 'embed':
				  $(this).addClass("active");
			  	  $('.text').hide();
				  $('.image').hide();
				  $('.embed').show('slow');
				  $('#content_content_type').attr('value','embed');
				  break;
				default:
				  $(this).addClass("active");
				  $('.image').hide();
				  $('.embed').hide();
				  $('.text').show('slow');
				  $('#content_content_type').attr('value','text');
			}
		});
	});



});