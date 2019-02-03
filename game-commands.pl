# When the player types in a command or the client requests it, calls
# the appropriate function in this file

# TODO: rewrite this to be a package, but that caused a lot of
# problems when I tried it

# TODO: maybe write script that checks sqlite3 is never used and only
# sqlite3_local

# this lets me use the functions in yamc-lib.pl as if they were local
# do "/sites/YAMC/yamc-lib.pl";

# command aliases

our(%command_aliases) = (
 "i" => "inventory",
 "e" => "east",
 "w" => "west",
 "s" => "south",
 "n" => "north"
);

# can be called without user

our(%no_user_required) = list2hash("exit", "reload", "create");

=item notes

TODO: move_dir should be called by n, e, s, w

TODO: check_move(x,y) should ensure player can move to x, y

Return values of any command here should be:

  - Message for player

  - Message for client JS

  - db changes required (multiple tables)

TODO: distinguish between player commands and client requests

TODO: return rectangle of values on client request

TODO: assume argument defaults if player/client doesnt specify

=cut

# create a new user with a given password

sub command_create {
  my($username, $pw) = @_;

  unless ($user{null}) {
    tell_user("User $username already exists");
    return;
  }

  tell_user("Creating user: $username");

  # TODO: if below is slow, consider transaction
  # TODO: error checking
  # TODO: pw is not currently used

  # if not, enter user/pw into db (TODO: hash pws)
  sqlite3_local("INSERT INTO users (username, variable, value) VALUES
           ('$username', 'pw', $pw);");

  # TODO: this needs to be changed a lot

  # put the user at default position (20934, 6467) [TODO: not this]
  sqlite3_local("INSERT INTO users (username, variable, value) VALUES
           ('$username', 'x', $defx);");
  sqlite3_local("INSERT INTO users (username, variable, value) VALUES
           ('$username', 'y', $defy);");

  # and 1000 of some resources (TODO: major changes here)
  for $i ("wood", "food", "people", "leaves", "grass", "energy") {
    sqlite3_local("INSERT INTO users (username, variable, value) VALUES
           ('$username', '$i', 1000);");
  }

  tell_user("User $username created with default position and resources");
  return;
}

# TODO: create aliases (like 'i' for inventory) as needed
# inventory

sub command_inventory {
  my($user) = @_;
  # TODO: no need to look this up, since I pull user info already
  # NOTE: \\n prints a literal \n but tell_user interprets it
  my($query) = "SELECT GROUP_CONCAT(variable||': '||value, '\\n') FROM users WHERE username='$user' AND variable NOT IN ('pw', 'x', 'y')";
  my($val) = sqlite3val($query, $dbfile);
  tell_user("Inventory:\n\n$val");
}

# TODO: pw should be stored as string, not integer value (but perhaps sha1?)

# the test{n} commands are just for testing

sub command_exit {exit(0);}

# only use this in console mode

sub command_reload {
  tell_user("Restarting...");
  system("clear");
  exec("$0 --debug");
}

# TODO: distinguish between functions user can call and GUI can call

# TODO: consider using methods vs functions

# perl libs must return truth
true;
