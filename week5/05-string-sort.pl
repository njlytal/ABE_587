#!/usr/bin/env perl
use strict;
use warnings;
use autodie;
use feature 'say';

# PROBLEM 5

if(!@ARGV) {
    die "Please provide a list of sequences.";
}

my @sizesort = sort {$a cmp $b}(@ARGV);
say "sorted = ", join (",", @sizesort);

my @revsort = sort {$b cmp $a}(@ARGV);
say "reverse = ", join (",", @revsort);
