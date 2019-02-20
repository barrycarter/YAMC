#!/bin/perl

# Generates a solar map (16 shades) from the AAIGRID data

require "/usr/local/lib/bclib.pl";

# the file has 13806 rows of 43200 pixels each, representing latitudes
# -55 to +60 (first 6 rows are header rows)

# I used 'split -l 6906` to split the original file into two pieces
# before uploading it to github to avoid large file issues

open(A, "bzcat /home/user/20190125/YAMC/Data/PVOUT-[12].asc.bz2|");

# NOTE: image will come out upside-down but can easily be rectified

# fly needs this
print << "MARK";
new
size 43200,21600
setpixel 0,0,0,0,0
MARK
;

# this fills in black for latitudes 90 to 60

for ($y=0; $y<3600; $y++) {
  for $x (0..43199) {
    print "setpixel $x,$y,0,0,0\n";
  }
}

while (<A>) {

  my(@pts) = split(/\s+/, $_);

  # ignore first few lines which have no useful data
  unless (scalar(@pts) == 43200) {next;}

  # determine colors for each pt (-9999 = NA = 0)
  for $i (0..$#pts) {
    if ($pts[$i] == -9999) {$pts[$i] = 0;}

    # leave pure 0 (and rare less than 0 errors) as black
    if ($pts[$i] <= 0) {next;}

    # this converts 5.527, the 99th percentile, to 16 and
    # 2.464, the 1st percentile to 1 so our floor result is 1-15
    # we need to reserve 0 for the black dots

    my($level) = floor(($pts[$i]-2.464)/(5.527-2.464)*15+1);
    if ($level > 15) {$level = 15;}
    if ($level < 1) {$level = 1;}

    # hue range: 0 = red = highest; 3/4 = dark violet = lowest
    my($h) = 3/4 - 3*($level-1)/56;

    debug("H: $h");

    # this is fake, but useful
    my($rgb) = hsv2rgb($h, 1, 1, "format=decimal");

    # print it for fly
    print "setpixel $i,$y,$rgb\n";
#    debug("$pts[$i] -> $level -> $h -> $rgb");
  }
  $y++;
  print STDERR "Y: $y\n";
}

# this fills in black for latitudes -90 to -55

for ($y=17400; $y<21600; $y++) {
  for $x (0..43199) {
    print "setpixel $x,$y,0,0,0\n";
  }
}


