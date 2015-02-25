#!/usr/bin/perl

use warnings;
use strict;

use fastaparser;

my $filename="fasta.file";

my %sequences = fastaparser::parse_fasta_file($filename);

