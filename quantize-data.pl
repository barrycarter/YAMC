#!/bin/perl

require "/usr/local/lib/bclib.pl";

use Image::Magick;

my $image = Image::Magick->new;

# $image->Read("/home/user/20190125/YAMC/lcc.png");

# smaller image for testing
warn "TESTING";
$image->Read("/home/user/20190125/YAMC/MapTiles/lcc_west_05.png");


for $i (0..100) {
  for $j (0..100) {
    my($var) = $image->Get('pixel[$i,$j]');
    debug("$i, $j, $var");
    debug($image->getPixel(x => $i, y => $j));
  }
}

=item comment

Sample code from https://www.perlmonks.org/bare/?node_id=60662

my $IMimage = Image::Magick->new;
$IMimage->Read($filename); 
$readval=$IMimage->Get('pixel['.$xcount.','.$ycount.']');

=cut
