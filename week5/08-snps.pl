#!/usr/bin/env perl
use strict;
use warnings;
use autodie;
use feature 'say';

# PROBLEM 8

if(scalar(@ARGV) != 2) {
    die "Please provide TWO sequences.\n";
}

if(length($ARGV[0]) != length($ARGV[1])) {
    die "Please provide SAME LENGTH sequences.\n";
} 

my @seq1 = split("", $ARGV[0]);
my @seq2 = split("", $ARGV[1]);
my $count = 0;


for(my $i=0; $i<scalar @seq1; $i++){
    if($seq1[$i] cmp $seq2[$i]){
        say "Pos ", $i+1, ": ", $seq1[$i], "=>", $seq2[$i];
        $count++;
    }

}
if($count==1){
    say "Found ", $count, " SNP.";
}
else{
    say "Found ", $count, " SNPs.";

}
