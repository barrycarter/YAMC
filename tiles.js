let tiles = [];

tiles['solar'] = [];
tiles['landuse'] = []; 

for (let i = 0; i < 32; i++) {
  let img = sprintf("https://terramapadventure.herokuapp.com/MapTiles/lcc-reduced-%02d.png", i);
  tiles['landuse'][i] = new google.maps.GroundOverlay(img, bounds[i]);
  img = sprintf("https://terramapadventure.herokuapp.com/MapTiles/solar-%02d.png", i);
  tiles['solar'][i] = new google.maps.GroundOverlay(img, bounds[i]);
}
