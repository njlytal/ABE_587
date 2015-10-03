#!/usr/bin/env perl
use strict;
use warnings;
use autodie;
use feature 'say';

# PROBLEM 3

if(!@ARGV) {
    die "Please provide a list of numbers.";
}

# SORT (DEFAULT)

my @defsort = sort @ARGV;
say "default sort = @defsort"; # NOT sorted numerically!

# SORT (NUMERIC)

my @numsort = sort {$a <=> $b}@ARGV;
say "numeric sort = @numsort";

# SORT (REVERSE NUM)

my @revsort = sort {$b <=> $a}@ARGV;
say "reverse numerical sort = @revsort";

