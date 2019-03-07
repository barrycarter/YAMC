const gmapButtons = document.querySelectorAll(".gmap");
for (var i = 0; i < gmapButtons.length; i++) {gmapButtons[i].addEventListener("click", changeGmap);}

var myLatLng = new google.maps.LatLng(36.1041666666, -5.5458333333);
 var myOptions = {zoom: 10, center: myLatLng,
  mapTypeId: google.maps.MapTypeId.ROADMAP, scaleControl: true,
  rotateControl: true, overviewMapControl: true};
 var map = new google.maps.Map(document.getElementById("google_map"), myOptions);

var tiles = javascriptsucksballs(map);

var rect = new google.maps.Rectangle({strokeColor: '#00ffff', map: map, fillOpacity: 0});


function changeGmap(e) {
  var buttonStr = e.target.id

  // solar or landuse map
  if (buttonStr == "solar") {solar_energy_tiles(map); return;}
  if (buttonStr == "landuse") {land_use_tiles(map); return;}

  // get opacity of tile 0 (representative)
  o = tiles[0].getOpacity();

  // cap O = more opaque, small o = less opaque
  if (buttonStr == "darker") {o+=0.1;}
  if (buttonStr == "lighter") {o-=0.1;}
  o = Math.min(Math.max(o, 0), 1);

  for (var i=0; i < tiles.length; i++) {
    console.log(`setting opacity of ${i} to ${o}`);
    tiles[i].setOpacity(o);
  }

}
