#!/usr/bin/env perl

use strict;
use warnings;
use autodie;

@ARGV or die 'No input';

my $in = shift @ARGV;

open my $in_fh, '<', $in;

my $chars = 0;
my $lines = 0;

while(my $line = <$in_fh>) {
    #chomp($line);
    $chars = $chars + length($line);
    $lines++;
}

my $avg = sprintf("%.2f", $chars/$lines);

print "Total lines: ", $lines, "\n";
print "Total characters: ", $chars, "\n";
print "Avg. line length: ", $avg, "\n";

__END__

When you chomp, you're removing chars that should be counted:

[gila@~/work/students/njlytal/homework4]$ perl count.pl readme.txt
Total lines: 17
Total characters: 926
Avg. line length: 54.47
[gila@~/work/students/njlytal/homework4]$ wc readme.txt
      17     147     943 readme.txt
