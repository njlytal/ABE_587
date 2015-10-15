#!/usr/bin/env perl
use strict;
use warnings;
use autodie;
use feature 'say';
use Data::Dumper;

# PROBLEM 4


# Pseudocode:
# First check the length of the file/sequence
# If no argument: "Please provide a sequence"
# If you read in a file and its length is 0: "Zero-length sequence."

my $seq    = shift or die "No file\n";
my $length = shift || 3; # Define a default length value

if (-e $seq) {
    open my $fh, '<', $seq;
    $seq = join '', <$fh>;
}

say "seq ($seq)";
