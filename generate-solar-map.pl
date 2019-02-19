#!/bin/perl

# Generates a solar map (16 shades) from the AAIGRID data

require "/usr/local/lib/bclib.pl";

# the file has 13806 rows of 43200 pixels each, representing latitudes
# -55 to +55 (first 6 rows are header rows)

# I used 'split -l 6906` to split the original file into two pieces
# before uploading it to github to avoid large file issues
