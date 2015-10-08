#!/usr/bin/env perl
use strict;
use warnings;
use autodie;
use feature 'say';

# PROBLEM 1

if(!@ARGV) {
    die "Please provide a list of numbers.";
}


print "evens = ";
for my $number(@ARGV){
    if($number%2 == 0){
        print "$number ";
    }
}
print "\n";
