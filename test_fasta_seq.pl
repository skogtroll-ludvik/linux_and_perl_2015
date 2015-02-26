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

## test if the program dies if the sequence contains white characters or digits
# add each white character at the beginning, in the middle or at the
# end of the sequence
my $seq_fails_tester=new_ok("fasta_seq",[ID=>"ralph",seq=> "ralph"]);
foreach my $char_to_test (sort ("\n", " ", "\r", "\f", "\t", "0".."9"))
{
    my $seq = $char_to_test."willi";
    eval { $seq_fails_tester->seq($seq) };
    like($@, qr/Non valid sequence/, sprintf("Sequence format test for %#04x at start", ord($char_to_test)));

    $seq = "wil".$char_to_test."li";
    eval { $seq_fails_tester->seq($seq) };
    like($@, qr/Non valid sequence/, sprintf("Sequence format test for %#04x in middle", ord($char_to_test)));

    $seq = "willi".$char_to_test;
    eval { $seq_fails_tester->seq($seq) };
    like($@, qr/Non valid sequence/, sprintf("Sequence format test for %#04x at end", ord($char_to_test)));
}

## test if the program dies if the species contains line breaks
# add a newline at the beginning, in the middle or at the end of the
# species
my $species_fails_tester=new_ok("fasta_seq",[ID=>"ralph",seq=> "ralph"]);
my $char_to_test="\n";

my $spec = $char_to_test."willi";
eval { $species_fails_tester->species($spec) };
like($@, qr/Non valid species/, sprintf("Species format test for %#04x at start", ord($char_to_test)));

$spec = "wil".$char_to_test."li";
eval { $species_fails_tester->species($spec) };
like($@, qr/Non valid species/, sprintf("Species format test for %#04x in middle", ord($char_to_test)));

$spec = "willi".$char_to_test;
eval { $species_fails_tester->species($spec) };
like($@, qr/Non valid species/, sprintf("Species format test for %#04x at end", ord($char_to_test)));

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
