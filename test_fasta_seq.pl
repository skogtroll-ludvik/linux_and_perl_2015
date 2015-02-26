#!/usr/bin/perl
use strict;
use warnings;
use Test::More;


require_ok("fasta_seq");

my $ralph=new_ok("fasta_seq",[ID=>"ralph",seq=> "ralph2"]);
my $hubert=new_ok("fasta_seq",[ID=>"ralph",seq=>"ralph2",desc=>"ralph3"]);
my $norbert=new_ok("fasta_seq",[ID=>"norbert",species=>"robot"]);

#ID-Stuff

can_ok("fasta_seq","ID");
is($ralph->ID,"ralph","get_ID");
$ralph->ID("willi");
is($ralph->ID,"willi","set_ID");

can_ok("fasta_seq", "species");
is($ralph->species,undef,"get_species");
is($norbert->species,"robot","get_norbert_species");
$ralph->species("human");
is($ralph->species,"human","set_species");

can_ok("fasta_seq", "as_fasta");
is($ralph->as_fasta,">willi human","as_fasta");

#Seq-Stuff

can_ok("fasta_seq","seq");
is($ralph->seq,"ralph2","get_seq");
$ralph->seq("willi");
is($ralph->seq,"willi","set_seq");

#desc-Stuff

can_ok("fasta_seq","desc");
is($ralph->desc, undef,"get_desc");
is($hubert->desc, "ralph3","get_desc");
$ralph->desc("willi");
is($ralph->desc,"willi","set_desc");

done_testing();
