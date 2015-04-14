# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
//create the dropdown base
$("select />").appemdTo("nav");

//Create default option "Go to..."
$("<option /", {
	"selected": "selected",
	"value" : "",
	"text" : "Go to..."
}).appendTo("nav select");

//Populate dropdown with menu items
$("nav a").each(function() {
	var el = $(this);
	$("<option />" , {
	var el = $(this);
	$("option />", {
		"value" : el.attr("href"),
		"text" : el.text()
	}).appendTo("nav select");
	});

	$("nav select").change(function(){
		window.location = $(this).find("option:selected").val();
	});