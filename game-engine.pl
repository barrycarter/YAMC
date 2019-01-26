#!/bin/perl

# This script runs on test.barrycarter.info and will be the game engine

require "/usr/local/lib/bclib.pl";

print "Access-Control-Allow-Origin: *\nContent-type: text/plain\n\n";

my($query) = $ENV{QUERY_STRING};

print "You sent me: $query\n";
print "The time is ".strftime("%Y%m%d.%H%M%S UTC", gmtime(time()))."\n";
