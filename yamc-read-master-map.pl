#!/bin/perl

# Reads the map from the BIN files created using yamc-create-master-map.pl

# The virtual image is 43200x21600, pixels from 0 to 1 under those values

# The BIN files are ~500M each and too large to put into git (and
# probably not useful there)

# TODO: statement above is up for discussion

# TODO: currently reads from two files, but will merge these

# Initial usage (will change): x,y pixel to retrieve

require "/usr/local/lib/bclib.pl";

my($x,$y) = @ARGV;
my($val);

# TODO: this file will eventually reside on a server, not local

my($wfile) = "/home/user/20190125/west.bin";
my($efile) = "/home/user/20190125/east.bin";
my($file);

if ($x >= 21600) {$file = $efile; $x-=21600;} else {$file = $wfile;}

my($pos) = $y*21600 + $x;
debug("POS: $pos");

open(A, $file)||die("Can't open file, $!");

seek(A, $pos, 0);

my($ret) = read(A, $val, 1);

print ord($val),"\n";




