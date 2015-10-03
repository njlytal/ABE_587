#!/usr/bin/env perl
use strict;
use warnings;
use autodie;
use feature 'say';

# PROBLEM 7

if(!@ARGV) {
    die "Please provide a list of sequences.";
}

for my $seq(@ARGV){
    my $g = $seq =~ tr/G//;
    my $c = $seq =~ tr/C//;
    say "-----------------";
    say $seq;
    say "Length: ", length($seq);
    say "#GC: ", $g+$c;
    my $percent = sprintf("%.2f", 100*($g+$c)/length($seq));
    say "%GC: ", $percent;
}

