#!/usr/bin/env perl

use strict;
use warnings;
use autodie;
use feature 'say';
use Getopt::Long;
use Pod::Usage;
use Data::Dumper;

#PSEUDOCODE
# If -p hello, then engage hello subroutine on -a
# If -p rc, then engage reverse complement subroutine on -a 



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
   
    my $program = $args{'program'} or pod2usage("Missing argument");
    my $argument = $args{'argument'} or pod2usage("Missing argument");

    if ($program eq 'hello') {
        hello($argument);
    }
    elsif ($program eq 'rc') {
        rc($argument);
    }
    else {
        die "Invalid program name.\n";
    }
}

# --------------------------------------------------
sub hello {
    my $name = shift;
    say "Hello, $name";

    return;
}


# --------------------------------------------------
sub rc{
    my $line = shift;
    $line =~ tr/ACGTacgt/TGCAtgca/;
    $line = reverse($line);
    print $line, "\n";
}

# --------------------------------------------------
sub get_args {
    my %args;
    GetOptions(
        \%args,
        'help',
        'man',
        'program=s',
        'argument=s',
    ) or pod2usage(2);

    return %args;
}

__END__

# --------------------------------------------------



# --------------------------------------------------

=pod
#:w

=head1 NAME

01-subs.pl - subroutine practice

=head1 SYNOPSIS

  01-subs.pl -p hello -a Tucson

  01-subs.pl -p rc -a GAGAGAGAGTTTTTTTTT

Options:

  --program     The thing to do
  --argument    The argument to the thing
  --help        Show brief help and exit
  --man         Show full documentation

=head1 DESCRIPTION

Either print "hello <something>" or the reverse-complement of something.

=head1 SEE ALSO

perl.

=head1 AUTHOR

NICHOLAS LYTAL E<lt>Nick@email.arizona.eduE<gt>.

=head1 COPYRIGHT

Copyright (c) 2015 Nick

This module is free software; you can redistribute it and/or
modify it under the terms of the GPL (either version 1, or at
your option, any later version) or the Artistic License 2.0.
Refer to LICENSE for the full license text and to DISCLAIMER for
additional warranty disclaimers.

=cut
