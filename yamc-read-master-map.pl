#!/bin/perl

# Reads the map from the BIN files created using yamc-create-master-map.pl

# The virtual image is 43200x21600, pixels from 0 to 1 under those values

# The BIN files are ~500M each and too large to put into git (and
# probably not useful there)

# TODO: statement above is up for discussion

# TODO: currently reads from two files, but will merge these

# Initial usage (will change): x,y pixel to retrieve

require "/usr/local/lib/bclib.pl";

open(A, "/home/user/20190125/west.bin");
open(B, "/home/user/20190125/east.bin");

my($x, $y);

# random tests

for $i (1..100) {
  $x = int(rand(43200));
  $y = int(rand(21600));
  my($val) = get_pixel_value($x, $y);
  debug("$x, $y, $val");
}

# TODO: this file will eventually reside on a server, not local

# gets value of given pixel, assumes A and B are both open filehandles
# and A is west.bin and B is east.bin

sub get_pixel_value {

  my($x, $y) = @_;
  my($fh, $val);

  if ($x >= 21600) {$fh = B; $x-=21600;} else {$fh = A;}

  my($pos) = $y*21600 + $x;
  debug("POS: $pos");

  seek($fh, $pos, 0);
  my($ret) = read($fh, $val, 1);
  return ord($val);
}
