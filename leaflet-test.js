var map;

function initmap() {
  map = new L.Map('map', {crs: L.CRS.EPSG4326});
  // map = new L.Map('map');
  // map = new L.Map('map', {crs: L.CRS.Simple});

  var osmUrl='https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png';
  var osm = new L.TileLayer(osmUrl, {minZoom: 0, maxZoom: 20});
  map.setView(new L.LatLng(0,0),3);
  map.addLayer(osm);

  var imageUrl = 'http://data.barrycarter.info/grid.png';
  imageBounds = [[-89, -179], [89, 179]];
  L.imageOverlay(imageUrl, imageBounds).addTo(map);

}
