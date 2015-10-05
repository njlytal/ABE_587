#!/usr/bin/env perl

use strict;
use warnings;
use autodie;

@ARGV or die 'No input';

my $in  = shift @ARGV;
my $out = 'rev_out.fasta';
open my $in_fh,  '<', $in;
open my $out_fh, '>', $out;

print "This is the reverse complement:\n";
print $out_fh "This is the reverse complement:\n";

while (my $line = <$in_fh>) {
    chomp($line);
    $line =~ tr/ACGT/TGCA/;
    print $line, "\n";
    print $out_fh $line, "\n";
}

__END__

Half off for not reversing the line or handling both uc/lc text.
