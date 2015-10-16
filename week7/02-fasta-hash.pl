#!/usr/bin/env perl
use strict;
use warnings;
use autodie;
use feature 'say';
use Data::Dumper;

# PROBLEM 2

if(!@ARGV){
    @ARGV = "Perl_V.genesAndSeq.txt";
}

my $file = shift @ARGV;


open my $fh,'<', $file;

my %hash;

my $last_id;

while (my $line = <$fh>){
    chomp $line;

    # If it's a header with ">"
    if($line  =~ /^>(.*)/){
        $last_id = $line;
        $hash{$last_id} = 0;
    }
    # Other cases must be part of a sequence
    else{
        $hash{$last_id} += length($line);
    }

}

#say Dumper(\%hash);

my @sortkeys = sort{ $hash{$a} <=> $hash{$b} } keys %hash;

foreach my $label (@sortkeys){
    print "\n";
    say "$label: ", $hash{$label};
}
print "\n";

