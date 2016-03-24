#!/usr/bin/perl
use FindBin;

#use warnings;
#use strict;
my $script_dir = $FindBin::Bin;

my $pileup_mpileup  = $ARGV[0];
my $param1          = $ARGV[1];
my $param2          = $ARGV[2];
my $param3          = $ARGV[3];
my $param4          = $ARGV[4];
my $param5          = $ARGV[5];
my $param6          = $ARGV[6];

if($pileup_mpileup eq "pileup"){
	# param7 is only used that pileup using
	my $param7          = $ARGV[7];
	print "using pileup.", "\n";
	system("perl $script_dir/call_indels_from_pileup.pl $param1 $param2 $param3 $param4 $param5 $param6 $param7");
}else{
	print "using mpileup.", "\n";
	system("perl $script_dir/call_indels_from_mpileup.pl $param1 $param2 $param3 $param4 $param5 $param6");
}