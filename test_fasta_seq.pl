#!/usr/bin/perl
use strict;
use warnings;
use Test::More;


require_ok("fasta_seq");
my $ralph=new_ok("fasta_seq",["ralph","robot"]);
can_ok("fasta_seq","ID");
is($ralph->ID,"ralph","get_ID");
$ralph->ID("willi");
is($ralph->ID,"willi","set_ID");

can_ok("fasta_seq", "species");
is($ralph->species,"robot","get_species");
$ralph->species("human");
is($ralph->species,"human","set_species");


done_testing();
