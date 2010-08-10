$(function () {

	// Open external links in a new window
	$('a[rel*="external"]').click( function() {
		window.open( $(this).attr('href') );
		return false;
	});

	// Menu hover
	$('#menu .hover').css("opacity","0").hover(function () {
		$(this).stop().animate({ opacity: 1 });
	},
	function () {
		$(this).stop().animate({ opacity: 0	});
	});
	
	// Menu onClick
	$('#menu a').click(function () {
		$(this).parent('li').siblings().find('a .on').fadeOut();
		$(this).find('.on').fadeIn();
	});

	// Networks hover
	$('.networks .wrap .left, .networks .wrap .right').hover(function () {
		$(this).find('.hover').fadeIn();
	},
	function () {
		$(this).find('.hover').fadeOut();
	});
	
	// Menu action
	$('#menu a').click(function() {		
		var section = $(this).attr('class');
		$('#title .img').fadeOut();
		$('#title .'+section).fadeIn();
		$('#slider .content:visible').slideUp(function() {
			$('#slider .'+section).slideDown();
		});

	});

	// Language switcher
	$('div#lang ul li:even').addClass('alt');
	$('div#lang div.menu_head').click(function () {
		$('div#lang ul').slideToggle('medium', function() {
			$('div#lang div.menu_head').toggleClass('open');
		});
	});

	var yadda = $('#yadda-box');
	$('#footer .more').toggle(function() {
		$(yadda).stop().animate({left:0, opacity:1},'slow', 'easeOutBounce').fadeIn();
		$(this).toggleClass('open');
	},
	function() {
		$(yadda).stop().animate({left:50, opacity:0},'slow');
		$(this).toggleClass('open');
	});



});


// Load functions
$(window).load(function() {
	$('#yadda-box').css('opacity', 0);
    $('#menu .about .on').fadeIn('slow');
    $('#view').fadeIn('slow');
});

