#!/usr/bin/perl

use strict;
use warnings;
use feature 'say';

=pod
File List:

* ToLandau
* remote_vim
=cut

my @file_to_bin = qw(ToLandau remote_vim Rsync);
for my $file (@file_to_bin) {
	my $command = 'ln -s /Users/Scott/.vim/QuickScript/'.$file.'.pl '.'/usr/local/bin/'.$file;
	say($command);
	system($command);
}

#say'ln -s '.$_.'.pl '.'/usr/local/bin/'.$_ for (@file_to_bin);
#my $command = 'ln -s '.$_.'.pl '.'/usr/local/bin/'.$_ for (@file_to_bin);
