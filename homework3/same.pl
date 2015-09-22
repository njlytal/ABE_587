#!/usr/bin/perl
use strict;
use warnings;

print "Enter 1st name: ";

my $name1 = <STDIN>;

print "Enter 2nd name: ";

my $name2 = <STDIN>;

if(lc($name1) eq lc($name2)){
    print "same\n";
}
else{
    print "different\n";
}
