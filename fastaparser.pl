#!/usr/bin/perl

use warnings;
use strict;
use Data::Dumper;
use fastaparser;

my $filename="fasta.file";

my %sequences = fastaparser::parse_fasta_file($filename);

print Dumper(%sequences);
