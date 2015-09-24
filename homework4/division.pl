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
my $out = 'out.txt';
my $err = 'err.txt';

open my $out_fh, '>', $out;
open my $err_fh, '>', $err;

if($one < 0 or $two < 0){
    print $err_fh "Only positive numbers, please!\n";
    die
}

if($two == 0){
    print $err_fh "You can't divide by zero!\n";
    die
}

my $div = sprintf("%.2f", $one/$two);

print $out_fh "The result is $div.\n";

