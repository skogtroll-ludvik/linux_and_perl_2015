package fasta_seq;
use strict;
use warnings;

sub new
{
    my $self={};
    bless $self,"fasta_seq";
    return $self;
}

sub ID
{
    return "ralph";
}

1;
