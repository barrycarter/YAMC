#!/bin/perl

# Reads the map from the BIN files created using yamc-create-master-map.pl

# The virtual image is 43200x21600, pixels from 0 to 1 under those values

# The BIN files are ~500M each and too large to put into git (and
# probably not useful there)

# TODO: statement above is up for discussion

# TODO: currently reads from two files, but will merge these

# Initial usage (will change): x,y pixel to retrieve

require "/usr/local/lib/bclib.pl";
require "/sites/YAMC/game-lib.pl";

# this large file is NOT in /sites/YAMC in git
open(A, "/home/user/20190125/westeast.bin");

test1();

die "TESTING";

my($x, $y);

# for $x (3000..4000) {
#  for $y (5000..6000) {
#    my($val) = get_pixel_value($x,$y);
#    debug("$x, $y, $val");
#  }
# }

# random tests

for $i (1..1000000) {
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
  my($val, $flag);

  if ($x >= 21600) {$flag = 1;} else {$flag = 0;}

  my($pos) = $y*21600 + $x + $flag*466560000;
  debug("POS: $pos");

  # TODO: hardcoding `A` here is probably bad
  seek(A, $pos, 0);
  my($ret) = read(A, $val, 1);
  return ord($val);
}

# test draws tasmania and others for testing

sub test1 {

#  my($sx, $sy, $ex, $ey) = (38812, 15458, 39487, 16210);
#  my($sx, $sy, $ex, $ey) = (11812, 7552, 12150, 7856);
  my($sx, $sy, $ex, $ey) = (21600, 4605, 21937, 4819);


  print "new\n";
  print "size ",$ex-$sx+1,",",$ey-$sy+1,"\n";
  
  for ($i = $sx; $i <= $ex; $i++) {
    for ($j = $sy; $j <= $ey; $j++) {
      my($pix) = get_pixel_value($i,$j);
      debug("PIX: $pix");
      my($color) = $landcolors[$pix];
      my($px) = $i-$sx;
      my($py) = $j-$sy;
      print "setpixel $px,$py,$color\n";
    }
  }
}
  
