#!/usr/bin/perl
use strict;
use warnings;
use Test::More;

require_ok("fasta_parser");
my $parser_obj = new_ok("fasta_parser");


done_testing();
