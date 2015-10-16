#!/usr/bin/env perl
use strict;
use warnings;
use autodie;
use feature 'say';
use Data::Dumper;

# PROBLEM 4

### OPENING THE FILE ###
# Consider all possible cases
#   No sequence
#   If kmer length is provided, use it instead of 3 
#   sequence is a file--read and convert to a string
#   Empty sequence
#   sequence length under 3

my $seq    = shift or die "Please provide a sequence.\n";
my $length = shift || 3; # Define a default length value

if (-e $seq) {
    open my $fh, '<', $seq;
    $seq = join '', <$fh>;
}

my $seq_length = length($seq);

if (length($seq) == 0){
    die "Zero-length sequence."
}

my $num_possible = $seq_length-$length+1;


if ($num_possible < 1) {
    die "Cannot get any $length mers from a sequence of length $seq_length\n";
}

# At this point, $seq should contain the actual sequence to test
# say "seq ($seq)";

### READING THE KMERS ###

# Hash for all the kmers & their counts
my %mers;

# Start at position 0, advance in groups of kmer length until last possible kmer is read
for (my $pos=0; $pos < $num_possible; $pos++)
{
    my $kmer = substr($seq, $pos, $length);
    
    # If the kmer already exists, increment count (value) by one
    if(exists $mers{$kmer}){
        $mers{$kmer}++;
    }

    # Otherwise initialize a new kmer name with a single count
    else{
        $mers{$kmer} = 1;
    }

}

my $singles = scalar(grep { $_ == 1 } values %mers);

#my $singles = 0;
#
## SINGLETON COUNTER
#foreach my $key (keys %mers)
#{
#    if($mers{$key} == 1){
#        $singles++;
#    }
#}

# say Dumper(\%mers);

# say $seq;

###  INFORMATION ABOUT THE SEQUENCE  ###

# SEQUENCE LENGTH
my $fmt = "%-15s %10s\n";
printf $fmt, "Sequence length", $seq_length;

# MER SIZE
printf $fmt, "Mer size", $length;

# NUMBER OF POSSIBLE KMERS
printf $fmt, "Number of kmers", $num_possible;

# NUMBER UNIQUE KMERS (i.e. Number of keys)
my $num_unique = scalar(keys %mers);
printf $fmt, "Unique kmers", $num_unique;

# NUMBER OF SINGLETONS (i.e. Keys with a value of 1)
printf $fmt, "Num. singletons", $singles;

exit if $singles == $num_unique;

# If at least 10 kmers exist...
say "Most abundant";

my $abun_count = 0;
for my $kmer (
    sort {$mers{$b} <=> $mers{$a} || $a cmp $b } keys %mers
) {
    my $count = $mers{$kmer};
    last if $count == 1;
    say "$kmer: $count";
    last if ++$abun_count == 10;
}
