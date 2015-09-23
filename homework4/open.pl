#!/usr/bin/perl
use strict;
use warnings;
use autodie;


my $file = shift @ARGV;
my $out = 'open_out.txt';
open my $file_fh, '<', $file;
open my $out_fh, '>>', $out;

while(my $line = <$file_fh>) {
    chomp($line);
    print $out_fh uc($line), "\n";
}

