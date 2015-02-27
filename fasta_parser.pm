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
{
    my $self=shift;
    my $filename=$_[0];
    $self->{filename}=$filename if (defined $filename);
    return $self->{filename};
}

sub parse
{
    my $self=shift;
    my @seqs = ();
    #my %seqs = ();
    my $key = "";
    my $file=$self->filename;
    
    open FASTA, $file or die "$file $!";
    while (<FASTA>)
    {
	chomp($_);

	if ($_=~/^>(\S+)\s*(\S*)\s*(.*)/)
	{
	    $key = $1;
	    my $species = "";
	    if (defined $2)
	    {
		$species = $2;
	    }
	    my $desc = "";
	    if (defined $3)
	    {
		$desc = $3;
	    }

	    my $fasta_obj = fasta_seq->new(ID => $key, species => $species, desc => $desc, seq => "");
	    #$seqs{$key}={id => $key,species => $species, desc => $desc, seq => ""};
	    push(@seqs, $fasta_obj);
	}
	else
	{
	    $seqs[-1]->seq($seqs[-1]->seq.$_);
	    #$seqs{$key}{seq}=$seqs{$key}{seq}.$_;
	}
    }
    close FASTA or die "$file $!";

    return @seqs;
    #return %seqs;
}
1;
