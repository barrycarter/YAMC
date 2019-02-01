#!/bin/perl

# just testing for now

use Net::WebSocket::Server;
 
Net::WebSocket::Server->new(
    listen => 8000,
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

