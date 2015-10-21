#!/usr/bin/env perl
use strict;
use warnings;
use autodie;
use feature 'say';

unless(@ARGV)
{
    die "Please provide a FASTA file.\n";
}

my $in = shift @ARGV;
open my $fh, '<', $in;

# Define counter for number of seqs
my $count = 0;

while(my $line = <$fh>)
{
    chomp $line;

    # header with ">"
    if($line =~ /^>(.*)/)
    {
        $line =~ s/\W//g;
        $count++;
        say "$count: $line";
    }

}

if($count == 1)
{
    say "Found $count sequence.";
}
else
{
    say "Found $count sequences.";
}
