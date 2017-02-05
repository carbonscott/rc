#!/usr/bin/perl

use strict;
use warnings;
use feature 'say';

my ($psfpdb_name) = @ARGV;
die("Please provide a name for the PSF&PDB file you want to open!\n") if scalar @ARGV != 1;
my $open_files = "vmd $psfpdb_name.psf $psfpdb_name.pdb";
say $open_files;
system($open_files);
