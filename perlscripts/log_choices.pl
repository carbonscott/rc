#!/usr/bin/env perl 

# heads ...
use strict;
use warnings;
use feature qw(say);
use IO::Prompter;

my $commands = {
				projects  => "vim ~/Dropbox/Projects/projects.txt",
				exit => "exit",
};

ASKING:
while (1) {
				my $selection = prompt 'Choose a type of log: ', 
																-menu => {
																				qq(projects) => "projects",
																				exit     => "exit",
																}, ">";

				if ($selection eq "exit") {
								last ASKING;
				} else {
								system($commands->{$selection}) == 0 or die("The command cannot be executed at ".$?);
				}
}

