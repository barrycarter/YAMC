#!/bin/perl

require "/usr/local/lib/bclib.pl";

print "Access-Control-Allow-Origin: *\n";

# TODO: restore to application/json
# print "Content-type: application/json\n\n";

print "Content-type: text/plain\n\n";

my(%query) = str2hash($ENV{QUERY_STRING});

if ($query{f} eq "time") {
    print JSON::to_json(bcapi_time(%query));
}

# bcapi_time(%query);

# print JSON::to_json(\%query);

# for $i (sort keys %query) {
#    print "$i: $query{$i}\n";
# }

# TODO: properly document this

# gives time in a given timezone

sub bcapi_time {

    my(%hash) = @_;

    return \%hash;
}

