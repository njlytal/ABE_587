#!/usr/bin/env perl
use strict;
use warnings;
use autodie;
use feature 'say';

# PROBLEM 1

if(!@ARGV) {
    die "Please provide a list of numbers.\n";
}


print "evens = ";
for my $number(@ARGV){
    if($number%2 == 0){
        print "$number ";
    }
}
print "\n";

__END__

Output expected to have commas which was to force you to use an 
array to accumulate and then join to create the string.

One point off.
