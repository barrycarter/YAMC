#!/bin/perl

# Reads the data in Data/mrds.csv.bz2 (should be piped to the STDIN of
# this program)

require "/usr/local/lib/bclib.pl";

# getting and printing the header solely to see which fields I'm interested in

my @header = csv(<>);

for $i (0..$#header) {debug("$i: $header[$i]");}

# just printing for now

while (<>) {
   debug($_);
}

=item comments

header:

0: dep_id
1: url
2: mrds_id
3: mas_id
4: site_name
5: latitude
6: longitude
7: region
8: country
9: state
10: county
11: com_type
12: commod1
13: commod2
14: commod3
15: oper_type
16: dep_type
17: prod_size
18: dev_stat
19: ore
20: gangue
21: other_matl
22: orebody_fm
23: work_type
24: model
25: alteration
26: conc_proc
27: names
28: ore_ctrl
29: reporter
30: hrock_unit
31: hrock_type
32: arock_unit
33: arock_type
34: structure
35: tectonic
36: ref
37: yfp_ba
38: yr_fst_prd
39: ylp_ba
40: yr_lst_prd
41: dy_ba
42: disc_yr
43: prod_yrs
44: discr

=cut

