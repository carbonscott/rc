#!/usr/bin/perl

use strict;
use warnings;
use feature 'say';

#============================================================
# This is a script to mk a c++ project folder which contains 
# * main.cpp
# * AddHeader.pl from .vim
# * make.pl from .vim
#============================================================ 

my ($dir) = @ARGV;
while (!defined $dir || $dir eq "\n") {
	print "Please sepcify a name for directory: ";
	$dir = <>;
}
chomp $dir;

my $ismade = system('mkdir -p '.$dir);
($ismade == 0 && say $dir." is made successfully!") || say $dir." is not created!";
if ($ismade == 0) {
	my $iscopy = system('cp ~/.vim/AddHeader.pl ./'.$dir.'/');
	my $iscopy2 = system('cp ~/.vim/make.pl ./'.$dir.'/');
	($iscopy == 0 && "AddHeader is copied!") || say "AddHeader failed!";
	($iscopy2 == 0 && "make is copied!") || say "make failed!";
	my $iscopy3 = system('cp ~/.vim/main.cpp ./'.$dir.'/');
	($iscopy3 == 0 && "main.cpp is copied!") || say "main.cpp failed!";
}
