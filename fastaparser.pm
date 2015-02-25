package fastaparser;

sub parse_fasta_file
{
    my ($file) = @_;

    my %seqs = ();
    my $key = "";

    open FASTA, $file or die "$file $!";
    while (<FASTA>)
    {

	if ($_=~/^>(\S+)\s*(.*)/)
	{
	    $key = $1;
	    $seqs{$key}={id => $key, desc => $2, seq => ""};
	}
	else
	{
	    $seqs{$key}{seq}=$seqs{$key}{seq}.$_;
	}
    }
    close FASTA or die "$file $!";

    return %seqs;
}

1;
