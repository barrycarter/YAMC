#!/bin/perl

require "/usr/local/lib/bclib.pl";

$| = 1;

open(A, "|ws ws://127.0.0.1:8000/")||die("Can't open, $!");

while (<>) {
  debug("SENDING: $_");
  print A $_;
  sleep(1);
}

close(A);
