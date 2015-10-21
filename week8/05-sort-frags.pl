#!/usr/bin/env perl
use strict;
use warnings;
use autodie;
use feature 'say';


### PSEUDOCODE ###
# Read output of 04-restriction.pl into this script w/ STDIN
# Apply split on ^ for the whole sequence, put this into an array
# Sort the array by length, then print each frag on a separate line in order


my $input = <STDIN>;

chomp ($input);

# Test if input works correctly
# say "Took in the following: $input";

my @array = split(/\^/, $input);

my @sortarray = sort { length($a) <=> length($b)}(@array);

for (my $i = 0; $i < scalar(@sortarray); $i++)
{
    say $sortarray[$i];
}

