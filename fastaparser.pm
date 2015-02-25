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

	if ($_=~/^>(\S+)\s*(.*)/)
	{
	    $key = $1;
	    my $desc = "";
	    if (defined $2)
	    {
		$desc = $2;
	    }
	    $seqs{$key}={id => $key, desc => $desc, seq => ""};
	}
	else
	{
	    $seqs{$key}{seq}=$seqs{$key}{seq}.$_;
	}
    }
    close FASTA or die "$file $!";

    return %seqs;
}

>>>>>>> d13b38e4533ed2ff3d29753c2ad87d17d19b9c55
1;
