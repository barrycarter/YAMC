#!/bin/perl

# version 2 does the same thing for reduced color tiles

# This program generates image overlays like in comments below for all
# 32 reduced color image tiles in MapTiles

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

chdir("/sites/YAMC/MapTiles")||die("Can't chdir");

# declare arrays

print << "MARK";
var bounds = [];
var tiles = [];
MARK
;

# the first of the tiles
$w = "00";
$count = 0;

for ($lat = 90; $lat > -90; $lat-=45) {
  for ($lon = -180; $lon < 180; $lon+=45) {

    # one millionth of a degree ~ 11.1cm
    # plon = printed longitude
    # google dislikes west bounds of -180
    if ($lon == -180) {$plon = -179.999999;} else {$plon = $lon;}

    my($ne) = join(", ",($lat, $lon+45));
    my($sw) = join(", ",($lat-45, $plon));

    print << "MARK"

bounds[$count] = new google.maps.LatLngBounds(
 new google.maps.LatLng($sw), new google.maps.LatLng($ne));

tiles[$count] = new google.maps.GroundOverlay(
 "http://terramapadventure.com/MapTiles/lcc-reduced-$w.png", bounds[$count]);

tiles[$count].setOpacity(0.5);

tiles[$count].setMap(map);

MARK
;
    $w++;
    $count++;
  }
}
