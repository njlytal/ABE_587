#!/usr/bin/env/perl

use strict;
use warnings;
use autodie;
use feature 'say';
use Getopt::Long;
use Pod::Usage;
use Bio::SeqIO;
use Cwd 'cwd';
use File::Spec::Functions 'catfile';
use File::Basename;
use File::Path 'make_path';


# MINI SCRIPT TO CONFIRM PROPER FILEPATHS

my ($file, $out_dir) = @ARGV;

unless(-d $out_dir){
    make_path($out_dir);
}

say "$file, $out_dir";

my $filenum = 1;

# Define filepath for output
my $newfile = join("", basename($file), ".", $filenum);

my $path = catfile($out_dir, $newfile);

say "New file name is $newfile, new path is $path";
