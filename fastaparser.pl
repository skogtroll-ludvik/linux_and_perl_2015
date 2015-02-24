#!/usr/bin/perl

use warnings;
use strict;

my %sequence=();
my $key="";

my $filename="fasta.file";
open FASTA,$filename or die "filename $!";
while (<FASTA>)
{
    if ($_=~/^>/)
    {
	$sequence{"$_"}="";
	$key=$_;
    }
    print ($_)
    else 
{
    $sequence{$key}=$sequence{$key}$_.
}

close FASTA
