#!/usr/bin/perl
use strict;
use warnings;
use Test::More tests=>2;

require_ok("fasta_seq");

my $ralph=new_ok("fasta_seq");
