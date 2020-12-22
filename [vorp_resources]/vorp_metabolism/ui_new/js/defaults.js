$("document").ready(function() {

	var sizeWater = 224.90;
	var sizeFood = 240.0;

	if ($(window).width() == 1920 && $(window).height() == 1080) {

	} else if ($(window).height() != 1080) {
		sizeWater = (($(window).height() * sizeWater) / 1080);
		sizeFood = (($(window).height() * sizeFood) / 1080);
	}

	var barwater = $('.water');
	var barfood = $('.food');

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
			$('.water').fadeOut();
			$('.food').fadeOut();
		} else if (event.data.action == "show") {
			$('.water').fadeIn();
			$('.food').fadeIn();
		}
	});

});