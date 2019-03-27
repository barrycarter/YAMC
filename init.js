// our initial values
// Jakarta sucks, although the rest of Indonesia is AWESOME!

// set up objects to cache data
let tileinfo = {};
let userinfo = {};
let tiledata = {};

// the tile canvas
let gc = document.querySelector('#game-canvas');
let ctx = gc.getContext('2d');
ctx.textAlign = 'left';
ctx.textBaseline = 'top';

// define center location of view, map type, size, opacity
let latlon = { lat: -6.21461428490962, lon: 106.845115831203 };
let view = LatLon2XY(latlon);
view.size = 5;
view.type = 'landuse';
view.opacity = 0.5;

// this is 1/2 minute of arc
let epsilon = 360 / 43200;

// create google map and put it on page
let myOptions = {
	zoom: 5,
	center: new google.maps.LatLng(latlon.lat, latlon.lon),
	mapTypeId: google.maps.MapTypeId.ROADMAP,
	scaleControl: true,
	rotateControl: true,
	overviewMapControl: true
};

const mapDiv = document.querySelector('#google_map');
view.map = new google.maps.Map(mapDiv, myOptions);

// create the "red rectangle"
let rect = new google.maps.Rectangle({
	strokeColor: '#c90000',
	fillOpacity: 0,
	Bounds: {
		north: latlon.lat + epsilon * view.size,
		south: latlon.lat - epsilon * view.size,
		east: latlon.lon + epsilon * view.size,
		west: latlon.lon - epsilon * view.size
	}
});

updateView(view);

// setup buttons

let buttons = document.querySelectorAll('button');
for (var i = 0; i < buttons.length; i++) {
	buttons[i].addEventListener('click', viewController);
}

// TODO: deal with flicker problem on map

// determine which websocket we connect to by looking at #

var url = window.location.href;
var tag = url.substring(url.indexOf('#') + 1, url.length);

var ws;

if (tag == 'local') {
	ws = new WebSocket('ws://127.0.0.1:8000');
} else {
	ws = new WebSocket('wss://ws.terramapadventure.com:443');
}

console.log(ws);

// setup text box
var output = document.getElementById('response');
var tbox = document.querySelector('#box');
tbox.disabled = true;

ws.onmessage = function(event) {
	console.log(event);
	tbox.innerHTML += event.data + '\n';
};

var cmdLine = document.getElementById('command');
cmdLine.addEventListener('keydown', command);

function command(e) {
	if (e.key == 'Enter') {
		console.log('ALPHA', cmdLine.value);
		// TODO: don't hardcode my name
		var hash = { message: cmdLine.value, user: 'barrycarter' };
		console.log('BETA', JSON.stringify(hash));
		ws.send(JSON.stringify(hash));
		cmdLine.value = '';
	}
}
