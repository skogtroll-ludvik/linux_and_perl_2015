package fasta_seq;
use strict;
use warnings;

sub new
{
    my $class=shift;
    my %param=@_;
    die "You'll have to provide ID and sequence for a fasta_seq object" unless (exists $param{ID} and exists $param{seq});
    my $self={};
    bless $self,$class;
    $self->ID($param{ID});
    $self->seq($param{seq});
    $self->desc($param{desc}) if (exists $param{desc});
    $self->species($param{species}) if (exists $param{species});
    return $self;
}

sub ID
{
    my $self=shift;
    if (defined $_[0])
    {
	die "Non valid ID" if ($_[0]=~/\s/);
	$self->{ID}=shift;
    }
    return $self->{ID};
}

sub species
{
    my $self=shift;
    if (defined $_[0])
    {
	die "Non valid species" if ($_[0]=~/\n/);
	$self->{species}=shift;
    }
    return $self->{species};
}

sub as_fasta
{
    my $self=shift;
    my$fasta=">".$self->ID;
    if (defined $self->species){$fasta.=" ".$self->species;}
    $fasta.=" ".$self->desc if (defined $self->desc);
    $fasta.="\n".$self->seq."\n";
    return $fasta;
}

sub seq
{
    my $self=shift;
    if (defined $_[0])
    {
	die "Non valid sequence" if ($_[0]=~/[\d\s]/);
	$self->{seq}=shift;
    }
    return $self->{seq};
}

sub desc
{
    my $self=shift; 
    if (defined $_[0])
    {
	die "Non valid description" if ($_[0]=~/\n/);
	$self->{desc}=shift;
    }
    return $self->{desc}; 
}
1;
