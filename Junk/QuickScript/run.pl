#!/usr/bin/perl

use strict;
use warnings;
use feature 'say';

die "Error:\n[Usage]: ./run.pl [file-to-compile] [num-of-proc]" 
unless (my $len = @ARGV) == 2;

my ($file_to_compile, $num_proc) = @ARGV; # file to compile
my $compile_command = "mpicc -O3 -o crun ".$file_to_compile;
say $compile_command;
system($compile_command) == 0 or die ("Error: compile time error!");
my $run_command = "mpirun -np ".$num_proc." ./crun";
say $run_command;
system($run_command) == 0 or die("Error: run time error!");

