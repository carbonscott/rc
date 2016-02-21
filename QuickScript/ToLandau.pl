#!/usr/bin/perl

use strict;
use warnings;
use feature 'say';

die("Error:\n./ToLandau.pl [source]") unless @ARGV == 1;

my ($source) = @ARGV;
my $dest = 'root@landau.chem.uic.edu:/home/scott/';

my $command = './Rsync.pl';

say(join(" ", ($command, $source, $dest)));
system(join(" ", ($command, $source, $dest)));
