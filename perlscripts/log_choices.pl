#!/usr/bin/env perl 

# heads ...
use strict;
use warnings;
use feature qw(say);
use IO::Prompter;

my $commands = {
				slog => "vi ~/Dropbox/00-Workflow/00-workflow.txt",
				nlog => "vi ~/Dropbox/00-Workflow/10-notes.txt",
				quote=> "vi ~/.vim/settings/quotes",
				tif  => "vi ~/Dropbox/00-Workflow/20-today_I_found.txt",
				exit => "exit"
};

ASKING:
while (1) {
				my $selection = prompt 'Choose a type of log: ', 
																-menu => {
																				schedule => "slog",
																				note     => "nlog",
																				quote    => "quote",
																				qq(today I found) => "tif",
																				exit     => "exit"
																}, ">";

				if ($selection eq "exit") {
								last ASKING;
				} else {
								system($commands->{$selection}) == 0 or die("The command cannot be executed at ".$?);
				}
}

