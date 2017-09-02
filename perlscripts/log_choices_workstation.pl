#!/usr/bin/env perl 

# heads ...
use strict;
use warnings;
use feature qw(say);
use IO::Prompter;

my $commands = {
				slog => "vim ~/Dropbox/OfficeShared/00-Workflow/work-schedule.txt",
				nlog => "vim ~/Dropbox/OfficeShared/00-Workflow/10-notes.txt",
				tif  => "vim ~/Dropbox/OfficeShared/00-Workflow/20-today_I_found.txt",
				exit => "exit"
};

ASKING:
while (1) {
				my $selection = prompt 'Choose a type of log: ', 
																-menu => {
																				schedule => "slog",
																				note     => "nlog",
																				qq(today I found) => "tif",
																				exit     => "exit"
																}, ">";

				if ($selection eq "exit") {
								last ASKING;
				} else {
								system($commands->{$selection}) == 0 or die("The command cannot be executed at ".$?);
				}
}

