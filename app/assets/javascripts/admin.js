//= require jquery-1.7.1.min
//= require jquery-ui-1.8.16.custom.min
//= require jquery.cycle.all
//= require jquery_ujs

jQuery(function() {
	
	$(document).ready(function () { $(".validation-errors").slideDown(1000); });
	$(document).ready(function () { $(".confirmation").slideDown(1000); });
	
	$('#new-question').click(function(){
		$('.question-form').toggle('slow');
	})
	/*
	$('.pregunta').click(self,function(event){
		$('.respostes').hide('slow');
		$(this).children('div').toggle('slow');
	})*/
	
	$('#fade').cycle();
});