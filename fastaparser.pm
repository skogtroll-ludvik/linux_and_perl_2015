package fastaparser;

sub parse_fasta_file
{
    my ($file) = @_;

    my %seqs = ();
    my $key = "";

    open FASTA, $file or die "$file $!";
    while (<FASTA>)
    {
	if ($_=~/^>/)
	{
	    $seqs{"$_"}="";
	    $key=$_;
	}
	else
	{
	    $seqs{$key}=$seqs{$key}.$_;
	}
    }
    close FASTA or die "$file $!";

    return %seqs;
}

1;
