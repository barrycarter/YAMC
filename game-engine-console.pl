#!/bin/perl

# Runs the game from a console (very similar to game-engine.pl, but no
# web connection

require "/usr/local/lib/bclib.pl";

# TODO: this is seriously ugly
require "/sites/YAMC/yamc-lib.pl";
require "/sites/YAMC/gamecommands.pm";

# TODO: hardcoding user for now, global var
$user = "local_user";

# read input line by line
$|=1;

# NOTE: using tell_user followed by next instead of tell_error

# forever...

my($cmd);

while (1) {
  print "Command > ";
  $cmd = <>;
  debug("CMD: $cmd");

  # parse the command
  my(@cmd) = split(/\s+/, $cmd);
  my($cmd) = shift(@cmd);
  if ($aliases{$cmd}) {$cmd = $aliases{$cmd};}
  my($args) = join(", ",@cmd);
  my($eval) = "gamecommands::$cmd($args)";
  tell_user("Eval: $eval");

  # check user info
  my(@user) = sqlite3hashlist("SELECT * FROM users WHERE
username='$user'", $dbfile);

# special case for create
  if ($cmd eq "create") {
    if (@user) {tell_user("User $user already exists"); next;}
    eval($eval);
    next;
  }

  if ($#user == -1) {
    tell_user("User $user does not exist: 'create $user password' to create");
    next;
  }

  # this is global
#  %user = %{$user[0]};
#  debug("USER", var_dump("user", \%user));

  tell_user("Plan to call: $eval");
  eval($eval);
  tell_user("Eval returns $@");
}
