"use strict";
$(".bottom-menu>ul>li").click(function() {
	$(".bottom-menu>ul>li")
		.removeClass("hactive")
		.removeClass("cactive")
		.removeClass("sactive")
		.removeClass("nactive")
		.removeClass("mactive");
});
$(".home").click(function() {
	$(this).addClass('hactive');
});
$(".classification").click(function() {
	$(this).addClass('cactive');
});
$(".shopcenter").click(function() {
	$(this).addClass('sactive');
});
$(".news").click(function() {
	$(this).addClass('nactive');
});
$(".my").click(function() {
	$(this).addClass('mactive');
});