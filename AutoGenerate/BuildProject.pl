#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';
use Cwd;

=pod
This script is used to build project to write PDF.
Usage: BuildProject {Project Name}
	* chapters
	* figures
	* header.sty
	* make.sh
=cut

my ($project) = @ARGV;
system("mkdir -p $project");

my @dirs = qw(Chapters Figures References Tests); # dirs to create
$_ = $project."/".$_ for @dirs;

# add files in the argument of qw {
my @files = qw(header.sty make.pl refresh.pl refresh_latex.pl); # files to cp
# }

my @files2 = @files;
$_ = $project."/".$_ for @files;

my $buildDir = "mkdir -p ".join " ", @dirs;
my $createFiles = "touch ". join " ", @files;

my $command = {
	buildDir => $buildDir,
	createFiles => $createFiles,
};

system($$command{buildDir});

my $rootSource = "~/.vim/AutoGenerate";
$_ = $rootSource."/".$_ for @files2;
my $current = getcwd;
system("cp ". $_." ". $current."/".$project."/") for @files2;
