#!/bin/perl

# this hash converts RGB csv to land type (long name/short name/number)

# 229,242,255 *might* be ocean

# TODO: no spaces between commas
my(%rgb2ltp) = (
		"255,214,0" => "Savannas|9",
		"70,130,178" => "Permanent Wetlands|11",
		"143,187,143" => "Mixed Forest|5",
		"151,250,151" => "Deciduous Broadleaf Forest|4",
		"153,147,85" => "Cropland/Natural Vegetation Mosaic|14",
		"154,205,49" => "Deciduous Needleleaf Forest|3",
		"187,143,143" => "Closed Shrublands|6",
		"189,189,189" => "Barren or Sparsely Vegetated|16",
		"219,235,157" => "Woody Savannas|8",
		"239,183,102" => "Grasslands|10",
		"245,222,179" => "Open Shrublands|7",
		"250,237,115" => "Croplands|12",
		"255,249,249" => "Snow and Ice|15",
		);

# TODO: assign short names to be first caps of each word
# TODO: check for conflict

=item comments

Colors to land type:

Savannas = (255,214, 0) #FFD600
Permenant wetland = ( 70,130,178) #4682B2
#8FBB8F



This command helps find different colors fast:

bc-fastrand.pl --n=100 west.txt | perl -anle 'print join(" ",@F[1..3])' | sort -u

=cut
