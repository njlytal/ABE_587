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

if(!@ARGV){
    say "Please provide a sequence."
}




shift @ARGV;

open my $fh '<', $file;

my %hash;

while (my $lines = <$fh>){
    chomp $line;
    my ($key, $value) = split

