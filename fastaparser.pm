package fastaparser;
use strict;
use warnings;
use Data::Dumper;

sub parser
{
    my $filename = $_[0];
    my %seqs;
    my $seq;
    my $id;
    my $n = 0;

	open(FILE, "$filename") or die "couldn't! $!";

    while(<FILE>)
    {
	if ($_ =~ /^>ID\s(\w+)/)
	{
	    if ($seq)
	    {
		$seqs{"id".$n} = "$id";
		$seqs{"seq".$n} = "$seq";
	    }
	    $id = $1;
	    $seq = "";
	    $n++;
	}
	else
	{
	    $seq = join('', $seq, $_);
	    #print("$seq");
	}
	$seqs{"id".$n} = "$id";
	$seqs{"seq".$n} = "$seq";
    }
    
    print Dumper(%seqs);
    print("\n$seqs{seq2}");

}
1;
