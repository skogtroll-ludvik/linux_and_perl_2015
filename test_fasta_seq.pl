#!/usr/bin/perl
use strict;
use warnings;
use Test::More;


require_ok("fasta_seq");
my $ralph=new_ok("fasta_seq",["ralph"]);
can_ok("fasta_seq","ID");
is($ralph->ID,"ralph","get_ID");
$ralph->ID("willi");
is($ralph->ID,"willi","set_ID");

can_ok("fasta_seq", "species");
is($ralph->species,undef,"get_species");
my $norbert=new_ok("fasta_seq",["norbert","robot"]);
is($norbert->species,"robot","get_norbert_species");
$ralph->species("human");
is($ralph->species,"human","set_species");

can_ok("fasta_seq", "as_fasta");
is($ralph->as_fasta,">willi human","as_fasta");


done_testing();
