#!/bin/perl

# TODO: consider word wrapping output

# Runs the game from a console (very similar to game-engine.pl, but no
# web connection

require "/usr/local/lib/bclib.pl";
require "/sites/YAMC/yamc-lib.pl";
require "/sites/YAMC/game-commands.pl";

# TODO: hardcoding user for now
our($user) = "local_user";

# read input line by line
$|=1;

# NOTE: using tell_user followed by next instead of tell_error

# forever...

while (1) {
  print "Command > ";
  my $cmd = <>;
  debug("CMD: $cmd");

  # parse the command, so that "a b c" becomes "command_a(b,c)"
  my(@cmd) = split(/\s+/, $cmd);
  my($cmd) = shift(@cmd);

  # allow command aliasing
  if ($aliases{$cmd}) {$cmd = $command_aliases{$cmd};}

  my($args) = join(", ",@cmd);
  my($eval) = "command_$cmd($args)";

  # this is what we plan to evaluate
  tell_debug("Eval: $eval");

  # check user info and store in global hash
  my(%user) = get_user_info($user);

  # these commands can be called even if no user is defined
  if ($no_user_required{$cmd}) {
    eval($eval);
    next;
  }

  if ($user{null}) {
    tell_user("User $user does not exist: 'create $user password' to create");
    next;
  }

  tell_user("Plan to call: $eval");
  eval($eval);
  tell_user("Eval returns $@");
}

sub get_user_info {

  my($user) = @_;
  my(%user);

  my(@user) = sqlite3hashlist("SELECT * FROM users WHERE username='$user'", $dbfile);

  if ($#user == -1) {$user{null} = 1; return %user;}

  for $i (@user) {$user{$i->{variable}} = $i->{value};}

  return %user;
}
