# When the player types in a command or the client requests it, calls
# the appropriate function in this file

package gamecommands;

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

  # see if user already exists
  if ($user) {tell_error("User $username already exists");}

  tell_user("Creating user: $username");

  # TODO: if below is slow, consider transaction
  # TODO: error checking
  # TODO: pw is not currently used

  # if not, enter user/pw into db (TODO: hash pws)
  sqlite3("INSERT INTO users (username, variable, value) VALUES
           ('$username', 'pw', $pw);");

  # TODO: this needs to be changed a lot

  # put the user at default position (20934, 6467) [TODO: not this]
  sqlite3("INSERT INTO users (username, variable, value) VALUES
           ('$username', 'x', $defx);");
  sqlite3("INSERT INTO users (username, variable, value) VALUES
           ('$username', 'y', $defy);");

  # and 1000 of some resources (TODO: major changes here)
  for $i ("wood", "food", "people", "leaves", "grass", "energy") {
    sqlite3("INSERT INTO users (username, variable, value) VALUES
           ('$username', '$i', 1000);");
  }

  tell_user("User $username created with default position and resources");
  exit(0);
}
