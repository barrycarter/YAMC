#!/bin/perl

use Net::WebSocket::Server;
require "/usr/local/lib/bclib.pl";
require "/sites/YAMC/yamc-lib.pl";
require "/sites/YAMC/game-commands.pl";

my($ws)=Net::WebSocket::Server->new(listen=>8000,on_connect => \&connection);

# TODO: when someone connects, broadcast to all connected
sub connection {
  my($serv, $conn) = @_;
  $conn->on(utf8 => \&message);
}

# this happens when we get a message
sub message {
  my($conn, $msg) = @_;

  debug("Got message: $msg");

  # TODO: broadcast message in addition to parsing it
  for $i ($ws->connections) {
    my($msg2) = "Server echo: $msg";
    debug("SENDING TO: $i");
    $i->send_utf8($msg2);
  }
}

$ws->start;

