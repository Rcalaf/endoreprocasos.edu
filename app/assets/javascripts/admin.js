//= require jquery-1.7.1.min
//= require jquery-ui-1.8.16.custom.min
//= require jquery.fancybox.pack
//= require jquery_ujs

jQuery(function() {
	
	$(document).ready(function () { $(".notification").slideDown(1000); });
	$(document).ready(function () {
		if ($('.notification')){
			setTimeout(function(){$('.notification').slideUp(1000,function(){$(".notification").remove(); })},5000);
		}
	});
	
	$(document).ready(function() {
	    $(".box").fancybox({
	          helpers: {
	              title : {
	                  type : 'float'
	              }
	          }
	      });
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
	
	
	$('#group').sortable({
		 update : function () {		
			var order = $("#group").sortable('serialize');
			$.post('/admin/contents/sort', {'sort_data':order});
		  }
	});
	

	$(document).ready(function () {
		if ($('.alumni').attr('checked') == 'checked') {
			$('.password').hide('slow');
		}
		
		$('.alumni').click(function(){
			$('.password').hide('slow');
		});

		$('.teacher').click(function(){
			$('.password').show('slow');
		});
	});
	
	$(document).ready(function () {
		if ($('.status > select').attr('value') == 'admin') {
			$('.promocion').hide('slow');
		}
		
		$('.status > select').change(function(){
			if ($('.status > select').attr('value') == 'admin') {
				$('.promocion').hide('slow');
			}else{
				$('.promocion').show('slow');
			}
		});
	});
	
	
	$(document).ready(function(){
		if($('#page_home').prop('checked')){
			$('#page_public').prop('checked',false);
			$('#page_public').prop('disabled',true);
		}
	});
	
	$('#page_home').click(function(){
		if($('#page_home').prop('checked')){
			$('#page_public').prop('checked',false);
			$('#page_public').prop('disabled',true);
		}else{
			$('#page_public').prop('disabled',false);	
		}
	});
	

	$(document).ready(function () {
		$('.sub_questions').hide();
		$('.sub_questions:last').slideDown();	
	});
	
	$('.pregunta').click(function (){
		$('.sub_questions').hide();	
		$('#resposta_'+$(this).attr('id')).slideDown('slow');
	})

	$(document).ready(function () {
		
		$('.add_content_menu li a').click(function(){
			$('#text').removeClass("active");
			$('#image').removeClass("active");
			$('#image-text').removeClass("active");
			$('#embed').removeClass("active");
			switch($(this).attr('id')){
				case 'image':
				  $(this).addClass("active");
			  	  $('.new-text').hide();
				  $('.new-embed').hide();
				  $('.new-image-text').hide();
				  $('.new-image').show('slow');
				  $('#content_content_type').attr('value','image');
				  break;
				case 'image-text':
				  $(this).addClass("active");
			  	  $('.new-text').hide();
				  $('.new-embed').hide();
				  $('.new-image').hide();
				  $('.new-image-text').show('slow');
				  $('#content_content_type').attr('value','image-text');
				  break;
				case 'embed':
				  $(this).addClass("active");
			  	  $('.new-text').hide();
				  $('.new-image').hide();
				  $('.new-image-text').hide();
				  $('.new-embed').show('slow');
				  $('#content_content_type').attr('value','embed');
				  break;
				case 'text':
				  $(this).addClass("active");
				  $('.new-image').hide();
				  $('.new-embed').hide();
				  $('.new-image-text').hide();
				  $('.new-text').show('slow');
				  $('#content_content_type').attr('value','text');
			}
		});
	});



});