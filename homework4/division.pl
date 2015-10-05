#!/usr/bin/env perl

use strict;
use warnings;
use autodie;

unless (@ARGV) {
    die "No entry given!\n";
}

unless (scalar(@ARGV) == 2) {
    die "Please enter only 2 numbers!\n";
}

my $one = shift @ARGV;
my $two = shift @ARGV;
#my $out = 'out.txt';
#my $err = 'err.txt';
#
#open my $out_fh, '>', $out;
#open my $err_fh, '>', $err;

if ($one < 0 or $two < 0) {
    die "Only positive numbers, please!\n";
}

if ($two == 0) {
    die "You can't divide by zero!\n";
}

my $div = sprintf("%.2f", $one / $two);

print "The result is $div.\n";

__END__

Just print STDERR/STDOUT and let the user sort it out.
