#!/usr/bin/perl

use strict;
use warnings;
use feature 'say';

my ($switch) = @ARGV;

if ($switch eq "on") {
# ./media_switch.pl on {
my $s_on = "sudo cp ~/.vim/Switch/hosts_media_on /etc/hosts";
system("$s_on");
say "All media is ON now.";
# }
}
elsif ($switch eq "off") {
# ./media_switch.pl off {
my $s_off = "sudo cp ~/.vim/Switch/hosts_media_off /etc/hosts";
system("$s_off");
say "All media is OFF now.";
# }
}
else {
	say "The value for options is chosen from on or off.";
}
