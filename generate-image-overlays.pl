#!/bin/perl

# This program generates image overlays like in comments below for all
# 32 image tiles in MapTiles

require "/usr/local/lib/bclib.pl";

=item comment

 var imageBounds = new google.maps.LatLngBounds(
    new google.maps.LatLng(45,-179.99999),
    new google.maps.LatLng(90,-135));

 gl = new google.maps.GroundOverlay(
    "http://terramapadventure.com/MapTiles/lcc_west_00.png", imageBounds);
 gl.setOpacity(1);
 gl.setMap(map);


=cut

chdir("/home/user/20190125/YAMC/MapTiles")||die("Can't chdir");

# declare arrays

print << "MARK";
var bounds = {};
var tiles = {};
MARK
;

# TODO: change -180 to -179.9999 if needed
# TODO: create the bounds and tile arrays

# the first of the lcc_west tiles
$w = "00";
$count = 0;

for ($lat = 90; $lat > -90; $lat-=45) {
  for ($lon = -180; $lon < 0; $lon+=45) {

    # google doesn't like -180
    # one millionth of a degree ~ 11.1cm
    # plon = printed longitude
    if ($lon == -180) {$plon = -179.999999;} else {$plon = $lon;}

    my($ne) = join(", ",($lat, $lon+45));
    my($sw) = join(", ",($lat-45, $plon));

    print << "MARK"

bounds[$count] = new google.maps.LatLngBounds(
 new google.maps.LatLng($sw), new google.maps.LatLng($ne));

tiles[$count] = new google.maps.GroundOverlay(
 "http://terramapadventure.com/MapTiles/lcc_west_$w.png", bounds[$count]);

tiles[$count].setMap(map);

MARK
;
    $w++;
    $count++;
  }
}

# same thing for eastern tiles

$e = "00";

for ($lat = 90; $lat > -90; $lat-=45) {
  for ($lon = 0; $lon < 180; $lon+=45) {

    my($ne) = join(", ",($lat, $lon+45));
    my($sw) = join(", ",($lat-45, $lon));

    print << "MARK"

bounds[$count] = new google.maps.LatLngBounds(
 new google.maps.LatLng($sw), new google.maps.LatLng($ne));

tiles[$count] = new google.maps.GroundOverlay(
 "http://terramapadventure.com/MapTiles/lcc_east_$e.png", bounds[$count]);

tiles[$count].setMap(map);

MARK
;
    $e++;
    $count++;
  }
}
