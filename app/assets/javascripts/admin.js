
//= require jquery-1.7.1.min
//= require jquery-ui-1.8.16.custom.min
//= require jquery.simple.tree.rc
//= require jquery.cycle.all
//= require admin_rc
//= require jquery_ujs

jQuery(function() {
	
	$(document).ready(function () { $(".validation-errors").slideDown(1000); });
	$(document).ready(function () { $(".confirmation").slideDown(1000); });
	

	
	
	
	
	/* Edit page */
	
	$('#show-in-menu').click(function() {
		if ( $('#show-in-menu').is(':checked') ) { 
			$('#show-in-sitemap').attr("disabled",true).prop("checked", true);
		}
		
		else { $('#show-in-sitemap').removeAttr("disabled"); };
	});
	
	
	
	/* 
		Edit contents
		
		Make prettier:
			- only one function (called on document ready and on select change)
			- get value from select option so it doesn't have to be explicitly mentioned here
	*/
	
	
	$('select#content-type').change(function() {
		$('div.content-type-form').hide();
		$('div#save-content-submit').show();
		if ( $('select#content-type').val()=='text' ) { $('div#text').show(); }
		else if ( $('select#content-type').val()=='embed' ) { $('div#embed').show(); }
		else if ( $('select#content-type').val()=='big-image' ) { $('div#big-image').show(); }
		else if ( $('select#content-type').val()=='small-image' ) { $('div#small-image').show(); }
		else if ( $('select#content-type').val()=='image-group' ) { $('div#image-group').show(); $('div#save-content-submit').hide(); }
		else if ( $('select#content-type').val()=='slideshow' ) { $('div#slideshow').show(); $('div#save-content-submit').hide(); }
		else if ( $('select#content-type').val()=='download' ) { $('div#download').show(); }
		else if ( $('select#content-type').val()=='child-summary' ) { $('div#child-summary').show(); }
		else if ( $('select#content-type').val()=='custom-summary' ) { $('div#custom-summary').show(); $('div#save-content-submit').hide(); };
	});
	
	$(document).ready(function () {
		$('div.content-type-form').hide();
		$('div#save-content-submit').show();
		if ( $('select#content-type').val()=='text' ) { $('div#text').show(); }
		else if ( $('select#content-type').val()=='embed' ) { $('div#embed').show(); }
		else if ( $('select#content-type').val()=='big-image' ) { $('div#big-image').show(); }
		else if ( $('select#content-type').val()=='small-image' ) { $('div#small-image').show(); }
		else if ( $('select#content-type').val()=='image-group' ) { $('div#image-group').show(); $('div#save-content-submit').hide(); }
		else if ( $('select#content-type').val()=='slideshow' ) { $('div#slideshow').show(); $('div#save-content-submit').hide(); }
		else if ( $('select#content-type').val()=='download' ) { $('div#download').show(); }
		else if ( $('select#content-type').val()=='child-summary' ) { $('div#child-summary').show(); }
		else if ( $('select#content-type').val()=='custom-summary' ) { $('div#custom-summary').show(); $('div#save-content-submit').hide(); };
	});
	
	
	
});