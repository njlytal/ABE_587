#!/usr/bin/env perl
use strict;
use warnings;
use autodie;
use feature 'say';

# PROBLEM 1

if(!@ARGV) {
    say "Please provide a list of numbers.";
}


my $length = scalar @ARGV;
say "Length: $length";

say "*** EVEN NUMBERS ***";
for my $number(@ARGV){
    if($number%2 == 0){
        say "$number";
    }
}

