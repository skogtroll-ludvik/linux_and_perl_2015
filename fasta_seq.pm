package fasta_seq;
use strict;
use warnings;

sub new
{
    my $class=shift;
    my $self={ID=>$_[0],
	      seq=>$_[1],
	      desc=>$_[2]};
    bless $self,$class;
    return $self;
}

sub ID
{
    my $self=shift;
    $self->{ID}=shift if defined $_[0];
    return $self->{ID};
}

sub seq
{
    my $self=shift;
    $self->{seq}=shift if defined $_[0];
    return $self->{seq};
}

sub desc
{
    my $self=shift; 
    $self->{desc}=shift if defined $_[0];
    return $self->{desc}; 
}
1;
