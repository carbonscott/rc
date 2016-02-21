#!/usr/bin/perl

use strict;
use warnings;
use feature 'say';

my ($iPID) = @ARGV;
my $isExist = kill(0, $iPID);
if ($isExist) {
	say "Process is running!";
}
else {
	say "Process is not running!";
}

