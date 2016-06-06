#!/usr/bin/perl

use strict;
use warnings;
use feature 'say';

# set ownership
my $email = "git config user.email \"wangimagine\@gmail.com\"";
say $email;

# change branch

my ($branch_name) = @ARGV;
die("Please give a name for branch!") if $branch_name eq '';
my $new_branch = "git fetch && git checkout \"$branch_name\"";
say $new_branch;

# Git pull

my $pull = "git pull";

# workflow
system($email);
system($new_branch);
system($pull);
