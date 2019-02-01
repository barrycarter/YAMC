#!/bin/perl

# this is only for testing websocket.pl which itself is just for
# testing websockets; neither of these programs is part of the game
# itself

require "/usr/local/lib/bclib.pl";
use Protocol::WebSocket;

my $client = Protocol::WebSocket->new(url => 'ws://localhost:8000');
$client->on(
    write => sub {
        my $client = shift;
        my ($buf) = @_;
 
        syswrite $sock, $buf;
    }
);
$client->on(
    read => sub {
        my $client = shift;
        my ($buf) = @_;
	debug("I rad something");
    }
);
 
# Sends a correct handshake header
$client->connect;
 
# Register on connect handler
$client->on(
    connect => sub {
        $client->write('hi there');
    }
);
 
# Parses incoming data and on every frame calls on_read
# $client->read(...data from socket...);
 
# Sends correct close header
$client->disconnect;
