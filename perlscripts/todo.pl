#!/usr/bin/env perl 

# heads ...
use strict;
use warnings;
use feature qw(say);

# generate the timestampe...

# prepend time to the to-do list...
my $current_time = localtime;
my $decoration = "~"x(length($current_time));

# new line before and after the time stampe...
my $newline = "\n";

say $newline.
				$decoration  ."\n".
				$current_time."\n".
				$decoration  . 
				$newline;

