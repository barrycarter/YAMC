map.setCenter({ lat: 40, lng: -90 });
map.setZoom(4);

var rectangle = new google.maps.Rectangle({
  strokeColor: '#FF0000',
  strokeOpacity: 0.8,
  strokeWeight: 2,
  fillColor: '#FF0000',
  fillOpacity: 0.35,
  map: map,
  bounds: {
    north: 50,
    south: 25,
    east: -90,
    west: -120
  }
});


var bounds = { east: -60, west: -130, south: 20, north: 55 }
var rect = new google.maps.Rectangle({ bounds: bounds, strokeColor: '#00ffff', map: map, fillOpacity: 0});

