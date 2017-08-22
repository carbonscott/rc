template |head|
#!/usr/bin/env perl
endtemplate


template |if|
if (____) {
				____
}
endtemplate


template |use-mceloop|
use MCE::Loop;
endtemplate

template |mce-loop-init|
MCE::Loop::init {
				max_workers => ____,
				chunk_size  => ____,
};
endtemplate

template |for|
foreach my ____ (____) {
				____
}
endtemplate


template |mce-loop|
mce_loop {
				my ($mce, $chunk_ref, $chunk_id) = @_;

				foreach my ____ ($chunk_ref->@*) {
								____
				}

} ____;
endtemplate

template |mce-loop-gather|
my ____ = mce_loop {

				my ($mce, $chunk_ref, $chunk_id) = @_;

				my $1:____;
				foreach my ____ ($chunk_ref->@*) {
								____

								push $1:____, ____;
				}
				$mce->gather($1:____)

} ____;
endtemplate

template |item|
=item ____
endtemplate

template |use_version|
use if $] < ____, ____;
endtemplate

template |head-pl|
#!/usr/bin/env perl

use strict;
use warnings;
use feature qw(say);
endtemplate

template |file::slurp|
use File::Slurp;
endtemplate

template |write_file|
write_file(____,{append => ____},____);    # filename, 0/1, data var...
endtemplate

template |read_file|
read_file(____,{array_ref=>____});
endtemplate

template |split|
split(/____/,____)
endtemplate

template |join|
join(____,____)
endtemplate

template |fork|
#!/usr/bin/env perl 

# heads ...
use strict;
use warnings;
use feature qw(say);
use Parallel::ForkManager;

my $pm = Parallel::ForkManager->new(____);

# SET UP YOUR JOBS
		# examples
		# my @jobs = map {"cd ./sub_0$_ && ./S-run_0$_.sh"} (0..9);
		# push @jobs, map {"cd ./sub_$_ && ./S-run_$_.sh"} (10..89);
		# my @jobs = map {"cd ./sub_$_ && ./S-run_$_.sh"} (20..139);

my @jobs = ____;


foreach my $id (0..____) {
				my $pid = $pm->start and next;
				system($jobs[$id]." > log_".$id) == 0 or die("failed due to ".$?);
				$pm->finish;
}

$pm->wait_all_children;
endtemplate

template |map|
map {____} ____;
endtemplate

template |package|
package ____;

# heads ...
use strict;
use warnings;
use feature qw(say);

# load packages ____

# export names for subroutines
use base 'Exporter';
our @EXPORT = qw(
#				____
);

# subroutines go here ____

1; # Magic true value required at end of module
endtemplate
