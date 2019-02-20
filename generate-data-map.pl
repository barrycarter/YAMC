#!/bin/perl

# this program generates the datamap which gives the solar values and
# land types for each tile in the game (43200 x 21600 of them)

require "/usr/local/lib/bclib.pl";
require "/sites/YAMC/game-lib.pl";

use Image::Magick;

my $image = Image::Magick->new;

# read smaller image for testing

warn "TESTING";
$image->Read("/sites/YAMC/MapTiles/lcc_west_05.png");

# 3150, 900 to 4000, 1500 is know to have various land types so testing there

for $y (900..1500) {
  for $x (3150..4000) {
    my($str) = join("", "pixel[", $x, ",", $y, "]");
    debug("STR: $str");
    my($a) = $image->Get($str);
    my($b) = $image->Get($str);
    my($c) = $image->getPixel(x => $j, y => $i);
    my($d) = $image->getPixel(x => $i, y => $j);
    debug("$a, $b, $c, $d");
  }
}

die "TESTING";

for $i (0..5399) {
  for $j (0..5399) {

    # $image->Get returns values that are 256x the values I need + returns
    # a 4th alpha value I don't need; this fixes all that
    my(@var) = map($_ = floor($_/256), split(/\,\s*/, $image->Get('pixel[$j,$i]')));
    my($var) = join(",", @var[0..2]);

    my($type) = $rgb2ltp{$var};
    $type=~s/^.*?\|//;
    if (length($type) == 0) {warn "BAD TILE: $var";}

    # avoid printing dull values
#    if ($type == 0) {next;}

    debug("$j, $i, $type, $var");
    debug($image->getPixel(x => $j, y => $i));
  }
}

