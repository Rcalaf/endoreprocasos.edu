jQuery(function() {
	$('#sort-summary-pages').sortable({
		 update : function () {		
			var order = $("#sort-summary-pages").sortable('serialize');
			$("input#sort_data").val(order);
		  }
	});

	$('#sort-contents').sortable({
		 update : function () {		
			var order = $("#sort-contents").sortable('serialize');
			$("input#sort_data").val(order);
		  }
	});

	$('#sort-image-group-images').sortable({
		 update : function () {		
			var order = $("#sort-image-group-images").sortable('serialize');
			$("input#sort_data").val(order);
		  }
	});


	$('#sort-slideshow-images').sortable({
		 update : function () {		
			var order = $("#sort-slideshow-images").sortable('serialize');
			$("input#sort_data").val(order);
		  }
	});



	$(document).ready(function(){
	   $('.simpleTree li:not([class^=line]) > span').hover(function(){
			$('.simpleTree li:not([class^=line]) > a.delete').hide();
			$('.simpleTree li#'+this.parentNode.id+' > a.delete').show();
		});
	
		$('.simpleTree li[class^=line], .root').mouseleave(function(){
			$('.simpleTree li:not([class^=line]) > a.delete').hide();
		});		
	
		$('select#image-group-type').change(function(){
			$('input#content_image_group_type').val($('select#image-group-type').val());
		})
	});
});