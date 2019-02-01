#!/bin/perl

# just testing for now

use Net::WebSocket::Server;
require "/usr/local/lib/bclib.pl";
 
sub setup_server {
  # $conn is of class Net::WebSocket::Server::Connection
  debug("AT IS: ",@_);
  my($serv, $conn) = @_;
  debug("SERV: $serv, CONN: $conn");
#  $conn->on(utf8 => got_message);
}

my($ws) = Net::WebSocket::Server->new(
 listen => 8000,  on_connect =>
 \&setup_server
# sub {my ($serv, $conn) = @_; debug("SERV: $serv, CONN: $conn");}
);

debug("WS: $ws");



# this happens when connection occurs

sub got_message {
  my($conn, $msg) = @_;
  $conn->send_utf8("You said: $msg");
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
