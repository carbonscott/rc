#!/usr/bin/env perl 

# heads ...
use strict;
use warnings;
use feature qw(say);
use IO::Prompter;

my $commands = {
				slog => "vim ~/Dropbox/00-Workflow/00-workflow.txt",
				nlog => "vim ~/Dropbox/00-Workflow/10-notes.txt",
				quote=> "vim ~/.vim/settings/quotes",
				tif  => "vim ~/Dropbox/00-Workflow/20-today_I_found.txt",
				life  => "vim ~/Dropbox/00-Workflow/30-life.txt",
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
																				qq(life) => "life",
																				exit     => "exit"
																}, ">";

				if ($selection eq "exit") {
								last ASKING;
				} else {
								system($commands->{$selection}) == 0 or die("The command cannot be executed at ".$?);
				}
}

