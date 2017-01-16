#!/usr/bin/env perl 

# heads ...
use strict;
use warnings;
use feature qw(say);

# read infor from command line...
die("Please specfify only one todo file...") if scalar @ARGV != 1;
my ($filename) = @ARGV;  # the first input is the filename...

# read file...
open (my $rfh, "<".$filename) 
	or die("Failed to open file ".$filename."...");

# prepend time to the to-do list...
my $current_time = localtime;
my $decoration = "~"x(length($current_time));
say $decoration  ."\n".
		$current_time."\n".
		$decoration;

while (my $line = readline($rfh)) {
	print $line;
}

close ($rfh);
