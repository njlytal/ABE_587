#!/usr/bin/env perl
use strict;
use warnings;
use autodie;
use feature 'say';

# PROBLEM 8

if(scalar(@ARGV) != 2) {
    die "Please provide TWO sequences.\n";
}

if(length($ARGV[0]) != length($ARGV[1])) {
    die "Please provide SAME LENGTH sequences.\n";
} 

say "Done";


