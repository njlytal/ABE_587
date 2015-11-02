#!/usr/bin/env perl

use strict;
use warnings;
use autodie;

@ARGV or die 'No input';

my $in       = shift @ARGV;
my $lc       = 0;
my $nobody   = 'Nobody';
my $somebody = 'somebody';

open my $in_fh, '<', $in;

while (my $line = <$in_fh>) {
    chomp($line);
    $lc++;
    if (index($line, $nobody) > -1) {
        print "Nobody at position ", index($line, $nobody), " of line ", $lc,
          "\n";
    }

    if (index($line, $somebody) > -1) {
        warn "ALERT: $somebody is present at position ",
          index($line, $somebody), " of line ", $lc, "\n";
    }
}

__END__

Don't write empty "else" statements.
