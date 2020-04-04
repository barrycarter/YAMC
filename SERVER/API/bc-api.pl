#!/bin/perl

require "/usr/local/lib/bclib.pl";

print "Access-Control-Allow-Origin: *\n";

# TODO: restore to application/json
# print "Content-type: application/json\n\n";

print "Content-type: text/plain\n\n";

my(%query) = str2hash($ENV{QUERY_STRING});

my(%result);

if ($query{f} eq "time") {
    $result{input} = \%query;
    $result{output} = bcapi_time(%query);
    print JSON::to_json(%result);
#    print JSON::to_json(bcapi_time(%query));
}

# print "Hello Bob\n";

# bcapi_time(%query);

# print JSON::to_json(\%query);

# for $i (sort keys %query) {
#    print "$i: $query{$i}\n";
# }

# TODO: properly document this

# gives time in a given timezone
# tz = time zone

sub bcapi_time {

    my(%hash) = @_;

    $hash{tz}=~s/[^a-z0-9\/]//isg;

    $ENV{TZ} = $hash{tz};

    $hash{date} = `date`;
    chomp($hash{date});

    return \%hash;
}

