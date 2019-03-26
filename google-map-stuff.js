function setup_google_maps() {
	let gmapButtons = document.querySelectorAll('.gmap');

	for (var i = 0; i < gmapButtons.length; i++) {
		gmapButtons[i].addEventListener('click', changeGmap);
	}

	var rect = new google.maps.Rectangle({
		strokeColor: '#c90000',
		map: map,
		fillOpacity: 0
	});
}

function changeGmap(e) {
	console.log('changeGmap(', e, ') called');
	var buttonStr = e.target.id;

	// cap O = more opaque, small o = less opaque
	if (buttonStr == 'darker') {
		opac += 0.1;
	}
	if (buttonStr == 'lighter') {
		opac -= 0.1;
	}
	opac = Math.min(Math.max(opac, 0), 1);

	for (var i = 0; i < 31; i++) {
		tiles[maptype][i].setOpacity(opac);
	}
}
