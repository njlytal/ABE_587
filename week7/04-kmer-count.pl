#!/usr/bin/env perl
use strict;
use warnings;
use autodie;
use feature 'say';
use Data::Dumper;

# PROBLEM 4


# Pseudocode:
# First check the length of the file/sequence
# If no argument: "Please provide a sequence"
# If you read in a file and its length is 0: "Zero-length sequence."

my $seq    = shift or die "Please provide a sequence.\n";
my $length = shift || 3; # Define a default length value

if (-e $seq) {
    open my $fh, '<', $seq;
    $seq = join '', <$fh>;
}

if (length($seq) == 0){
    die "Zero-length sequence."
}

if (length($seq) < 3){
    die "Cannot get any 3 mers from a sequence of length ", length($seq);
}

# At this point, $seq should contain the actual sequence to test
# say "seq ($seq)";

# READING THE KMERS

my %mers;

# Start at position 0, advance until k before last character

for(my $pos=0; $pos <= length($seq)-$length; $pos++)
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

my $singles = 0;

# SINGLETON COUNTER
foreach my $key (keys %mers)
{
    if($mers{$key} == 1){
        $singles++;
    }
}



# say Dumper(\%mers);

# say $seq;

# INFORMATION ABOUT THE SEQUENCE

printf("%-15s %10s\n", "Sequence length", length($seq));
# MER SIZE

printf("%-15s %10s\n", "Mer size", $length);

# NUMBER OF POSSIBLE KMERS
printf("%-15s %10s\n", "Number of kmers", length($seq) - $length + 1);

# NUMBER UNIQUE KMERS (i.e. Number of keys)
printf("%-15s %10s\n", "Unique kmers", scalar(keys %mers));

# NUMBER OF SINGLETONS (i.e. Keys with a value of 1)
printf("%-15s %10s\n", "Num. singletons", $singles);


# If at least 10 kmers exist...
if( scalar(keys %mers) >= 10){
    my @sortkeys = sort {$mers{$b} <=> $mers{$a} || $a cmp $b } keys %mers;
    
    say "Most abundant";
    for( my $i=0; $i <= 9; $i++){
        say $sortkeys[$i], ": ", $mers{$sortkeys[$i]};
    }
}
