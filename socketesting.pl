#!/bin/perl

# convert the standard input (in the form "x=xval&y=yval&z=zval") into
# a JSON string, write a TCL/Expect script, and run it

require "/usr/local/lib/bclib.pl";

# header of the TCL/Expect script we are outputting
open(A, ">/tmp/socket.tcl");
print A << "MARK";
#!/bin/expect
spawn ws ws://127.0.0.1:8000/
MARK
;

while (<>) {

  chomp;

  # ignore lines start with hash
  if (/^\#/) {next;}

  my(%hash) = parse_form($_);

  my(@keys) = ();

  # for each key/val pair (insane level of quoting required)
  for $i (keys %hash) {push(@keys, qq%\\"$i\\": \\"$hash{$i}\\"%);}

  my($keys) = join(", ", @keys);

  print A "send \"{$keys}\\n\"\n";

#  debug("HASH", %hash);

  debug("KEYS", @keys);

}

# we never expect to see this
print A "expect \"999\"\n";

close(A);

system("chmod +x /tmp/socket.tcl; /tmp/socket.tcl");
