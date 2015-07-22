#!/usr/bin/perl

use strict;
use warnings;
use feature 'say';

=pod

=head1 Labor save in git push

=head2 STATE, TRANSFORM, INTERPRET

type in commit to this script, add it to git commit
./git_push.pl {commit}

=cut

my ($commit) = @ARGV;
while (!defined $commit || $commit eq '\n') {
	say "Please specify the commit to git branch: ";
	$commit = <>;
}
chomp $commit;
my $git_push = "git add . --all && git commit -m \"".$commit."\" && git push origin master";
say $git_push;
system($git_push);
if ($? == -1) {
    print "failed to execute: $!\n";
}

