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
    my $file = shift @ARGV; # CHANGE this to allow multiple files

   
    # Use File::Path to make a new directory if it doesn't already exist
    unless(-d $out_dir){
         make_path($out_dir);
    }

    # Run subroutine to split up files
    # NOTE: Need a loop to run ALL files in the array if >1!
    splitter($number, $out_dir, $file);

    # Basic input tester
    say "$number, $out_dir, $file";
    say "OK";

}

# --------------------------------------------------
sub splitter {

    # Import variables into subroutine
    my ($number, $out_dir, $file) = @_;
    
    # Create SeqIO Object
    my $in_seqIO = Bio::SeqIO->new(
                    -file => $file,
                    -format => 'fasta');
    
    #$out_seqIO_obj->write_seq($seqObj);    

    # Define how many times to run this loop
        

    say "$file, $out_dir";

    my $filenum = 1;

    # Define filepath for output
    my $newfile = join("", basename($file), ".", $filenum);

    my $path = catfile($out_dir, $newfile);

    say "New file name is $newfile, new path is $path";

    for(my $i=1; $i<=$number; $i++){
        my $out_seqIO = Bio::SeqIO->new(-format => 'fasta');

        $out_seqIO = $in_seqIO->next_seq(); # Read next sequence
        $out_seqIO>>$path;    


    }

    #while (my $seq = $in_seqIO->next_seq()){
    #    print "Sequence",$seq->id, " first 10 bases ",
    #        $seq->subseq(1,10), "\n";
    #}
    return;
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
