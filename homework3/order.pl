#!/usr/bin/perl
use strict;
use warnings;
use feature 'say';

unless(@ARGV) {
    die "No entry given!\n";
}

unless(scalar(@ARGV) == 2)
{
    die "Please enter only 2 words!\n";
}

my $one = shift @ARGV;
my $two = shift @ARGV;

my %words = (
    $one => '1',
    $two => '2',
);

# NOTE: THIS DOESN'T WORK!

my $input = join(', ', $one, $two);

my $order = join(', ', sort keys %words);

if($input eq $order){
    print "Right Order!\n";
}
else{
    print "Wrong Order!\n";
}
