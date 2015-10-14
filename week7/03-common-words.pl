#!/usr/bin/env perl
use strict;
use warnings;
use autodie;
use feature 'say';
use Data::Dumper;

# PROBLEM 3


# Create two hashes, one for each txt file

if(scalar(@ARGV) != 2){
    die "Please enter two .txt file names."
}




my %hash = (
    'Tucson'        => 'AZ',
    'Boston'        => 'MA',
    'Jackson'       => 'MS',
    'Dixon'         => 'MN',
    'Denton'        => 'TX',
    'Cincinnati'    => 'OH',
);

