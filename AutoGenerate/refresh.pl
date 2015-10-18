#!/usr/bin/perl

use strict;
use warnings;
use diagnostics;
use feature 'say';
use File::Compare;

# my $file = "./chapters/set6.md";
# my $file2 = "./chapters/set6_bk.md";
my $file = shift @ARGV;
my $file2 = $file."_bk";
system('cp '.$file.' '.$file2);
my $command = 'cat '. $file .'> main.md && pandoc -V fontsize=12pt -V documentclass=article -V mainfont="Times New Roman" -H header.sty main.md -o output.pdf --latex-engine=xelatex';

while (1) {
	if (compare($file, $file2) == 0) {
	}
	else {
		system($command);
		system("cp ".$file." ".$file2);
		say "-------COMPILED--------";
	}
	sleep (1);
}
