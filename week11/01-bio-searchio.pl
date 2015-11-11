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
use File::Basename;
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
    
    say "OK";


}

# --------------------------------------------------
sub get_args {
    my %args;
    GetOptions(
        \%args,
        'number=i',
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
    (Example line here)
=head1 SYNOPSIS

  (Name of file)

Options (defaults in parentheses):
  --help    Show brief help and exit
  --man     Show full documentation

=head1 DESCRIPTION

Describe code functions here

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
