#!/bin/perl

# prints the enviroment to test websocketd

for $i (keys %ENV) {print "$i: $ENV{$i}\n";}

