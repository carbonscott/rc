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

