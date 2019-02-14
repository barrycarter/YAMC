#!/bin/expect

# tests websocket (redirecting from file is insufficient because 'ws'
# closes on EOF)

spawn ws ws://127.0.0.1:8000/

send "foo\n"

send "bar\n"

send "test\n"

expect "{"



