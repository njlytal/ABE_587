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

# PSEUDOCODE

# Read in: number of lines to split on, output dir., file(s)
# Correctly read in the command line arguments
# Create a new directory to house the split files
# Create a SeqIO object to hold the fasta for operations
# 

# Split portion
# Use regex to find '>' and only continue until $number are found
# 


# MODULE NOTES
# cwd:  Lets you obtain current working directory from within a script

# make_path: Lets you create a new directory from within a script

# catfile: concatenates 1+ directory names & a filename to form a complete path
#          ending with a filename
#   e.g. $path = File::Spec->catfile(@directories, $filename);
#   USES: Gives an exact location to output the split fasta files

# basename: returns last level of a filepath
#   e.g. basename("/foo/bar/") returns bar
#   USES: Combine with catfile to create the filepaths

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
    say "$number, $out_dir";
    say "OK";


    # FILE READER
    for my $file (@ARGV){
        say $file;          #Status check
        
        # Create a SeqIO object to read in data
        my $reader = Bio::SeqIO->new(-file =>$file, -format => 'fasta');
        my $count = 0;  # Keep track of line being read.

        my $filenum = 1; # Number of the current file split
        
        # Define filepath for first file split
        my $path = filepath($file, $out_dir, $filenum);

        while(my $seq = $reader->next_seq){
            $count++;

            # define output object            
            my $out = Bio::SeqIO->new(-file => ">>$path", -format => 'fasta');
            
            # Write the current line to the proper file
            $out->write_seq($seq);

            #say $count, ": ", $seq->seq;    # Print line number and ID

            # After $number lines, cut the fasta file off & write it out
            if($count%$number == 0){
                say "CUT";
                $filenum++;

                # Redefine filepath for next file split
                $path = filepath($file, $out_dir, $filenum);
            }
        }

    }      

}
#    #$out = Bio::SeqIO->new( -file => ">$path", -format => 'fasta')
#    $out->write_seq($seq);



# --------------------------------------------------
sub filepath{
    # FILEPATH - Define current filepath
    my ($file, $out_dir, $filenum) = @_;
    my $newfile = join("", basename($file), ".", $filenum);

    my $path = catfile($out_dir, $newfile);

    say "New file name is $newfile, new path is $path";
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
