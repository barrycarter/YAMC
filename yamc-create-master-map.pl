#!/bin/perl

# TODO: normalize paths to these libs
require "/usr/local/lib/bclib.pl";
require "/home/user/20190125/YAMC/game-lib.pl";

# this is the new hash of values for the "Barry Carter Simplified Proposal"

# the new types and numbers I am assigning to them and icky colors I
# am giving them

# TODO: cleanup colors using ImageMagick, xv, or similar

# water/error = 0 (blue)
# forest = 1 (green)
# grasslands = 2 (yellow)
# wetlands = 3 (cyan)
# croplands = 4 (orange)
# urban = 5 (red)
# snow/ice = 6 (white)
# barren = 7 (gray50)

# this hash converts from the old number to the simplified number

my(%simplify) = (
		 0 => 0,
		 1 => 1, 2 => 1, 3 => 1, 4 => 1, 5 => 1,
		 6 => 2, 7 => 2, 8 => 2, 9 => 2, 10 => 2,
		 11 => 3,
		 12 => 4, 14 => 4,
		 13 => 5, 15 => 6, 16 => 7,
		 31 => 0);

# hash just for numbers (using char codes)

my(%rgb2chr);

for $i (keys %rgb2ltp) {
  my($val) = $simplify{$rgb2ltp{$i}};
  $val=~s/^.*\|//;
  $rgb2chr{$i} = chr($val);
  debug("*$i* -> *$val*");
}

debug(%rgb2chr);

die "TESTING";

while (<>) {
  unless (/\(([\s\d\,]+)\)/) {warn "BAD LINE: $_"; next;}
  my($val) = $1;
  $val=~s/\s//g;
  unless (defined($rgb2chr{$val})) {die ("BAD VAL: $_");}
  print $rgb2chr{$val};
}

# TODO: assign short names to be first caps of each word
# TODO: check for conflict
# TODO: convert to JS?

=item comments

The files east.txt and west.txt are generated via:

convert lcc_east_1km.tif east.txt
convert lcc_west_1km.tif west.txt

Format: last 5 bit are land type (0-16 = 17 values)

bit 6 = extra info available

bits 7 and 8 = currently unused (set to 0)


This command helps find different colors fast:

bc-fastrand.pl --n=100 west.txt | perl -anle 'print join(" ",@F[1..3])' | sort -u


Pixel to byte conversion:

west.txt: 43200*y + x
east.txt: 43200*y + x + 21600

=cut
