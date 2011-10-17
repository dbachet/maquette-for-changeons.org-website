// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function() {
	
	/* Using custom settings */
	$("a#write_as_login_link").fancybox({
		'hideOnContentClick': false,
		'onComplete'	:	function() {
			$('form#user_new[data-validate]').validate();
		}
	});
	
	// $("#tip3").fancybox({
	// 	'titlePosition'	:	'over',
	// 	'onComplete'	:	function() {
	// 		$("#fancybox-wrap").hover(function() {
	// 			$("#fancybox-title").show();
	// 		}, function() {
	// 			$("#fancybox-title").hide();
	// 		});
	// 	}
	// });
	
	// $('a#write_as_login_link').click(function(){
	// 	$('h2').text("ijijij");
	// 	$('form#user_new[data-validate]').validate();
	// })
	
	$('a#write_as_login_link').attr('href', '/sessions/fancy_comment_login')
	// $('div#fancybox-content meta').remove();
});