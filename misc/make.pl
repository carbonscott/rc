#!/usr/bin/perl

use strict;
use warnings;
use feature 'say';

my ($cpp) = shift @ARGV;
while (!defined $cpp || $cpp eq "\n") {
	print "Please specify a file to compile: ";
	$cpp = <>;
}
chomp $cpp;
#say $cpp;
#my $run = system("clang++ -g -Wall ".$cpp." -o exe");
my $run = system("clang++ -g -Wall -std=c++11 ".$cpp." -o exe");
($run == 0 && say "Successfully Run!") || say "Error!";
