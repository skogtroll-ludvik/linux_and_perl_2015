#!/usr/bin/perl
use strict;
use warnings;
use Test::More;


require_ok("fasta_seq");

my $ralph=new_ok("fasta_seq",[ID=>"ralph",seq=> "ralph"]);
my $hubert=new_ok("fasta_seq",[ID=>"ralph",seq=>"ralph",desc=>"ralph3"]);
my $norbert=new_ok("fasta_seq",[ID=>"norbert",species=>"robot",seq=>"ralph"]);

## test if the program dies if the ID contains white characters
# add each white character at the beginning, in the middle or at the
# end of the ID
my $id_fails_tester=new_ok("fasta_seq",[ID=>"ralph",seq=> "ralph"]);
foreach my $white_to_test (sort ("\n", " ", "\r", "\f", "\t"))
{
    my $id = $white_to_test."willi";
    eval { $id_fails_tester->ID($id) };
    like($@, qr/Non valid ID/, sprintf("ID format test for %#04x at start", ord($white_to_test)));

    $id = "wil".$white_to_test."li";
    eval { $id_fails_tester->ID($id) };
    like($@, qr/Non valid ID/, sprintf("ID format test for %#04x in middle", ord($white_to_test)));

    $id = "willi".$white_to_test;
    eval { $id_fails_tester->ID($id) };
    like($@, qr/Non valid ID/, sprintf("ID format test for %#04x at end", ord($white_to_test)));
}

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
is($ralph->as_fasta,">willi human\nralph\n","as_fasta");

#Seq-Stuff

can_ok("fasta_seq","seq");
is($ralph->seq,"ralph","get_seq");
$ralph->seq("willi");
is($ralph->seq,"willi","set_seq");

#desc-Stuff

can_ok("fasta_seq","desc");
is($ralph->desc, undef,"get_desc");
is($hubert->desc, "ralph3","get_desc");
$ralph->desc("willi");
is($ralph->desc,"willi","set_desc");

done_testing();
