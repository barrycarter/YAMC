#!/bin/perl

# This script runs on test.barrycarter.info and will be the game engine

# TODO: move all paths to be relative to terramapadventure.com

require "/usr/local/lib/bclib.pl";

# TODO: this is seriously ugly
require "/sites/YAMC/yamc-lib.pl";
require "/sites/YAMC/gamecommands.pm";

# can access from local browser if desired
print "Access-Control-Allow-Origin: *\nContent-type: text/html\n\n";

# current time
my($time) = strftime("%Y%m%d.%H%M%S UTC", gmtime(time()));

# what the user requested
my($query) = $ENV{QUERY_STRING};

# fix html?
$query=~s/%20/ /g;

# parse into hash
my(%query) = parse_form($query);

unless ($query{username}) {tell_error("Please enter a username");}

# username
my($user) = $query{username};

# command to run and args
my(@cmd) = split(/\s+/, $query{cmd});
my($cmd) = shift(@cmd);
my($args) = join(", ",@cmd);
my($eval) = "gamecommands::$cmd($args)";

# read information about the user

my(@user) = sqlite3hashlist("SELECT * FROM users WHERE
username='$user'", $dbfile);

# special case for create
if ($cmd eq "create") {
  if (@user) {tell_error("User $user already exists");}
  eval($eval);
}

if ($#user == -1) {
  tell_error("User $user does not exist: 'create $user password' to create");
}

print "[$time] Your command: $query{cmd}\n";

tell_user("Plan to call: $eval");
eval($eval);
tell_user("Eval returns $@");

# TODO: allow ";" to separate commands, but check for errors

# TODO: disallow diagonal moves explicitly

# for $i (sort keys %ENV) {print "KEY: $i, VAL: $ENV{$i}<br>\n";}

# pull user data from SQLite3 db (for now)

# TODO: return JSON
# print "[$time] Message received: $query\n";

=item comments

Table stored in /sites/DB/yamc.db for now but this public so be careful

=cut

# TODO: move data out of public dir

