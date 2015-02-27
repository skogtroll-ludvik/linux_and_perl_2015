package fasta_parser;

use strict;
use warnings;
use fasta_seq;

=pod

Create fasta_parser objects

=cut

sub new
{
    my $class = shift;

    my $self = {};

    bless $self, $class;

    return $self;
}

sub filename
{}

1;
