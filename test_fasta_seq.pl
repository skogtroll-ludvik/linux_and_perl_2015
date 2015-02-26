#!/usr/bin/perl
use strict;
use warnings;
use Test::More;

require_ok("fasta_seq");

my $ralph=new_ok("fasta_seq",["ralph", "ralph", "ralph"]);

#ID-Stuff

can_ok("fasta_seq","ID");
is($ralph->ID,"ralph","get_ID");
$ralph->ID("willi");
is($ralph->ID,"willi","set_ID");

#Seq-Stuff

can_ok("fasta_seq","seq");
is($ralph->seq,"ralph","get_seq");
$ralph->seq("willi");
is($ralph->seq,"willi","set_seq");

#desc-Stuff

can_ok("fasta_seq","desc");
is($ralph->desc,"ralph","get_desc");
$ralph->desc("willi");
is($ralph->desc,"willi","set_desc");

done_testing();
