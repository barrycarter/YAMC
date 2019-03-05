
function javascriptsucksballs(map) {

var tiles = [];
var bounds = [];

bounds[0] = new google.maps.LatLngBounds(
 new google.maps.LatLng(45, -179.999999), new google.maps.LatLng(90, -135));

tiles[0] = new google.maps.GroundOverlay(
 "https://terramapadventure.herokuapp.com/MapTiles/lcc_west_00.png", bounds[0]);

tiles[0].setOpacity(0.5);

tiles[0].setMap(map);


bounds[1] = new google.maps.LatLngBounds(
 new google.maps.LatLng(45, -135), new google.maps.LatLng(90, -90));

tiles[1] = new google.maps.GroundOverlay(
 "https://terramapadventure.herokuapp.com/MapTiles/lcc_west_01.png", bounds[1]);

tiles[1].setOpacity(0.5);

tiles[1].setMap(map);


bounds[2] = new google.maps.LatLngBounds(
 new google.maps.LatLng(45, -90), new google.maps.LatLng(90, -45));

tiles[2] = new google.maps.GroundOverlay(
 "https://terramapadventure.herokuapp.com/MapTiles/lcc_west_02.png", bounds[2]);

tiles[2].setOpacity(0.5);

tiles[2].setMap(map);


bounds[3] = new google.maps.LatLngBounds(
 new google.maps.LatLng(45, -45), new google.maps.LatLng(90, 0));

tiles[3] = new google.maps.GroundOverlay(
 "https://terramapadventure.herokuapp.com/MapTiles/lcc_west_03.png", bounds[3]);

tiles[3].setOpacity(0.5);

tiles[3].setMap(map);


bounds[4] = new google.maps.LatLngBounds(
 new google.maps.LatLng(0, -179.999999), new google.maps.LatLng(45, -135));

tiles[4] = new google.maps.GroundOverlay(
 "https://terramapadventure.herokuapp.com/MapTiles/lcc_west_04.png", bounds[4]);

tiles[4].setOpacity(0.5);

tiles[4].setMap(map);


bounds[5] = new google.maps.LatLngBounds(
 new google.maps.LatLng(0, -135), new google.maps.LatLng(45, -90));

tiles[5] = new google.maps.GroundOverlay(
 "https://terramapadventure.herokuapp.com/MapTiles/lcc_west_05.png", bounds[5]);

tiles[5].setOpacity(0.5);

tiles[5].setMap(map);


bounds[6] = new google.maps.LatLngBounds(
 new google.maps.LatLng(0, -90), new google.maps.LatLng(45, -45));

tiles[6] = new google.maps.GroundOverlay(
 "https://terramapadventure.herokuapp.com/MapTiles/lcc_west_06.png", bounds[6]);

tiles[6].setOpacity(0.5);

tiles[6].setMap(map);


bounds[7] = new google.maps.LatLngBounds(
 new google.maps.LatLng(0, -45), new google.maps.LatLng(45, 0));

tiles[7] = new google.maps.GroundOverlay(
 "https://terramapadventure.herokuapp.com/MapTiles/lcc_west_07.png", bounds[7]);

tiles[7].setOpacity(0.5);

tiles[7].setMap(map);


bounds[8] = new google.maps.LatLngBounds(
 new google.maps.LatLng(-45, -179.999999), new google.maps.LatLng(0, -135));

tiles[8] = new google.maps.GroundOverlay(
 "https://terramapadventure.herokuapp.com/MapTiles/lcc_west_08.png", bounds[8]);

tiles[8].setOpacity(0.5);

tiles[8].setMap(map);


bounds[9] = new google.maps.LatLngBounds(
 new google.maps.LatLng(-45, -135), new google.maps.LatLng(0, -90));

tiles[9] = new google.maps.GroundOverlay(
 "https://terramapadventure.herokuapp.com/MapTiles/lcc_west_09.png", bounds[9]);

tiles[9].setOpacity(0.5);

tiles[9].setMap(map);


bounds[10] = new google.maps.LatLngBounds(
 new google.maps.LatLng(-45, -90), new google.maps.LatLng(0, -45));

tiles[10] = new google.maps.GroundOverlay(
 "https://terramapadventure.herokuapp.com/MapTiles/lcc_west_10.png", bounds[10]);

tiles[10].setOpacity(0.5);

tiles[10].setMap(map);


bounds[11] = new google.maps.LatLngBounds(
 new google.maps.LatLng(-45, -45), new google.maps.LatLng(0, 0));

tiles[11] = new google.maps.GroundOverlay(
 "https://terramapadventure.herokuapp.com/MapTiles/lcc_west_11.png", bounds[11]);

tiles[11].setOpacity(0.5);

tiles[11].setMap(map);


bounds[12] = new google.maps.LatLngBounds(
 new google.maps.LatLng(-90, -179.999999), new google.maps.LatLng(-45, -135));

tiles[12] = new google.maps.GroundOverlay(
 "https://terramapadventure.herokuapp.com/MapTiles/lcc_west_12.png", bounds[12]);

tiles[12].setOpacity(0.5);

tiles[12].setMap(map);


bounds[13] = new google.maps.LatLngBounds(
 new google.maps.LatLng(-90, -135), new google.maps.LatLng(-45, -90));

tiles[13] = new google.maps.GroundOverlay(
 "https://terramapadventure.herokuapp.com/MapTiles/lcc_west_13.png", bounds[13]);

tiles[13].setOpacity(0.5);

tiles[13].setMap(map);


bounds[14] = new google.maps.LatLngBounds(
 new google.maps.LatLng(-90, -90), new google.maps.LatLng(-45, -45));

tiles[14] = new google.maps.GroundOverlay(
 "https://terramapadventure.herokuapp.com/MapTiles/lcc_west_14.png", bounds[14]);

tiles[14].setOpacity(0.5);

tiles[14].setMap(map);


bounds[15] = new google.maps.LatLngBounds(
 new google.maps.LatLng(-90, -45), new google.maps.LatLng(-45, 0));

tiles[15] = new google.maps.GroundOverlay(
 "https://terramapadventure.herokuapp.com/MapTiles/lcc_west_15.png", bounds[15]);

tiles[15].setOpacity(0.5);

tiles[15].setMap(map);


bounds[16] = new google.maps.LatLngBounds(
 new google.maps.LatLng(45, 0), new google.maps.LatLng(90, 45));

tiles[16] = new google.maps.GroundOverlay(
 "https://terramapadventure.herokuapp.com/MapTiles/lcc_east_00.png", bounds[16]);

tiles[16].setMap(map);

tiles[16].setOpacity(0.5);


bounds[17] = new google.maps.LatLngBounds(
 new google.maps.LatLng(45, 45), new google.maps.LatLng(90, 90));

tiles[17] = new google.maps.GroundOverlay(
 "https://terramapadventure.herokuapp.com/MapTiles/lcc_east_01.png", bounds[17]);

tiles[17].setMap(map);

tiles[17].setOpacity(0.5);


bounds[18] = new google.maps.LatLngBounds(
 new google.maps.LatLng(45, 90), new google.maps.LatLng(90, 135));

tiles[18] = new google.maps.GroundOverlay(
 "https://terramapadventure.herokuapp.com/MapTiles/lcc_east_02.png", bounds[18]);

tiles[18].setMap(map);

tiles[18].setOpacity(0.5);


bounds[19] = new google.maps.LatLngBounds(
 new google.maps.LatLng(45, 135), new google.maps.LatLng(90, 180));

tiles[19] = new google.maps.GroundOverlay(
 "https://terramapadventure.herokuapp.com/MapTiles/lcc_east_03.png", bounds[19]);

tiles[19].setMap(map);

tiles[19].setOpacity(0.5);


bounds[20] = new google.maps.LatLngBounds(
 new google.maps.LatLng(0, 0), new google.maps.LatLng(45, 45));

tiles[20] = new google.maps.GroundOverlay(
 "https://terramapadventure.herokuapp.com/MapTiles/lcc_east_04.png", bounds[20]);

tiles[20].setMap(map);

tiles[20].setOpacity(0.5);


bounds[21] = new google.maps.LatLngBounds(
 new google.maps.LatLng(0, 45), new google.maps.LatLng(45, 90));

tiles[21] = new google.maps.GroundOverlay(
 "https://terramapadventure.herokuapp.com/MapTiles/lcc_east_05.png", bounds[21]);

tiles[21].setMap(map);

tiles[21].setOpacity(0.5);


bounds[22] = new google.maps.LatLngBounds(
 new google.maps.LatLng(0, 90), new google.maps.LatLng(45, 135));

tiles[22] = new google.maps.GroundOverlay(
 "https://terramapadventure.herokuapp.com/MapTiles/lcc_east_06.png", bounds[22]);

tiles[22].setMap(map);

tiles[22].setOpacity(0.5);


bounds[23] = new google.maps.LatLngBounds(
 new google.maps.LatLng(0, 135), new google.maps.LatLng(45, 180));

tiles[23] = new google.maps.GroundOverlay(
 "https://terramapadventure.herokuapp.com/MapTiles/lcc_east_07.png", bounds[23]);

tiles[23].setMap(map);

tiles[23].setOpacity(0.5);


bounds[24] = new google.maps.LatLngBounds(
 new google.maps.LatLng(-45, 0), new google.maps.LatLng(0, 45));

tiles[24] = new google.maps.GroundOverlay(
 "https://terramapadventure.herokuapp.com/MapTiles/lcc_east_08.png", bounds[24]);

tiles[24].setMap(map);

tiles[24].setOpacity(0.5);


bounds[25] = new google.maps.LatLngBounds(
 new google.maps.LatLng(-45, 45), new google.maps.LatLng(0, 90));

tiles[25] = new google.maps.GroundOverlay(
 "https://terramapadventure.herokuapp.com/MapTiles/lcc_east_09.png", bounds[25]);

tiles[25].setMap(map);

tiles[25].setOpacity(0.5);


bounds[26] = new google.maps.LatLngBounds(
 new google.maps.LatLng(-45, 90), new google.maps.LatLng(0, 135));

tiles[26] = new google.maps.GroundOverlay(
 "https://terramapadventure.herokuapp.com/MapTiles/lcc_east_10.png", bounds[26]);

tiles[26].setMap(map);

tiles[26].setOpacity(0.5);


bounds[27] = new google.maps.LatLngBounds(
 new google.maps.LatLng(-45, 135), new google.maps.LatLng(0, 180));

tiles[27] = new google.maps.GroundOverlay(
 "https://terramapadventure.herokuapp.com/MapTiles/lcc_east_11.png", bounds[27]);

tiles[27].setMap(map);

tiles[27].setOpacity(0.5);


bounds[28] = new google.maps.LatLngBounds(
 new google.maps.LatLng(-90, 0), new google.maps.LatLng(-45, 45));

tiles[28] = new google.maps.GroundOverlay(
 "https://terramapadventure.herokuapp.com/MapTiles/lcc_east_12.png", bounds[28]);

tiles[28].setMap(map);

tiles[28].setOpacity(0.5);


bounds[29] = new google.maps.LatLngBounds(
 new google.maps.LatLng(-90, 45), new google.maps.LatLng(-45, 90));

tiles[29] = new google.maps.GroundOverlay(
 "https://terramapadventure.herokuapp.com/MapTiles/lcc_east_13.png", bounds[29]);

tiles[29].setMap(map);

tiles[29].setOpacity(0.5);


bounds[30] = new google.maps.LatLngBounds(
 new google.maps.LatLng(-90, 90), new google.maps.LatLng(-45, 135));

tiles[30] = new google.maps.GroundOverlay(
 "https://terramapadventure.herokuapp.com/MapTiles/lcc_east_14.png", bounds[30]);

tiles[30].setMap(map);

tiles[30].setOpacity(0.5);


bounds[31] = new google.maps.LatLngBounds(
 new google.maps.LatLng(-90, 135), new google.maps.LatLng(-45, 180));

tiles[31] = new google.maps.GroundOverlay(
 "https://terramapadventure.herokuapp.com/MapTiles/lcc_east_15.png", bounds[31]);

tiles[31].setMap(map);

tiles[31].setOpacity(0.5);

return tiles;
}
