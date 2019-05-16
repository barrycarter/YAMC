function query(e) {
	console.log('button pressed');

	let lat = parseFloat(document.getElementById('latitude').value);
	let lng = parseFloat(document.getElementById('longitude').value);

	let url = `http://ws.terramapadventure.com:8080/geoserver/wfs?service=wfs&version=2.0.0&request=GetPropertyValue&bbox=${lat -
		1},${lng - 1},${lat + 1},${lng +
		1}&typeNames=TMA-YAMC:ne_10m_admin_1_states_provinces&valueReference=name_en`;

	console.log(url);

	axios
		.get(url)
		.then(res => {
			console.log(res.data);
		})
		.catch(err => {
			console.log('nope');
		});

	console.log(e, lat, lng);
}

document.getElementById('submit').addEventListener('click', query);

map = L.map('map', { crs: L.CRS.Simple });
map.fitBounds([[-90, -180], [90, 180]]);
map.on('zoomend', redraw_map);
map.on('moveend', redraw_map);

function redraw_map() {
	// TODO: this is bad

	map.eachLayer(function(layer) {
		layer.remove();
	});
	map.eachLayer(function(layer) {
		layer.remove();
	});

	let mapBounds = map.getBounds().toBBoxString();

	// TODO: fix height and width
	let url = `http://ows.terrestris.de/osm/service//wms?request=GetMap&service=WMS&version=1.1.1&layers=OSM-WMS&styles=default&srs=EPSG%3A4326&bbox=${mapBounds}&width=1600&height=800&format=image%2Fpng`;

	td(url, 'URL');

	L.imageOverlay(url, map.getBounds(), {
		opacity: 0.5,
	}).addTo(map);

	url = `http://ws.terramapadventure.com:8080/geoserver/TMA-YAMC/wms?SERVICE=WMS&VERSION=1.1.1&REQUEST=GetMap&FORMAT=image%2Fjpeg&TRANSPARENT=true&LAYERS=TMA-YAMC%3ABeck_KG_V1_present_0p0083&exceptions=application%2Fvnd.ogc.se_inimage&SRS=EPSG%3A4326&STYLES=&WIDTH=1600&HEIGHT=900&BBOX=${mapBounds}`;

	L.imageOverlay(url, map.getBounds(), {
		opacity: 0.5,
	}).addTo(map);

	// other interesting URLs
}
