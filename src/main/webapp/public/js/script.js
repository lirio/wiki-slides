(function() {
	var url = document.location,
		linkScreen = document.querySelector('link[title=screen]'),
		linkProjection = document.querySelector('link[title=projection]'),
		shower = document.querySelector('div.shower'),
		slides = document.querySelectorAll('section.slide'),
		slideList = [], hashList = {},
		progress = document.querySelector('div.progress div'),
		fullscreen = false;

	for(var i = 0, slidesLength = slides.length; i < slidesLength; i++) {
		var id = slides[i].id;
		slideList[i] = '#' + id;
		hashList['#' + id] = i;
	}

	function toggleFull(force) {
		fullscreen = (typeof force == 'boolean') ? force : (
			window.fullScreen || // Firefox
			document.webkitFullScreen || // Webkit
			screen.width == window.outerWidth && screen.height == window.outerHeight
		);
		updateView();
		updateProgress();
	}

	function turnSlide(e) {
		if(!fullscreen) return;
		var current = hashList[url.hash],
			target;
		if(e == null) {
			target = slideList[current++];
		} else if(e.type == 'keyup') { // Key-Based
			switch(e.which) {
				case 33 : // PgUp
				case 38 : // Up
				case 37 : // Left
					current--;
					break;
				case 34 : // PgDown
				case 40 : // Down
				case 39 : // Right
					current++;
					break;
				case 36 : // Home
					current = 0;
					break;
				case 35 : // End
					current = slideList.length-1;
					break;
				case 32 : // Space
					current += e.shiftKey ? -1 : 1;
					break;
			}
			target = slideList[current];
			e.preventDefault();
		} else { // Specific
			target = slideList[+e || 0];
		}
		if(target) url.hash = target;
		updateProgress();
	}

	function updateView() {
		linkScreen.disabled = fullscreen;
		linkProjection.disabled = !fullscreen;
		if (fullscreen) {
			linkScreen.setAttribute('disabled', 'disabled');
			linkProjection.removeAttribute('disabled');
		} else {
			linkScreen.removeAttribute('disabled');
			linkProjection.setAttribute('disabled', 'disabled');
		}
		if(!hashList[url.hash]) turnSlide(0);
	}
	
	function updateProgress() {
		if(!progress) return;
		progress.style.width = (100/(slideList.length-1) * hashList[url.hash]).toFixed(2) + '%';
	}

	slides[0].addEventListener('click', function(){
		toggleFull(true);
	}, false);

	document.addEventListener('keyup', turnSlide, false);
	document.addEventListener('keyup', function(e) {
		if(e.which == 27) toggleFull(false);
	}, false);

	window.addEventListener('resize', toggleFull, false);
	window.addEventListener('DOMContentLoaded', toggleFull, false);
})();