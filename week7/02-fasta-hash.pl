#!/usr/bin/env perl
use strict;
use warnings;
use autodie;
use feature 'say';
use Data::Dumper;

# PROBLEM 2

my $file = shift || 'Perl_V.genesAndSeq.txt';

open my $fh,'<', $file;

my %hash;

my $last_id;

while (my $line = <$fh>){
    chomp $line;

    # If it's a header with ">"
    if($line  =~ /^>(.*)/){
        $last_id = $1;
        $hash{$last_id} = 0;
    }
    # Other cases must be part of a sequence
    else{
        $hash{$last_id} += length($line);
    }

}

#say Dumper(\%hash);

foreach my $label ( sort{ $hash{$a} <=> $hash{$b} } keys %hash ) {
    say "$label: $hash{$label}";
}

