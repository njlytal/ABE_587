#!/usr/bin/env perl
use strict;
use warnings;
use autodie;
use feature 'say';


# Added info:
# Goal is to find R^AATTY
# R: A OR G
# Y: C OR T
# regex: /([GA])AATT[(CT])/
#
# 1. Take the file and convert into one long sequence (see wk7)
# 2. Read the whole sequence and substitute where needed

my $seq = shift or die "Please provide a sequence or file.\n";

# If given a file, convert to a single line sequence
if (-e $seq)
{
    open my $fh, '<', $seq;
    $seq = join '', <$fh>;
    $seq =~ s/\W+//g;
}


$seq =~ s/([GA])AATT([CT])/$1\^AATT$2/g;

say $seq;
