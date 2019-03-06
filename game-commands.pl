# When the player types in a command or the client requests it, calls
# the appropriate function in this file

# TODO: rewrite this to be a package, but that caused a lot of
# problems when I tried it

# TODO: maybe write script that checks sqlite3 is never used and only
# sqlite3_local

require "/usr/local/lib/bclib.pl";
require "/sites/YAMC/game-lib.pl";

# command aliases

our(%command_aliases) = (
 "i" => "inventory",
 "e" => "move east",
 "w" => "move west",
 "s" => "move south",
 "n" => "move north"
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

=item command_()

The do-nothing command to call when player sends an invalid command

=cut

sub command_ {return;}

sub command_puttile {
  my($thing, $x, $y) = @_;
  my($query) = "INSERT INTO land (x, y, variable, value) VALUES ('$x', '$y', '$thing', 1)";
  sqlite3($query, $dbfile);
  command_tileinfo($x,$y);
}

# TODO: this should be a subcommand of info

sub command_tileinfo {
  my($x, $y) = @_;
  my(@val) = tile_info($x, $y);
  tell_user(JSON::to_json(\@val));
}

# create a new user with a given password

sub command_create {
  my($keyword, $username, $pw) = @_;

  unless ($user{null}) {
    tell_user(convert_message_json($user, false, "User $username already exists"));
    return;
  }

  tell_user(convert_message_json($user, false, "Creating user: $username"));

  # TODO: if below is slow, consider transaction
  # TODO: error checking
  # TODO: pw is not currently used

  # if not, enter user/pw into db (TODO: hash pws)
  sqlite3_local("INSERT INTO users (username, variable, value) VALUES
           ('$username', 'pw', $pw);");

  # TODO: this needs to be changed a lot
  for $i (keys %default_user) {
    sqlite3_local("INSERT INTO users (username, variable, value) VALUES
           ('$username', '$i', $default_user{$i});");
  }

  tell_user(convert_message_json($user, $guiq, "User $username created with default position and resources"));
  return;
}

# TODO: create aliases (like 'i' for inventory) as needed
# inventory

sub command_inventory {
  # TODO: no need to look this up, since I pull user info already
  # NOTE: \\n prints a literal \n but tell_user interprets it
#  my($query) = "SELECT GROUP_CONCAT(variable||': '||value, '\\n') FROM users WHERE username='$user' AND variable NOT IN ('pw', 'x', 'y')";
  my($query) = "SELECT variable, value FROM users WHERE username='$user' AND variable NOT IN ('pw', 'x', 'y')";
  my(@val) = sqlite3hashlist($query, $dbfile);
  tell_user(JSON::to_json(\@val));
}

sub command_help {
  my($help) = << "MARK";

* = not implemented yet
+ = will be restricted to admins only

i - inventory
* create user <username> <password> - create a new user
* n(orth), e(ast), w(est), s(outh) - move in cardinal direction
* info user [user] - information about given user (default: you)
* info users - information about all users (+)
* info tile [tile] - information about tile (default: tile you are on)
* info tiles [x1 y1 x2 y2] - information about all tiles in rectangle (default: all tiles in game)
* claim tile [tile] - claim tile (default: tile you are on)
* bridge (n|e|s|w) - build bridge on tile in given direction and move there
* put tile (road|person|etc) - place item on given tile (default: tile you are on)
* remove (road|person|etc) - remove item from this tile
* turn - end current turn
* reset - reset to start of this turn
* save - save current state
* restore - restore from last save

MARK
;
  tell_user(convert_message_json($user, false, $help));
}

sub command_show_rectangle {
  my($x1, $y1, $x2, $y2) = @_;
  my(@x, @y);

  for $j ($y1..$y2) {
    @x = ();
    for $i ($x1..$x2) {
      push(@x, get_pixel_value($i, $j));
    }
    push(@y, \@x);
  }

  my(%reply_hash) = ();
  $reply_hash{user} = $user;
  $reply_hash{message} = \@y;
  $reply_hash{to_gui} = true;

  tell_user(JSON::to_json(\%reply_hash));
}

sub command_move {

  my($dir) = @_;

  # TODO: worry about torus rollover?
  sqlite3("UPDATE users SET value=value+1 WHERE username='$user' AND variable = 'x'", $dbfile);

  my(%reply) = ();
  my(%message) = get_user_info($user);
  $reply{message} = JSON::to_json(\%message);
  $reply{user} = $user;
  $reply{to_gui} = false;

  tell_user(JSON::to_json(\%reply));
}

# TODO: pw should be stored as string, not integer value (but perhaps sha1?)

# the test{n} commands are just for testing

# sub command_exit {exit(0);}

# only use this in console mode

# sub command_reload {
#  tell_user("Restarting...");
#  system("clear");
#  exec("$0 --debug");
# }

# TODO: distinguish between functions user can call and GUI can call

# TODO: consider using methods vs functions

# perl libs must return truth
true;
