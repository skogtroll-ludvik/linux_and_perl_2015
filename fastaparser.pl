#!/usr/bin/perl

use warnings;
use strict;

my $filename="fasta.file";
open, FASTA,$filename or die "filename $!";
while <FASTA>
{
    print "$_";
}

close FASTA
