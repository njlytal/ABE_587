#!/usr/bin/perl
use strict;
use warnings;
use feature 'say';

unless(@ARGV) {
    die "No entry given!\n";
}

unless(scalar(@ARGV) == 2)
{
    die "Please enter only 2 numbers!\n";
}

my $one = shift @ARGV;
my $two = shift @ARGV;

if($one < 0 or $two < 0){
    die "Only positive numbers, please!\n";
}

say "The answer is ", $one+$two, ".\n";
