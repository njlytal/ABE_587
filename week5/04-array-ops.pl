#!/usr/bin/env perl
use strict;
use warnings;
use autodie;
use feature 'say';

# PROBLEM 4

my @list = (101,2,15,22,95,33,2,27,72,15,52);

say "array = ", join (', ', @list);

my $last = pop @list;

print "popped = $last, " ;
say "array = ", join (', ', @list); # Now the last entry is removed

my $first = shift @list;

print "shifted = $first, ";
say "array = ", join (', ', @list); # Now the first entry is removed as well

push (@list, 12);
say "after push, array = ", join (', ', @list); # Now 12 is the last entry

unshift(@list, 4);
say "after unshift, array = ", join (', ', @list); # Now 4 is the first entry

__END__

Expected output has comma-space, not just comma.
