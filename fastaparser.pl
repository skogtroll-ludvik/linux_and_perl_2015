#!/usr/bin/perl

use warnings;
use strict;

my $filename="fasta.file";

my %sequences = parse_fasta_file($filename);

sub parse_fasta_file
{
    my ($file) = @_;

    my %seqs = ();
    my $key = "";

    open FASTA, $file or die "$file $!";
    while (<FASTA>)
    {
	if ($_=~/^>/)
	{
	    $seqs{"$_"}="";
	    $key=$_;
	}
	else
	{
	    $seqs{$key}=$seqs{$key}.$_;
	}
    }
    close FASTA or die "$file $!";

    return %seqs;
}
