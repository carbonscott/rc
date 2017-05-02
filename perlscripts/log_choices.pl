#!/usr/bin/env perl 

# heads ...
use strict;
use warnings;
use feature qw(say);
use IO::Prompter;

my $selection = prompt 'Choose a type of log: ', 
																-menu => {
																				schedule => "slog",
																				note     => "nlog",
																}, ">";

my $commands = {
				slog => "vi ~/Dropbox/00-Workflow/00-workflow.txt",
				nlog => "vi ~/Dropbox/00-Workflow/10-notes.txt",
};

system($commands->{$selection}) == 0 or die("The command cannot be executed at ".$?);
