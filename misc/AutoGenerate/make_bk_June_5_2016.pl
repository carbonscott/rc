#!/usr/bin/perl

use strict;
use warnings;
use feature 'say';

=pod
This scirpt is used to generate a hirachy for writing in a neat way;
Usage: QuickAdd {files to compile}
=cut

my (@files) = @ARGV;
my $file = join " ", @files;
my $command = 'cat '. $file .'> main.md && pandoc -V fontsize=12pt -V documentclass=article -V mainfont="Times New Roman" -H header.sty main.md -o output.pdf --latex-engine=xelatex';
system($command);
