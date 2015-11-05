#!/usr/bin/env perl

use strict;
use warnings;
use autodie;
use feature 'say';
use Getopt::Long;
use Pod::Usage;
use Bio::SeqIO;

#PSEUDOCODE
#Read one or more file names from command line 
# Create a SeqIO object to manage genbank file
# Create a findCD subroutine to identify and save coding domain sequences
#Identify 

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
        die "Please enter file(s) to search for CDS.\n";
    }

    # FILE READER
    for my $file (@ARGV){
        # Create object to read in data
        my $reader = Bio::SeqIO->new(-file => $file, -format => 'genbank');  
        
        # Need a variable for the accession name
        my $access;

        # Array of CDS found
        my @cds;

        my $cdcount = 0;

        # Accesses tags to isolate CDS
        while(my $seqObj = $reader -> next_seq){
            my $name = $seqObj -> id;
            $access = $seqObj->accession_number;
            for my $feature_obj ($seqObj->get_SeqFeatures){
                my $primary_tag = $feature_obj->primary_tag;

                my ($start,$end) = ($feature_obj->start, $feature_obj->end);
                my $range = $start .".." . $end;

                for my $tag (sort $feature_obj->get_all_tags){
                    my @values = $feature_obj->get_tag_values($tag);
                    my $value_str = join(",", @values);

                    if($primary_tag eq "CDS" && $tag eq "translation"){
                        $cds[$cdcount] = $value_str;
                        $cdcount++;
                    }

                }
            }

        }        
        # Closing Statement
        say "$access has $cdcount CDS"; # Should be using $access if it worked
        for(my $i = 0; $i<$cdcount; $i++){
            say $i+1, ": ", $cds[$i];
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

03-find-cds.pl rec.gb [rec2.gb ...]

=head1 SYNOPSIS

  03-find-cds.pl 

Options:

  --help   Show brief help and exit
  --man    Show full documentation

=head1 DESCRIPTION

Reads one or more genbank files, then identifies and lists all coding
domain sequences for each.

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
