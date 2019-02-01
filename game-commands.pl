# When the player types in a command or the client requests it, calls
# the appropriate function in this file

# TODO: maybe write script that checks sqlite3 is never used and only
# sqlite3_local

package gamecommands;

# this lets me use the functions in yamc-lib.pl as if they were local
do "/sites/YAMC/yamc-lib.pl";

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

sub create {
  my($username, $pw) = @_;

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
  exit(0);
}



# TODO: distinguish between functions user can call and GUI can call

# TODO: consider using methods vs functions

# perl libs must return truth
true;
