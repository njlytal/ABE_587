#!/usr/bin/env perl
use strict;
use warnings;
use autodie;
use feature 'say';

#### PSEUDOCODE ###
# 1. Read in string
# 2. Use lc() to remove capitals for purpose of test
# 3. Use regex to remove spaces
# 4. Compare base string with its reverse
# 5. If equal: yes! If not: no! 

# Read in statement & remove caps
my $line = lc(shift @ARGV);

# Use regex to remove spaces
$line =~ s/\s+//g;

my $revline = scalar reverse($line);

say "$line vs $revline:";

if($line cmp $revline)
{   
    say "no!";
}
else
{
    say "yes!";
}
