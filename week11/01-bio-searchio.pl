#!/usr/bin/env perl

use strict;
use warnings;
use autodie;
use feature 'say';
use Getopt::Long;
use Pod::Usage;
use Bio::SeqIO;
use Bio::SearchIO;


# WARNING: Help doesn't seem to work for some reason, may need to rebuild

#PSUEDOCODE
#Read in a query file
#Use max_significance() to get all reads <= 1e-50
#THEN print the following from those reads in tab-delim format:
#query name, hit name, hsp evalue


main();

# --------------------------------------------------
sub main {
    my %args = get_args();

    if ($args{'help'} || $args{'man_page'}) {
        pod2usage({
            -exitval => 0,
            -verbose => $args{'man_page'} ? 2 : 1
        });
    }; 

	unless(@ARGV){
		die "Please select a blast file to search through.\n";
	}
    
	# Read in filename--this is the only argument
	my $file = shift @ARGV;

	# Establish sig. level to isolate
	my $max_sig = 1e-50;

	# say "Now reading $file...";
	# say "Searching for HSPs of hits with max sig. <= $max_sig...";

	# SearchIO object created from input file
	my $in = Bio::SearchIO->new(-file => $file,
								 -format => 'blast');

	# Header for the output
	say "query \t hit \t evalue";
	# Cycle through queries
	while (my $result = $in->next_result){
		# Cycle through hits
		while(my $hit = $result->next_hit){
			# Cycle through HSPs
			while(my $hsp = $hit->next_hsp){
				if($hsp->significance <= $max_sig){
					say $hsp->query_string, "\t", $hsp->hit_string, "\t", $hsp->evalue;
				}

			}
		}
	}

}

# --------------------------------------------------
sub get_args {
    my %args;
    GetOptions(
        \%args,
        'help',
        'man',
    ) or pod2usage(2);

    return %args;
}

__END__

# --------------------------------------------------

=pod

=head1 NAME
Usage:
	01-bio-searchio.pl blast.out

=head1 SYNOPSIS
  01-bio-searchio.pl

Options (defaults in parentheses):
  --help    Show brief help and exit
  --man     Show full documentation

=head1 DESCRIPTION

Parses through a Blast output file. For hits with significance less than
or equal to 1e-50, it retrieves every High-scoring Segment Pair (HSP)
and lists the following in tab-delimited form:
* Query Name
* Hit Name
* HSP Evalue

=head1 SEE ALSO

perl.

=head1 AUTHOR

NICHOLAS LYTAL E<lt>njlytal@email.arizona.eduE<gt>.

=head1 COPYRIGHT

Copyright (c) 2015 Nicholas Lytal

This module is free software; you can redistribute it and/or
modify it under the terms of the GPL (either version 1, or at
your option, any later version) or the Artistic License 2.0.
Refer to LICENSE for the full license text and to DISCLAIMER for
additional warranty disclaimers.

=cut
