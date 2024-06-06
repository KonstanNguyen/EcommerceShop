
var element = document.querySelector('.countDownDate');
var dataAttribute = element.getAttribute('data-value');

console.log(dataAttribute);
var countDownDate = new Date(dataAttribute).getTime();

// Update the count down every 1 second
var x = setInterval(function() {

	// Get today's date and time
	var now = new Date().getTime();

	// Find the distance between now and the count down date
	var distance = countDownDate - now;

	// Time calculations for days, hours, minutes and seconds
	var days = Math.floor((distance / (1000 * 60 * 60 * 24)) > 0 ? distance / (1000 * 60 * 60 * 24) : 0);
	var hours = Math.floor(((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60)) > 0 ? (distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60) : 0);
	var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60) > 0 ? (distance % (1000 * 60 * 60)) / (1000 * 60) : 0);
	var seconds = Math.floor(((distance % (1000 * 60)) / 1000) > 0 ? (distance % (1000 * 60)) / 1000 : 0);

	document.getElementById("day").innerHTML = days;
	document.getElementById("hour").innerHTML = hours;
	document.getElementById("min").innerHTML = minutes;
	document.getElementById("sec").innerHTML = seconds;

	// If the count down is finished, write some text
	if (distance < 0) {
		clearInterval(x);
		document.getElementById("EXPIRED").innerHTML = "EXPIRED";
	}
}, 1000);