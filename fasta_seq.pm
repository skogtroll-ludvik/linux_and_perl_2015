package fasta_seq;
use strict;
use warnings;

sub new
{
    my $class = shift;
    my $self = {ID => $_[0]};
    bless $self, $class;
    return $self;
}

sub ID
{
    my $self = shift;
    $self -> {ID} = shift if (definded $_[0]);
    return $self->{ID};
}
1;
