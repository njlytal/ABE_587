#!/usr/bin/perl
use strict;
use warnings;
use autodie;

my $in = shift @ARGV;

open my $in_fh, '<', $in;

my $chars = 0;
my $lines = 0;

while(my $line = <$in_fh>) {
    chomp($line);
    $chars = $chars + length($line);
    $lines++;
}

my $avg = sprintf("%.2f", $chars/$lines);

print "Total lines: ", $lines, "\n";
print "Total characters: ", $chars, "\n";
print "Avg. line length: ", $avg, "\n";
