#!/bin/usr/env perl
use strict;
use warnings;
use autodie;
use feature 'say';
use Data::Dumper;

my ($file1, $file2, $file3, $file4) = @ARGV;
my $out1 = 'core.txt';
my $out2 = 'variable.txt';


# Define hash: keys = word, values = counts
my %kegg = ();

my $file_ct = @ARGV;

say "Files: $file1, $file2, $file3, $file4";

# Non-subroutine version as a fail-safe
open my $fh1, "<", $file1;
open my $fh2, "<", $file2;
open my $fh3, "<", $file3;
open my $fh4, "<", $file4;

open my $out_fh1, ">>", $out1;
open my $out_fh2, ">>", $out2;

while(my $line = <$fh1>)
{   
    chomp($line);
    my($k, $ct) = split(',', $line);
    if($ct >= 50)
    {
        $kegg{$k}++;
        say "$k occurs $ct times";
    }
    
}


while(my $line = <$fh2>)
{   
    chomp($line);
    my($k, $ct) = split(',', $line);
    if($ct >= 50)
    {
        $kegg{$k}++;
        say "$k occurs $ct times";
    }
}


while(my $line = <$fh3>)
{   
    chomp($line);
    my($k, $ct) = split(',', $line);
    if($ct >= 50)
    {
        $kegg{$k}++;
        say "$k occurs $ct times";
    }
    
}


while(my $line = <$fh4>)
{   
    chomp($line);
    my($k, $ct) = split(',', $line);
    if($ct >= 50)
    {
        $kegg{$k}++;
         say "$k occurs $ct times";
    }
    
}

for my $key (keys %kegg){
    if($kegg{$key} == $file_ct)
    {
        say $out_fh1 $key;
    }
    elsif($kegg{$key} < $file_ct)
    {
        say $out_fh2 $key;
    }
}
say Dumper(\%kegg);

