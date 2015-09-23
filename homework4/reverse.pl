#!/usr/bin/perl
use strict;
use warnings;
use autodie;

my $in = shift @ARGV;
my $out = 'rev_out.fasta';
open my $in_fh, '<', $in;
open my $out_fh, '>', $out;

print "This is the reverse complement:\n";
print $out_fh "This is the reverse complement:\n";

while(my $line = <$in_fh>) {
    chomp($line);
    $line =~ tr/ACGT/TGCA/;
    print $line, "\n";
    print $out_fh $line, "\n";
}
