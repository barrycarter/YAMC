#!/bin/perl

# This script runs on test.barrycarter.info and will be the game engine

require "/usr/local/lib/bclib.pl";

# db file
my($dbfile) = "/sites/DB/yamc.db";

# default starting x and y values
my($defx, $defy) = (20934, 6467);

# what the user requested
my($query) = $ENV{QUERY_STRING};

# currently using IP address to identify user = bad
my($user) = $ENV{REMOTE_ADDR};

# current time
my($time) = strftime("%Y%m%d.%H%M%S UTC", gmtime(time()));

print "Access-Control-Allow-Origin: *\nContent-type: text/html\n\n";

my(@user) = sqlite3hashlist("SELECT * FROM user WHERE username='$user'", $dbfile);

if ($#user == -1) {
  sqlite3("INSERT INTO user (username, x, y) VALUES 
           ('$user', $defx, $defy)", $dbfile);
  print "ERROR: $SQL_ERROR\n";
  print "Creating new user... $user\n";
  exit(0);
}

my(%user) = %{$user[0]};

print "[$time] Your command: $query\n";
print "[$time] User: $user{user} has position $user{x}, $user{y}\n";

sub help {
  return << "MARK";
n, e, w, s - move in cardinal direction
i - inventory
me - information about you
claim - claim current tile
tile - information about current tile
bridge [n|e|s|w] - build bridge on tile in given direction
put (road|person|etc) - place item on this tile
remove (road|person|etc) - remove item from this tile
harvest - harvest resources from this tile (once per turn)
turn - end current turn
reset - reset to start of this turn
save - save current state
restore - restore from last save
MARK
;
}

# TODO: allow ";" to separate commands, but check for errors

# TODO: disallow diagonal moves

# for $i (sort keys %ENV) {print "KEY: $i, VAL: $ENV{$i}<br>\n";}


# pull user data from SQLite3 db (for now)

# TODO: return JSON
# print "[$time] Message received: $query\n";


=item schema

CREATE TABLE user (username TEXT, x INT, y INT);

=cut

=item comments

Table stored in /sites/DB/yamc.db for now but this public so be careful

=cut

# TODO: move data out of public dir
