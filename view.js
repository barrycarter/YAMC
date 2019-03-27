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

let rectWidth = gc.width / (2 * view.size + 1);
let rectHeight = gc.height / (2 * view.size + 1);

let px = Math.round((25 * (10 / (2 * view.size + 1)) * gc.width) / 1600);
ctx.font = `${px}px Times`;

for (let i = view.x - view.size; i <= view.x + view.size; i++) {
	for (let j = view.y - view.size; j <= view.y + view.size; j++) {
		let lx = rectWidth * (i - view.x + view.size);
		let ly = rectHeight * (j - view.y + view.size);
		let landType = Math.floor(Math.random() * 8);
		let color = '#' + land[landType].color.map(toHex).join('');
		let pos = '(' + i + ', ' + j + ')';

		ctx.fillStyle = color;
		ctx.fillRect(lx, ly, rectWidth, rectHeight);
		ctx.fillStyle = '#000000';
		ctx.fillText(pos, lx, ly);

		// leftmost rect has x = 0, rightmost rect has x = gc.width-rect size
		// gc.width * di / 2 / view.size

		if (!tileinfo[pos]) {
			tileinfo[pos] = Math.floor(Math.random() * 8);
		}
	}
}

function viewController(e) {
	let buttonStr = e.target.id;

	let oldView = {};
	Object.assign(oldView, view);

	//TODO: consider using switch here
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
	if (view.size < 1) {
		view.size = 1;
	}

	console.log('OLDVIEW', dump(oldView), '/OLDVIEW');
	console.log('VIEW', dump(view), '/VIEW');

	updateView(view, oldView);
}
