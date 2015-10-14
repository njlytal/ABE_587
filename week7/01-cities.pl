#!/usr/bin/env perl
use strict;
use warnings;
use autodie;
use feature 'say';
use Data::Dumper;

# PROBLEM 1

# All at once method:

my %hash = (
    Sacramento      => 'CA',
    Tucson          => 'AZ',
       
);

say Dumper(\%hash);


