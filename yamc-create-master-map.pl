#!/bin/perl

# this hash converts RGB csv to land type (long name/short name/number)

my(%rgb2ltp) = (

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

		);



# TODO: assign short names to be first caps of each word
# TODO: check for conflict

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
