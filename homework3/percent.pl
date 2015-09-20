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

my $i = shift @ARGV;
my $j = shift @ARGV;

if($i + $j == 0){
    die "You can't divide by zero!\n";
}

my $result = sprintf("%.2f", $i/($i+$j) * 100);

print "The percentage is $result %.\n";
