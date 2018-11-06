#!/usr/bin/perl

use strict;
use warnings;
use feature 'say';

=pod
This scirpt is used to generate a hirachy for writing in a neat way;
Usage: QuickAdd {files to compile}
=cut

# ./make.pl [-pdf|-html] <file-to-interpret> 

# if $option eq "-pdf" 
#     $command{pdf};
# elseif $option eq "-html" $command{html};

my %format = (
	-pdf=>"-V fontsize=14pt -V documentclass=article -H header.sty main.md -o output.pdf --latex-engine=xelatex",
	-html=>"--webtex -s main.md -o output.html",
);
my ($choice, @files) = @ARGV;
my @allKeys = keys %format;
my $stringKeys = '';
$stringKeys.=$_.' ' for @allKeys; 
die("The option is not defined. Please choose it from ".$stringKeys.'.') if not exists $format{$choice};
# if $choice << keys %format
my $file = join " ", @files;
my $command = 'cat '. $file .'> main.md && pandoc '.$format{$choice};
#say($command);
system($command);
