var bounds = [];
var tiles = [];

bounds[0] = new google.maps.LatLngBounds(
 new google.maps.LatLng(45, -179.999999), new google.maps.LatLng(90, -135));

tiles[0] = new google.maps.GroundOverlay(
 "http://terramapadventure.com/MapTiles/solar-00.png", bounds[0]);

tiles[0].setOpacity(0.5);

tiles[0].setMap(map);


bounds[1] = new google.maps.LatLngBounds(
 new google.maps.LatLng(45, -135), new google.maps.LatLng(90, -90));

tiles[1] = new google.maps.GroundOverlay(
 "http://terramapadventure.com/MapTiles/solar-01.png", bounds[1]);

tiles[1].setOpacity(0.5);

tiles[1].setMap(map);


bounds[2] = new google.maps.LatLngBounds(
 new google.maps.LatLng(45, -90), new google.maps.LatLng(90, -45));

tiles[2] = new google.maps.GroundOverlay(
 "http://terramapadventure.com/MapTiles/solar-02.png", bounds[2]);

tiles[2].setOpacity(0.5);

tiles[2].setMap(map);


bounds[3] = new google.maps.LatLngBounds(
 new google.maps.LatLng(45, -45), new google.maps.LatLng(90, 0));

tiles[3] = new google.maps.GroundOverlay(
 "http://terramapadventure.com/MapTiles/solar-03.png", bounds[3]);

tiles[3].setOpacity(0.5);

tiles[3].setMap(map);


bounds[4] = new google.maps.LatLngBounds(
 new google.maps.LatLng(45, 0), new google.maps.LatLng(90, 45));

tiles[4] = new google.maps.GroundOverlay(
 "http://terramapadventure.com/MapTiles/solar-04.png", bounds[4]);

tiles[4].setOpacity(0.5);

tiles[4].setMap(map);


bounds[5] = new google.maps.LatLngBounds(
 new google.maps.LatLng(45, 45), new google.maps.LatLng(90, 90));

tiles[5] = new google.maps.GroundOverlay(
 "http://terramapadventure.com/MapTiles/solar-05.png", bounds[5]);

tiles[5].setOpacity(0.5);

tiles[5].setMap(map);


bounds[6] = new google.maps.LatLngBounds(
 new google.maps.LatLng(45, 90), new google.maps.LatLng(90, 135));

tiles[6] = new google.maps.GroundOverlay(
 "http://terramapadventure.com/MapTiles/solar-06.png", bounds[6]);

tiles[6].setOpacity(0.5);

tiles[6].setMap(map);


bounds[7] = new google.maps.LatLngBounds(
 new google.maps.LatLng(45, 135), new google.maps.LatLng(90, 180));

tiles[7] = new google.maps.GroundOverlay(
 "http://terramapadventure.com/MapTiles/solar-07.png", bounds[7]);

tiles[7].setOpacity(0.5);

tiles[7].setMap(map);


bounds[8] = new google.maps.LatLngBounds(
 new google.maps.LatLng(0, -179.999999), new google.maps.LatLng(45, -135));

tiles[8] = new google.maps.GroundOverlay(
 "http://terramapadventure.com/MapTiles/solar-08.png", bounds[8]);

tiles[8].setOpacity(0.5);

tiles[8].setMap(map);


bounds[9] = new google.maps.LatLngBounds(
 new google.maps.LatLng(0, -135), new google.maps.LatLng(45, -90));

tiles[9] = new google.maps.GroundOverlay(
 "http://terramapadventure.com/MapTiles/solar-09.png", bounds[9]);

tiles[9].setOpacity(0.5);

tiles[9].setMap(map);


bounds[10] = new google.maps.LatLngBounds(
 new google.maps.LatLng(0, -90), new google.maps.LatLng(45, -45));

tiles[10] = new google.maps.GroundOverlay(
 "http://terramapadventure.com/MapTiles/solar-10.png", bounds[10]);

tiles[10].setOpacity(0.5);

tiles[10].setMap(map);


bounds[11] = new google.maps.LatLngBounds(
 new google.maps.LatLng(0, -45), new google.maps.LatLng(45, 0));

tiles[11] = new google.maps.GroundOverlay(
 "http://terramapadventure.com/MapTiles/solar-11.png", bounds[11]);

tiles[11].setOpacity(0.5);

tiles[11].setMap(map);


bounds[12] = new google.maps.LatLngBounds(
 new google.maps.LatLng(0, 0), new google.maps.LatLng(45, 45));

tiles[12] = new google.maps.GroundOverlay(
 "http://terramapadventure.com/MapTiles/solar-12.png", bounds[12]);

tiles[12].setOpacity(0.5);

tiles[12].setMap(map);


bounds[13] = new google.maps.LatLngBounds(
 new google.maps.LatLng(0, 45), new google.maps.LatLng(45, 90));

tiles[13] = new google.maps.GroundOverlay(
 "http://terramapadventure.com/MapTiles/solar-13.png", bounds[13]);

tiles[13].setOpacity(0.5);

tiles[13].setMap(map);


bounds[14] = new google.maps.LatLngBounds(
 new google.maps.LatLng(0, 90), new google.maps.LatLng(45, 135));

tiles[14] = new google.maps.GroundOverlay(
 "http://terramapadventure.com/MapTiles/solar-14.png", bounds[14]);

tiles[14].setOpacity(0.5);

tiles[14].setMap(map);


bounds[15] = new google.maps.LatLngBounds(
 new google.maps.LatLng(0, 135), new google.maps.LatLng(45, 180));

tiles[15] = new google.maps.GroundOverlay(
 "http://terramapadventure.com/MapTiles/solar-15.png", bounds[15]);

tiles[15].setOpacity(0.5);

tiles[15].setMap(map);


bounds[16] = new google.maps.LatLngBounds(
 new google.maps.LatLng(-45, -179.999999), new google.maps.LatLng(0, -135));

tiles[16] = new google.maps.GroundOverlay(
 "http://terramapadventure.com/MapTiles/solar-16.png", bounds[16]);

tiles[16].setOpacity(0.5);

tiles[16].setMap(map);


bounds[17] = new google.maps.LatLngBounds(
 new google.maps.LatLng(-45, -135), new google.maps.LatLng(0, -90));

tiles[17] = new google.maps.GroundOverlay(
 "http://terramapadventure.com/MapTiles/solar-17.png", bounds[17]);

tiles[17].setOpacity(0.5);

tiles[17].setMap(map);


bounds[18] = new google.maps.LatLngBounds(
 new google.maps.LatLng(-45, -90), new google.maps.LatLng(0, -45));

tiles[18] = new google.maps.GroundOverlay(
 "http://terramapadventure.com/MapTiles/solar-18.png", bounds[18]);

tiles[18].setOpacity(0.5);

tiles[18].setMap(map);


bounds[19] = new google.maps.LatLngBounds(
 new google.maps.LatLng(-45, -45), new google.maps.LatLng(0, 0));

tiles[19] = new google.maps.GroundOverlay(
 "http://terramapadventure.com/MapTiles/solar-19.png", bounds[19]);

tiles[19].setOpacity(0.5);

tiles[19].setMap(map);


bounds[20] = new google.maps.LatLngBounds(
 new google.maps.LatLng(-45, 0), new google.maps.LatLng(0, 45));

tiles[20] = new google.maps.GroundOverlay(
 "http://terramapadventure.com/MapTiles/solar-20.png", bounds[20]);

tiles[20].setOpacity(0.5);

tiles[20].setMap(map);


bounds[21] = new google.maps.LatLngBounds(
 new google.maps.LatLng(-45, 45), new google.maps.LatLng(0, 90));

tiles[21] = new google.maps.GroundOverlay(
 "http://terramapadventure.com/MapTiles/solar-21.png", bounds[21]);

tiles[21].setOpacity(0.5);

tiles[21].setMap(map);


bounds[22] = new google.maps.LatLngBounds(
 new google.maps.LatLng(-45, 90), new google.maps.LatLng(0, 135));

tiles[22] = new google.maps.GroundOverlay(
 "http://terramapadventure.com/MapTiles/solar-22.png", bounds[22]);

tiles[22].setOpacity(0.5);

tiles[22].setMap(map);


bounds[23] = new google.maps.LatLngBounds(
 new google.maps.LatLng(-45, 135), new google.maps.LatLng(0, 180));

tiles[23] = new google.maps.GroundOverlay(
 "http://terramapadventure.com/MapTiles/solar-23.png", bounds[23]);

tiles[23].setOpacity(0.5);

tiles[23].setMap(map);


bounds[24] = new google.maps.LatLngBounds(
 new google.maps.LatLng(-90, -179.999999), new google.maps.LatLng(-45, -135));

tiles[24] = new google.maps.GroundOverlay(
 "http://terramapadventure.com/MapTiles/solar-24.png", bounds[24]);

tiles[24].setOpacity(0.5);

tiles[24].setMap(map);


bounds[25] = new google.maps.LatLngBounds(
 new google.maps.LatLng(-90, -135), new google.maps.LatLng(-45, -90));

tiles[25] = new google.maps.GroundOverlay(
 "http://terramapadventure.com/MapTiles/solar-25.png", bounds[25]);

tiles[25].setOpacity(0.5);

tiles[25].setMap(map);


bounds[26] = new google.maps.LatLngBounds(
 new google.maps.LatLng(-90, -90), new google.maps.LatLng(-45, -45));

tiles[26] = new google.maps.GroundOverlay(
 "http://terramapadventure.com/MapTiles/solar-26.png", bounds[26]);

tiles[26].setOpacity(0.5);

tiles[26].setMap(map);


bounds[27] = new google.maps.LatLngBounds(
 new google.maps.LatLng(-90, -45), new google.maps.LatLng(-45, 0));

tiles[27] = new google.maps.GroundOverlay(
 "http://terramapadventure.com/MapTiles/solar-27.png", bounds[27]);

tiles[27].setOpacity(0.5);

tiles[27].setMap(map);


bounds[28] = new google.maps.LatLngBounds(
 new google.maps.LatLng(-90, 0), new google.maps.LatLng(-45, 45));

tiles[28] = new google.maps.GroundOverlay(
 "http://terramapadventure.com/MapTiles/solar-28.png", bounds[28]);

tiles[28].setOpacity(0.5);

tiles[28].setMap(map);


bounds[29] = new google.maps.LatLngBounds(
 new google.maps.LatLng(-90, 45), new google.maps.LatLng(-45, 90));

tiles[29] = new google.maps.GroundOverlay(
 "http://terramapadventure.com/MapTiles/solar-29.png", bounds[29]);

tiles[29].setOpacity(0.5);

tiles[29].setMap(map);


bounds[30] = new google.maps.LatLngBounds(
 new google.maps.LatLng(-90, 90), new google.maps.LatLng(-45, 135));

tiles[30] = new google.maps.GroundOverlay(
 "http://terramapadventure.com/MapTiles/solar-30.png", bounds[30]);

tiles[30].setOpacity(0.5);

tiles[30].setMap(map);


bounds[31] = new google.maps.LatLngBounds(
 new google.maps.LatLng(-90, 135), new google.maps.LatLng(-45, 180));

tiles[31] = new google.maps.GroundOverlay(
 "http://terramapadventure.com/MapTiles/solar-31.png", bounds[31]);

tiles[31].setOpacity(0.5);

tiles[31].setMap(map);

