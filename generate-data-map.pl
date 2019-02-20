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

for $i (0..5399) {
  for $j (0..5399) {

    # this divides the return pixels by 256 to convert to 8-bit +
    # rejoins the first two elements

#    my(@var) = map($_ = floor($_/256), split(/\,\s*/, $image->Get('pixel[$i,$j]')));
    my(@var) = @{map($_ = floor($_/256), split(/\,\s*/, $image->Get('pixel[$i,$j]')))}[0..2];
    my($var) = join(",", @var);

    unless ($rgb2ltp{$var}) {warn "BAD TILE: $var";}
    debug("$i, $j", @var);
#    debug($image->getPixel(x => $i, y => $j));
  }
}

