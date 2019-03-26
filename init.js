// our initial values
// Jakarta sucks, although the rest of Indonesia is AWESOME!
let latlon = {lat: -6.21461428490962, lon: 106.845115831203};

let view = LatLon2XY(latlon);
view.size = 60;
view.type = "landuse";
view.opacity = 0.5;

let epsilon = 360/43200;

let myOptions = {
	  zoom: 5,
	  center: new google.maps.LatLng(latlon.lat, latlon.lon),
  	mapTypeId: google.maps.MapTypeId.ROADMAP,
	  scaleControl: true,
	  rotateControl: true,
	  overviewMapControl: true
};

let rect = new google.maps.Rectangle({
	strokeColor: '#c90000',
	fillOpacity: 0,
  Bounds: {
		north: latlon.lat + epsilon*view.size,
		south: latlon.lat - epsilon*view.size,
		east: latlon.lon + epsilon*view.size,
		west: latlon.lon - epsilon*view.size
	}});


