#!/usr/bin/env perl
use strict;
use warnings;
use autodie;
use feature 'say';

# PROBLEM 3

if(!@ARGV) {
    die "Please provide a list of numbers.\n";
}

# SORT (DEFAULT)

my @defsort = sort @ARGV;
say "default sort = @defsort"; # NOT sorted numerically!

# SORT (NUMERIC)

my @numsort = sort {$a <=> $b}@ARGV;
say "numeric sort = @numsort"; # It's numeric now!

# SORT (REVERSE NUM)

my @revsort = sort {$b <=> $a}@ARGV;
say "reverse numerical sort = @revsort"; # Reverse AND numeric


__END__

"die" w/o a newline will include the line number where the exception
occurs which is not part of the expected output.

Expected output has commas b/w the values so that you would use "join."

One point off.
