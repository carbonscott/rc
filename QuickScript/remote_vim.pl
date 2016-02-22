#!/usr/bin/perl

use strict;
use warnings;
use feature 'say';

my ($file_to_edit) = @ARGV;
my $command_to_edit = 'vim scp://scott@landau.chem.uic.edu//"/home/scott/test/'.$file_to_edit.'"';
say($command_to_edit);
system($command_to_edit) == 0 or die("Error: Vim scp failed to connect!");
