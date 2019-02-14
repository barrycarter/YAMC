#!/bin/perl

# TODO: normalize paths to these libs
require "/usr/local/lib/bclib.pl";
require "/home/user/20190125/YAMC/game-lib.pl";

# hash just for numbers (using char codes)

my(%rgb2chr);

for $i (keys %rgb2ltp) {
  my($val) = $rgb2ltp{$i};
  $val=~s/^.*\|//;
  $rgb2chr{$i} = chr($val);
  debug("*$i* -> *$val*");
}

debug(%rgb2chr);

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
