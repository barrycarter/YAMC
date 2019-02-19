#!/bin/perl

# Generates a solar map (16 shades) from the AAIGRID data

require "/usr/local/lib/bclib.pl";

# the file has 13806 rows of 43200 pixels each, representing latitudes
# -55 to +55 (first 6 rows are header rows)

# I used 'split -l 6906` to split the original file into two pieces
# before uploading it to github to avoid large file issues

open(A, "bzcat /home/user/20190125/YAMC/Data/PVOUT-[12].asc.bz2|");

while (<A>) {

  my(@pts) = split(/\s+/, $_);

  # ignore first few lines which have no useful data
  unless (scalar(@pts) == 43200) {next;}

  # determine colors for each pt (-9999 = NA = 0)
  for $i (@pts) {
    if ($i == -9999) {$i = 0;}

    # for testing, 0 is boring
    if ($i == 0) {next;}

    # split into 0.48 chunks
    my($level) = min(15, floor($i/0.48));
    debug("$i -> $level");
  }
}

