#!/bin/perl

# NOTE: msg = everything user sends, cmd = command user sends
# TODO: don't broadcast password sent by player on create
# TODO: replace all tell_ with tell_msg

use Net::WebSocket::Server;
use IO::Socket::SSL;
# TODO: get a local copy of bclib.pl
require "/usr/local/lib/bclib.pl";
require "/sites/YAMC/game-lib.pl";
require "/sites/YAMC/game-commands.pl";

my $ssl_server = IO::Socket::SSL->new(
                  Listen        => 5,
                  LocalPort     => 443,
                  Proto         => 'tcp',
                  SSL_cert_file => '/etc/letsencrypt/live/ws.terramapadventure.com/cert.pem',
                  SSL_key_file  => '/etc/letsencrypt/live/ws.terramapadventure.com/privkey.pem'
                ) or die "failed to listen: $!";

Net::WebSocket::Server->new(
                    listen => $ssl_server,
                    on_connect => \&connection,
                )->start;

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
}

# TODO: client should warn if disconnected

sub process_msg {
  my($msg) = @_;
  debug("PROCESS_MSG($msg)");

  if ($msg=~/([^a-z0-9_:,\s\"\{\}])/i) {
    tell_user("Input *$msg* contained invalid characters: $1");
    return;
  }

  my $hash;
  eval {$hash = JSON::from_json($msg)};
  if ($@) {tell("Not a JSON string: $msg"); return;}
  my($fullcmd) = $hash->{message};
  our($user) = $hash->{user};
  debug("FULLCMD: $fullcmd");
  my(%code) = %{parse_command($fullcmd)};
  debug("CODE", %code);
  debug("CODE: $code{str}");

  warn("TESTING");
  return;

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

  my(@list) = sqlite3hashlist("SELECT variable, value FROM land WHERE x=$x AND y=$y UNION SELECT 'pixel_value', $pix", $dbfile);

  return \@list;
}



