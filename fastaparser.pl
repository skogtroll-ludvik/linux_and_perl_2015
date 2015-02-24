use strict;
use warnings;
use fastaparser;
use Data::Dumper;

my %seqs = fastaparser::parser("file.fasta");
#fastaparser::parser("file.fasta");
print Dumper(%seqs);


