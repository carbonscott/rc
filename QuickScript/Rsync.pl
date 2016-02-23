#!/usr/bin/perl

use strict;
use warnings;
use feature 'say';

# die("Error:\n./Rsync.pl [source] [dest]") unless @ARGV == 2;

my ($source, $dest) = @ARGV;

my $command = 'rsync';
my $flag = '-a';

say(join(" ", ($command, $flag, $source, $dest)));
system(join(" ", ($command, $flag, $source, $dest)));
