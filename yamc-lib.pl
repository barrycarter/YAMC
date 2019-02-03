#!/bin/perl

# these are functions and variables the user can't call directly

# this lets me use the functions in bclib.pl as though they were in this file

do "/usr/local/lib/bclib.pl";

# db file
our($dbfile) = "/sites/DB/yamc.db";

# default starting x and y values
our($defx, $defy) = (20934, 6467);

# since all of our queries are to single file, allow 1 arg call

sub sqlite3_local {
  my($query) = @_;
  return sqlite3($query, $dbfile);
}

# this hash converts RGB csv to land type (long name/short name/number)

# 0,0,0 is an error (so giving it the highest 5-bit value possible)
# but does appear at the end of east.txt

our(%rgb2ltp) = (
		"143,187,143" => "Mixed Forest|5",
		"151,250,151" => "Deciduous Broadleaf Forest|4",
		"153,147,85" => "Cropland/Natural Vegetation Mosaic|14",
		"154,205,49" => "Deciduous Needleleaf Forest|3",
		"187,143,143" => "Closed Shrublands|6",
		"189,189,189" => "Barren or Sparsely Vegetated|16",
		"219,235,157" => "Woody Savannas|8",
		"229,242,255" => "Water|0",
		"239,183,102" => "Grasslands|10",
		"245,222,179" => "Open Shrublands|7",
		"250,237,115" => "Croplands|12",
		"255,0,0" => "Urban and Built-up|13",
		"255,214,0" => "Savannas|9",
		"255,249,249" => "Snow and Ice|15",
		"33,138,33" => "Evergreen Needleleaf Forest|1",
		"49,205,49" => "Evergreen Broadleaf Forest|2",
		"70,130,178" => "Permanent Wetlands|11",
		"0,0,0" => "Error|31"
		);

# this array (not hash) points to the RGB color of a given value

our(@landcolors);

for $i (keys %rgb2ltp) {
  $rgb2ltp{$i}=~m/^.*\|(.*?)$/m;
  $landcolors[$1] = $i;
}

sub get_pixel_value {

  unless (-r A) {open(A,"/sites/YAMC/westeast.bin");}

  my($x, $y) = @_;
  my($val, $flag);

  if ($x >= 21600) {$flag = 1;} else {$flag = 0;}

  my($pos) = $y*21600 + $x + $flag*466560000;

  # TODO: hardcoding `A` here is probably bad
  seek(A, $pos, 0);
  my($ret) = read(A, $val, 1);
  return ord($val);
}


# return hash of tile type info for rectangle only (not improvements)

# TODO: cache, since tileinfo doesn't change

sub tileinfo {
  my(%tileinfo);
  my($x1,$y1,$x2,$y2) = @_;
  for ($i = $x1; $i <= $x2; $i++) {
    for ($j = $y1; $j <= $y2; $j++) {
      $tileinfo{$i}{$j} = get_pixel_value($i, $j);
    }
  }
  return \%tileinfo;
}

=item tile_energy_cost($x,$y)

The energy cost to cross tile $x,$y

TODO: currently hardcoded

=cut

sub tile_energy_cost {
  my($x,$y) = @_;
  return 1;
}

# TODO: both tell_ functions should preserve HTML and use <br> or <p>

# TODO: all of the subroutines below are the same for now, but will be
# customized when the time comes

# tell error: tell the user something went wrong and terminate
sub tell_error {
  my($error) = @_;
  print "ERROR: $error\n";
  exit(0);
}

# tell user: tell the user something and continue
sub tell_user {
  my($str) = @_;
  $str=~s/\\n/\n/g;
  print "$str\n";
}

# TODO: only do this if debugging is turned on
sub tell_debug {
  my($str) = @_;
  print "DEBUG: $str\n";
}

return 1;
