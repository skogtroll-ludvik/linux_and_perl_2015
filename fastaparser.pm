package fastaparser;


sub parse_fasta_file
{
    my ($file) = @_;

    my %seqs = ();
    my $key = "";

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
	    $seqs{$key}={id => $key,species => $species, desc => $desc, seq => ""};
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
