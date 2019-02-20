#!/bin/perl

# creates level 7 slippy tiles from lcc.png

# TODO: extend to create level n tiles from solar map as well

require "/usr/local/lib/bclib.pl";

for $x (0..127) {
  for $y (0..127) {
    debug("XY: $x, $y");
    for $i (0..255) {
      for $j (0..255) {
	my($lat, $lon) = slippy2latlon($x, $y, 7, $i, $j);
      }
    }
  }
}

