#!/bin/perl

# TODO: don't broadcast password sent by player on create

use Net::WebSocket::Server;
require "/usr/local/lib/bclib.pl";
require "/sites/YAMC/yamc-lib.pl";
require "/sites/YAMC/game-commands.pl";

# TODO: is this an improper use of globopts?
$globopts{websocket} = 1;

my($ws)=Net::WebSocket::Server->new(listen=>8000,on_connect => \&connection);
$ws->start;

# TODO: when someone connects, broadcast to all connected
sub connection {
  my($serv, $conn) = @_;
  $conn->on(utf8 => \&message);
}

# this happens when we get a message
sub message {
  my($conn, $msg) = @_;

  # processes the msg
  process_msg($msg);

  # parse the message and broadcast it
#  my(%hash) = parse_form($msg);
#  broadcast("$hash{user}: $hash{command}");
}


# broadcast to all connections w/ timestamp
sub broadcast {
  my($msg) = @_;

  my($time) = stardate();
  $msg = "[$time] $msg";

  for $i ($ws->connections) {$i->send_utf8($msg);}
}

# TODO: client should warn if disconnected

sub process_msg {
  my($msg) = @_;
  debug("PROCESS_MSG($msg)");

  if ($msg=~/([^a-z0-9_:,\s\"\{\}])/i) {
    tell_user("Input *$msg* contained invalid characters: $1");
    return;
  }

  # sanitize
#  unless ($msg=~/^[a-z0-9_:,\s\"\{\}]*$/i) {
#    tell_user("Input *$msg* contained invalid characters, ignoring");
#    return;
#  }

#  my($hash);
#  my($res) = eval('$hash = JSON::from_json($msg);');

# TODO: it bugs me that the below doesnt work
#  eval {my $hash = JSON::from_json($msg)};

  my $hash;
  eval {$hash = JSON::from_json($msg)};
  if ($@) {broadcast("Not a JSON string: $msg"); return;}
  my($fullcmd) = $hash->{message};
  our($user) = $hash->{user};
  debug("FULLCMD: $fullcmd");

  unless ($user) {
    tell_user(convert_message_json("", false, "Please enter a username"));
    return;
  }

  # TODO: if command is "x y z" should try calling x_y_z() first, then
  # x_y(z), then x(y,z)
  # parse the command, so that "a b c" becomes "command_a(b,c)"
  my(@cmd) = split(/\s+/, $fullcmd);
  $cmd = shift(@cmd);
  debug("CMD: $cmd");

#  broadcast("(from $user): $fullcmd");

  # allow command aliasing
  if ($command_aliases{$cmd}) {$cmd = $command_aliases{$cmd};}

  unless (defined(&{"command_$cmd"})) {
    tell_user(convert_message_json($user, false, "No such function: $cmd, use 'help' for help"));
    return;
  }

  my($args) = join(", ",@cmd);
  my($eval) = "command_$cmd($args)";

  # this is what we plan to evaluate
#  tell_user("Eval: $eval");

  # check user info and store in global hash
  our(%user) = get_user_info($user);

  # these commands can be called even if no user is defined
  if ($no_user_required{$cmd}) {
    eval($eval);
    return;
  }

  if ($user{null}) {
    tell_user(convert_message_json("$user", false, "User $user does not exist: 'create $user password' to create"));
    return;
  }

  debug("eval($eval)");
  my($res) = eval($eval);
  debug("RES: $res, $@");
}

sub get_user_info {

  my($user) = @_;
  my(%user);

  my(@user) = sqlite3hashlist("SELECT * FROM users WHERE username='$user'", $dbfile);

  if ($#user == -1) {$user{null} = 1; return %user;}

  for $i (@user) {$user{$i->{variable}} = $i->{value};}

  return %user;
}

# convert message to JSON

sub convert_message_json {
  my($user, $guiq, $message) = @_;
  my(%hash) = ("user" => $user, "to_gui" => $guiq, "message" => $message);
  return JSON::to_json(\%hash);
}

# TODO: everything, this is a placeholder function

sub tile_energy_cost {
  my($x,$y) = @_;
  return(get_pixel_value($x,$y));
}

# get info on the tile (but does not tell if a player is standing on tile)

sub tile_info {
  my($x,$y) = @_;
  my($pix) = get_pixel_value($x,$y);

  my(@list) = sqlite3hashlist("SELECT variable, value FROM land WHERE x=$x AND y=$y UNION SELECT 'pixel_value', $pix", $db);

  return \@list;
}



