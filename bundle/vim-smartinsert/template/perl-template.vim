

template |head|
=head____ ____
endtemplate

template |code|
				____
endtemplate


template |bold|
B<____>
endtemplate

template |ital|
I<____>
endtemplate

template |under|
U<____>
endtemplate

template |list|
=over ____

=item ____

=back
endtemplate

template |it|
=item ____
endtemplate


template |end|
=cut
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

				my ____;
				foreach my ____ ($chunk_ref->@*) {
								____

								push ____, ____;
				}
				$mce->gather(____)

} ____;
endtemplate

