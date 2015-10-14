#!/usr/bin/env perl
use strict;
use warnings;
use autodie;
use feature 'say';
use Data::Dumper;

# PROBLEM 1

# All at once method:

my %hash = (
    'Tucson'        => 'AZ',
    'Boston'        => 'MA',
    'Jackson'       => 'MS',
    'Dixon'         => 'MN',
    'Denton'        => 'TX',
    'Cincinnati'    => 'OH',
);

say Dumper(\%hash);

my $num = 1;
foreach my $city (sort keys %hash){
    say $num, ": $city, ",  $hash{$city}; 
    $num++;
}
