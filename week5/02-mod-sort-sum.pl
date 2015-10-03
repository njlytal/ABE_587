#!/usr/bin/env perl
use strict;
use warnings;
use autodie;
use feature 'say';

# PROBLEM 1

if(!@ARGV) {
    die "Please provide a list of numbers.";
}


my $esum = 0; #sums of evens
my $osum = 0; #sums of odds

for my $number(@ARGV){
    if($number%2 == 0){
        $esum = $esum + $number;
    }
    elsif($number%2 == 1){
        $osum = $osum + $number;
    }
}
say "---------------";
say "sum evens = $esum";
say "sum odds = $osum";
say "---------------";
