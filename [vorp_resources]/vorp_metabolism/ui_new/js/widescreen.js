$("document").ready(function() {

	var sizeWater = 224.90;
	var sizeFood = 240.0;

	if ($(window).width() == 2560 && $(window).height() == 1080) {

	} else if ($(window).height() != 1080) {
		sizeWater = (($(window).height() * sizeWater) / 1080);
		sizeFood = (($(window).height() * sizeFood) / 1080);
	}

	var barwater = $('.water-wide');
	var barfood = $('.food-wide');

		barwater.circleProgress({
		value: 0.0,
		size: sizeWater,
		thickness: 4,
		fill: {
		gradient: ['#05D5EA']
		},
	});
		barfood.circleProgress({
		value: 0.0,
		size: sizeFood,
		thickness: 4,
		fill: {
		color: ['#FF5733']
		},
	});

	window.addEventListener("message", function(event) {
		if (event.data.action == "update") {
			barwater.circleProgress('value', event.data.water);
			barfood.circleProgress('value', event.data.food);
		} else if (event.data.action == "hide") {
			$('.water-wide').fadeOut();
			$('.food-wide').fadeOut();
		} else if (event.data.action == "show") {
			$('.water-wide').fadeIn();
			$('.food-wide').fadeIn();
		}
	});

});