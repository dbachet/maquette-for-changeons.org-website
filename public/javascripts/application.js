// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function() {
	
	/* Using custom settings */
	$("a#write_as_login_link").fancybox({
		'hideOnContentClick': false
	});
	
	$('a#write_as_login_link').attr('href', '/sessions/fancy_comment_login')
	// $('div#fancybox-content meta').remove();
});