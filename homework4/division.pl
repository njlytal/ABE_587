#!/usr/bin/perl
use strict;
use warnings;
use autodie;

unless(@ARGV){
    die "No entry given!\n";
}

unless(scalar(@ARGV) == 2)
{
    die "Please enter only 2 numbers!\n";
}

my $one = shift @ARGV;
my $two = shift @ARGV;
my $out = 'div_out.txt';

if($one < 0 or $two < 0){
    die "Only positive numbers, please!\n";
}

if($two == 0){
    die "You can't divide by zero!\n";
}

my $div = sprintf("%.2f", $one/$two);

open my $out_fh, '>', $out;

print $out_fh "The result is $div.\n";

# Still need to handle command line redirects
