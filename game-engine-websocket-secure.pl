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

# background ourselves unless --nodetach
# NOTE: this has to come before we open the websocket, else IO issues
unless ($globopts{"nodetach"}) {if (fork()) {exit;}}

debug("About to setup websocket");
our($ws) = setup_websocket();
debug("About to start websocket");
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
  tell_user(JSON::to_json(process_msg($msg)));
}

# TODO: client should warn if disconnected

sub process_msg {
  my($msg) = @_;
  debug("PROCESS_MSG($msg)");

  # does the message contain illegal characters?
  if ($msg=~/([^a-z0-9_:,\s\"\{\}])/i) {
    tell_user("Input *$msg* contained invalid characters: $1");
    return;
  }

  # can the message be converted to JSON?
  eval {$hash = JSON::from_json($msg)};
  if ($@) {tell_user("Not a JSON string: $msg"); return;}

  # do one level of unfolding
  %hash = %$hash;

  debug("HASH",%hash);

  # TODO: GUI won't normally give us user
  our($user) = $hash{user};
  # get info on the user
  our(%user) = get_user_info($user);

  # convert the user's command to a function
  my(%code) = %{parse_command(str2hashref("cmd=$hash{cmd}"))};

  # build the eval string
  my($eval) = "command_$code{cmd}($code{args})";
  debug("EVAL = $eval");

  # if the command can be called sans user, do so now
  if ($no_user_required{$code{cmd}}) {
    debug("NO USER REQUIRED");
    my($res) = eval($eval);
    debug("RES: $res");
    return $res;
  }

  # if there's no user and the command needs a user, alert user
  if ($user{null}) {
    tell_user(convert_message_json("$user", false, "User $user does not exist: 'create $user password' to create"));
    return;
  }

  # all checks pass, eval the function
  debug("ABOUT TO EVAL: $eval");
  my($res) = eval($eval);
  debug("RES IS: $res");
  unless ($res) {return;}
  tell_user(JSON::to_json($res));
}

# sets up listening websocket (program-specific subroutine)

sub setup_websocket {

  my($dir) = "/etc/letsencrypt/live/ws.terramapadventure.com";
  my($ws);

  if (-d $dir) {
    my($ssl_server) = IO::Socket::SSL->new(
 Listen => 5, LocalPort => 443, Proto => 'tcp', 
 SSL_cert_file => "$dir/fullchain.pem", SSL_key_file => "$dir/privkey.pem"
);
    $ws = Net::WebSocket::Server->new(listen => $ssl_server, on_connect => \&connection);
  } else {
    warn("INSECURE: no $dir, listening insecurely");
    $ws = Net::WebSocket::Server->new(listen=>8000,on_connect => \&connection);
  }

  debug("WS IS: $ws");
  return $ws;

}

