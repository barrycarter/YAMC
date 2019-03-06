#!/bin/perl

# just testing for now

use Net::WebSocket::Server;
require "/usr/local/lib/bclib.pl";
 
my($ws)=Net::WebSocket::Server->new(listen=>8000,on_connect => \&connection);

debug("WS: $ws");

# this happens when connection occurs

sub connection {
  my($serv, $conn) = @_;
  debug("SERV: $serv, CONN: $conn");
  $conn->on(utf8 => \&message);
}

# this happens when we get a message
sub message {
  my($conn, $msg) = @_;
  debug("GOT: $msg");
  $conn->send_utf8("You said: $msg, the time is".`date`);
}

$ws->start;

=item sample_code

use Net::WebSocket::Server;
 
Net::WebSocket::Server->new(
    listen => 8080,
    on_connect => sub {
        my ($serv, $conn) = @_;
        $conn->on(
            utf8 => sub {
                my ($conn, $msg) = @_;
                $conn->send_utf8($msg);
            },
        );
    },
)->start;

=cut
