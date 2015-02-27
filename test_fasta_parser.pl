#!/usr/bin/perl
use strict;
use warnings;
use Test::More;

require_ok("fasta_parser");
my $parser_obj = new_ok("fasta_parser");
can_ok("fasta_parser","filename");
is($parser_obj->filename, undef, "default filename");
$parser_obj->filename("sequences.fasta");
is($parser_obj->filename, "sequences.fasta", "assigned_name");
can_ok("fasta_parser","parse");
done_testing();
