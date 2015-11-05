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
    
    # Read command line inputs
    my $number = $args{'number'} || 500;
    my $out_dir = $args{'out_dir'} || cwd;

    # Use File::Path to make a new directory if it doesn't already exist
    unless(-d $out_dir){
         make_path($out_dir);
    }

    # Basic input tester
    # say "$number, $out_dir";
    # say "OK";


    # FILE READER
    for my $file (@ARGV){
        # Create a SeqIO object to read in data
        my $reader = Bio::SeqIO->new(-file =>$file, -format => 'fasta');
        my $count = 0;  # Keep track of line being read.

        my $filenum = 1; # Defines number of the current file split
        
        # Define filepath for first file split
        my $path = filepath($file, $out_dir, $filenum);

        while(my $seq = $reader->next_seq){
            $count++;

            # define output object            
            my $out = Bio::SeqIO->new(-file => ">>$path", -format => 'fasta');
            
            # Write the current line to the proper file
            $out->write_seq($seq);

            # After $number lines, cut the fasta file off & ready a new path
            if($count%$number == 0){
                $filenum++;

                # Redefine filepath for next file split
                $path = filepath($file, $out_dir, $filenum);
            }
        }

    }      

}

# --------------------------------------------------
sub filepath{
    # FILEPATH - Define current filepath
    my ($file, $out_dir, $filenum) = @_;
    my $newfile = join("", basename($file), ".", $filenum);

    my $path = catfile($out_dir, $newfile);

    # Confirm correct filename
    # say "New file name is $newfile, new path is $path";
    return $path;
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
    01-fasta-splitter.pl -n 20 -o ~/split file1.fa [file2.fa ...]

=head1 SYNOPSIS

  01-fasta-splitter.pl 

Options (defaults in parentheses):
  --number  The maximum number of sequences per file (500)
  --out_dir Output directory (cwd)
  --help    Show brief help and exit
  --man     Show full documentation

=head1 DESCRIPTION

This script takes in a fasta file and splits it into several pieces.
Each piece has the specified number of lines (default 500), and is
automatically placed into the designated directory (default to current one).

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
