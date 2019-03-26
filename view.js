/*
The view consists of:

x, y: where the view is centered in pixels
size: number of pixels on each side
type: landuse or solar
opacity: opacity of map

map: the google map we want to update
*/

function updateView(view, oldView) {
	let latlon = XY2LatLon(view);
	view.map.center = new google.maps.LatLng(latlon.lat, latlon.lon);

	rect.setBounds({
		north: latlon.lat + epsilon * view.size,
		south: latlon.lat - epsilon * view.size,
		east: latlon.lon + epsilon * view.size,
		west: latlon.lon - epsilon * view.size
	});

	rect.setMap(view.map);

	let antitype = view.type == 'solar' ? 'landuse' : 'solar';

	for (let i = 0; i < 32; i++) {
		tiles[antitype][i].setMap(null);
		tiles[view.type][i].setMap(view.map);
		tiles[view.type][i].setOpacity(view.opacity);
	}
}

function viewController(e) {
	let buttonStr = e.target.id;

	let oldView = {};
	Object.assign(oldView, view);

	if (buttonStr == 'minus') {
		view.size++;
	}
	if (buttonStr == 'plus') {
		view.size--;
	}
	if (buttonStr == 'west') {
		view.x--;
	}
	if (buttonStr == 'east') {
		view.x++;
	}
	if (buttonStr == 'north') {
		view.y--;
	}
	if (buttonStr == 'south') {
		view.y++;
	}
	if (buttonStr == 'solar') {
		view.type = 'solar';
	}
	if (buttonStr == 'landuse') {
		view.type = 'landuse';
	}
	if (buttonStr == 'darker') {
		view.opacity += 0.1;
	}
	if (buttonStr == 'lighter') {
		view.opacity -= 0.1;
	}
	view.opacity = Math.min(Math.max(view.opacity, 0), 1);

	console.log('OLDVIEW', dump(oldView), '/OLDVIEW');
	console.log('VIEW', dump(view), '/VIEW');

	updateView(view, oldView);
}
