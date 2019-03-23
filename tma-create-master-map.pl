#!/bin/perl

# Creates the binary map that gives the solar energy value and
# landtype for each of ~1 billion tiles; in other words, combines
# lcc.png and solar.png

require "/usr/local/lib/bclib.pl";

# solar energy color to number conversion

my(%solar) = ("0,0,0" => 0);

for ($i=1; $i <= 15; $i++) {
  # hue range: 0 = red = highest; 3/4 = dark violet = lowest
  my($h) = 3/4 - 3*($i-1)/56;
  my($rgb) = hsv2rgb($h, 1, 1, "format=decimal");
  $rgb=~s/00/0/g;
  $solar{$rgb} = $i;
}

# color to landtype

# water/error = 0 (blue)
# forest = 1 (green)
# grasslands = 2 (yellow)
# wetlands = 3 (cyan)
# croplands = 4 (orange)
# urban = 5 (red)
# snow/ice = 6 (white)
# barren = 7 (gray50)

my(%landtype) = ( "0,0,255" => 0, "0,255,0" => 1, "255,255,0" => 2,
"0,255,255" => 3, "128,128,0" => 4, "255,0,0" => 5, "255,255,255" =>
6, "128,128,128" => 7 );

# open the two textfiles in question (not in github, far too big even
# compressed)

open(A, "bzcat /mnt/villa/user/20190319/lcc.txt.bz2|");
open(B, "bzcat /mnt/villa/user/20190319/solar.txt.bz2|");

# this could be <A> or <B> too, but for symmetry doing do

while (!eof(A)) {

  my $lcc = <A>;
  my $solar = <B>;

  if ($lcc=~/^\#/ && $solar=~/^\#/) {next;}

  unless ($lcc=~/\(([\s\d\,]+)\)/) {die "BAD LINE: $lcc"; next;}
  $lcc = $1;
  $lcc=~s/\s//g;

  unless ($solar=~/\(([\s\d\,]+)\)/) {die "BAD LINE: $solar"; next;}
  $solar = $1;
  $solar=~s/\s//g;

  $solar = $solar{$solar};
  unless (length($solar)) {die "NO TRANSLATION: *$solar*"; next;}

  debug("$lcc / $solar");

};




