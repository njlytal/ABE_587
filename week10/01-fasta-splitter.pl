#!/usr/bin/env perl

use strict;
use warnings;
use autodie;
use feature 'say';
use Getopt::Long;
use Pod::Usage;
use Bio::SeqIO;
use Cwd 'cwd';
use File::Spec::Functions 'catfile';
use File::Basename 'basename';
use File::Path 'make_path';

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
    
    my $number = $args{'number'} || 500;
    my $out_dir = $args{'out_dir'} || cwd;
    my $file = shift @ARGV;
   # $seq = Bio::SeqIO->new(
   #             -file => $file,
   #             -format => 'fasta');
    
    #split($number, $out_dir);

    say "$number, $out_dir, $file";
    say "OK";
}

# --------------------------------------------------
#sub split {
#
#
#
#    return; # Should return a list of split files
#}


# --------------------------------------------------

sub get_args {
    my %args;
    GetOptions(
        \%args,
        'number=s',
        'out_dir=s',
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
    01-fasta-splitter.pl -n 20 -o ~/split file1.fa [file2.fa ...]

=head1 SYNOPSIS

  01-fasta-splitter.pl 

Options (defaults in parentheses):
  --number  The maximum number of sequences per file (500)
  --out_dir Output directory (cwd)
  --help    Show brief help and exit
  --man     Show full documentation

=head1 DESCRIPTION

Describe what the script does, what input it expects, what output it
creates, etc.

=head1 SEE ALSO

perl.

=head1 AUTHOR

NICHOLAS LYTAL E<lt>njlytal@email.arizona.eduE<gt>.

=head1 COPYRIGHT

Copyright (c) 2015 Nick

This module is free software; you can redistribute it and/or
modify it under the terms of the GPL (either version 1, or at
your option, any later version) or the Artistic License 2.0.
Refer to LICENSE for the full license text and to DISCLAIMER for
additional warranty disclaimers.

=cut
