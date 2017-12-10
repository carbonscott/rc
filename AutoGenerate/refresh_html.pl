#!/usr/bin/perl

use strict;
use warnings;
use diagnostics;
use feature 'say';
use File::Compare;

my $file = shift @ARGV;
my $file2 = $file."_bk";
system('cp '.$file.' '.$file2);
my $bib = "";

while (1) {
	if (compare($file, $file2) == 0) {
	}
	else {
  $bib = "";
  $bib = "--bibliography References/*.bib" if glob("References/*.bib");
  my $command = 'cat '. $file .'> main.md && pandoc '.$bib.' --mathjax -s main.md -o output.html';
		system($command);
		system("cp ".$file." ".$file2);
  say $command;
		say "-------COMPILED--------";
	}
	sleep (1);
}
