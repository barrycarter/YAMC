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

our($ws) = setup_websocket();
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
}

# TODO: client should warn if disconnected

sub process_msg {
  my($msg) = @_;
  debug("PROCESS_MSG($msg)");

  if ($msg=~/([^a-z0-9_:,\s\"\{\}])/i) {
    tell_user("Input *$msg* contained invalid characters: $1");
    return;
  }

  # eval in case of error
  eval {$hash = JSON::from_json($msg)};
  if ($@) {tell("Not a JSON string: $msg"); return;}
  
  my($fullcmd) = $hash->{message};
  our($user) = $hash->{user};
  debug("FULLCMD: $fullcmd");
  my(%code) = %{parse_command(str2hashref("cmd=$fullcmd"))};
  debug("CODE", %code);
  debug("CODE: $code{str}");

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

# sets up listening websocket (program-specific subroutine

sub setup_websocket {

  my($dir) = "/etc/letsencrypt/live/ws.terramapadventure.com";
  my($ws);

  if (-d $dir) {
    my($ssl_server) = IO::Socket::SSL->new(
 Listen => 5, LocalPort => 443, Proto => 'tcp', 
 SSL_cert_file => "$dir/cert.pem", SSL_key_file => "$dir/privkey.pem"
);
    $ws = Net::WebSocket::Server->new(listen => $ssl_server, on_connect => \&connection);
  } else {
    warn("INSECURE: no $dir, listening insecurely");
    $ws = Net::WebSocket::Server->new(listen=>8000,on_connect => \&connection);
  }

  return $ws;

}

