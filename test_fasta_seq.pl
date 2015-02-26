#!/usr/bin/perl
use strict;
use warnings;
use Test::More;

require_ok("fasta_seq");

my $ralph=new_ok("fasta_seq",["ralph"]);

#ID-Stuff

can_ok("fasta_seq","ID");
is($ralph->ID,"ralph","get_ID");
$ralph->ID("willi");
is($ralph->ID,"willi","set_ID");

#Seq-Stuff

can_ok("fasta_seq","seq");


done_testing();
