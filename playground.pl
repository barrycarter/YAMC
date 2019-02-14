#!/bin/perl

# testbed for game

require "/usr/local/lib/bclib.pl";
require "/sites/YAMC/game-lib.pl";
require "/sites/YAMC/game-commands.pl";

$hash{cmd} = "foo_bar_la_la_la";
$hash{cmd} = "show rectangle 1 2 3 4";

debug(%{parse_command(\%hash)});

die ("TESTING");

# TODO: note all/input is hashes for flexibility (= dumb ?)

=item parse_command(\%hash)

Parses the input hash's "cmd" key as a command.

Example: "a b c d" first checks if function command_a_b_c_d exists and
returns "command_a_b_c_d()"; if not, checks if command_a_b_c exists
and returns "command_a_b_c(d)", then command_a_b(c,d), then
command_a(b,c,d) and finally command_null(a,b,c,d). Returns as "str" in hash

=cut

sub parse_command {

  my($hashref) = @_;
  my(%hash) = %$hashref;
  my(%ret);
  my($cmd) = $hash{"cmd"};

  # convert spaces to _
  $cmd=~s/\s/_/g;
  debug("CMD: $cmd");
  my(@args) = ();

  while ($cmd) {

    debug("CHECKING: command_$cmd");
    if (defined(&{"command_$cmd"})) {last;}

    # if $cmd has no more _ and isn't defined, drop out of looop
    unless ($cmd=~s/_([^_]*?)$//) {
      unshift(@args,$cmd);
      $cmd="";
    }

    unshift(@args, $1);
  };

  $cmd = "command_$cmd";

  $ret{str} = "$cmd(".join(", ",@args).")";
  return \%ret;
}


