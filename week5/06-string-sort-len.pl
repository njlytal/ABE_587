#!/usr/bin/env perl
use strict;
use warnings;
use autodie;
use feature 'say';

# PROBLEM 6

if(!@ARGV) {
    die "Please provide a list of sequences.";
}

# NOTES: Do we include the list in here or only use the command line?

my @sizesort = sort {length($a) <=> length($b)}(@ARGV);
say "sorted = ", join (",", @sizesort);

my @revsort = sort {length($b) <=> length($a)}(@ARGV);
say "reverse = ", join (",", @revsort);
