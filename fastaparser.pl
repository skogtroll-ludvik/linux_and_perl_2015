#!/usr/bin/perl

use warnings;
use strict;

my %sequence=();

my $filename="fasta.file";
open FASTA,$filename or die "$filename $!";
while (<FASTA>) 
{
    if ($_=~/^>/) {$sequence{"$_"}="";}
}
close FASTA;
