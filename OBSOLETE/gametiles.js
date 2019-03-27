

/*
const buttons = document.querySelectorAll('button');
for (var i = 0; i < buttons.length; i++) {
	buttons[i].addEventListener('click', changeCanvas);
}

*/

function changeCanvas(e) {
	var buttonStr = e.target.id;
	if (buttonStr == 'minus') {
		n++;
	}
	if (buttonStr == 'plus') {
		n--;
	}
	if (buttonStr == 'west') {
		istart--;
	}
	if (buttonStr == 'east') {
		istart++;
	}
	if (buttonStr == 'north') {
		jstart--;
	}
	if (buttonStr == 'south') {
		jstart++;
	}
	if (buttonStr == 'solar') {
		maptype = 'solar';
		for (var i = 0; i < 32; i++) {
			tiles['landuse'][i].setMap(null);
			tiles['solar'][i].setMap(map);
			tiles['solar'][i].setOpacity(opac);
		}
	}

	if (buttonStr == 'landuse') {
		maptype = 'landuse';
		for (var i = 0; i < 32; i++) {
			tiles['solar'][i].setMap(null);
			tiles['landuse'][i].setMap(map);
			tiles['landuse'][i].setOpacity(opac);
		}
	}
	console.log(dump(e.target.id));

	var lat = map.getCenter().lat();
	var lon = map.getCenter().lng();

	var epsilon = (0.1 * n) / 10;

	rect.setBounds({
		north: lat + epsilon,
		south: lat - epsilon,
		east: lon + epsilon,
		west: lon - epsilon
	});

	drawTiles(n);
}

var lt = [];
var c = document.querySelector('#game-canvas');
var ctx = c.getContext('2d');
ctx.textAlign = 'center';
ctx.textBaseline = 'middle';
var n = 10;
var istart = 0;
var jstart = 0;

function drawTiles(n) {
	px = Math.round((25 * (10 / n) * c.width) / 1600);
	ctx.font = `${px}px Times`;

	for (i = istart; i < istart + n; i++) {
		for (j = jstart; j < jstart + n; j++) {
			width = c.width / n;
			height = c.height / n;
			pos = i + ',' + j;
			if (!lt[pos]) {
				lt[pos] = Math.floor(Math.random() * 8);
			}

			var color = '#' + land[lt[pos]].color.map(toHex).join('');
			ctx.fillStyle = color;
			ctx.fillRect((i - istart) * width, (j - jstart) * height, width, height);
			ctx.fillStyle = '#000000';
			tx = (i - istart + 0.5) * width;
			ty = (j - jstart + 0.5) * height;
			t = `${land[lt[pos]].type} 2\u231B`;
			ctx.fillText(t, tx, ty);
		}
	}
}
drawTiles(n);
