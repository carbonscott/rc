#!/usr/bin/perl

use strict;
use warnings;
use feature 'say';

# input resolution

my @resolution = @ARGV;
my $resolution_str = join(" ",@resolution);
#say $resolution_str;

# generate .cvtfile

my $cvt = 'cvt '. $resolution_str . ' >.cvtfile';
system($cvt);

# read ~/.cvtfile
open my $mode, ".cvtfile";

# search for line which has "modeline" {{

my $info_line = '';
my $info_num = '';
while (my $line = <$mode>) {
	if ($line =~ s/Modeline (.*)\n/$1/g) {
		$info_line = $line;
		($info_num = $line) =~ s/"(.*)" .*/$1/g;
		#say $info_line;
		#say $info_num;
	}
}

close $mode;

# apply it by xrandr {{

my %xrandr = (
	newmode => 'xrandr --newmode ' . $info_line,
	addmode => 'xrandr --addmode DP-1 ' . $info_num,
	output => 'xrandr --output DP-1' . ' --mode ' . $info_num,
	delmode => 'xrandr --delmode DP-1 ' . $info_num,
);

#say $xrandr{newmode};
#say $xrandr{addmode};
#say $xrandr{output};
#say $xrandr{delmode};

system($xrandr{newmode});
system($xrandr{addmode});
system($xrandr{output});

# }}

# }}
