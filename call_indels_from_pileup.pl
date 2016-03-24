#! /usr/bin/perl

#*--<<Definision>>-----------------------------------------*
#PGID        call_indels_from_pileup.pl
#Kind of PG   Main PG
#Create Date  2012/02/07
#
#	Detect Indels 
#		
#   Comandline  pileup file
#               Consensus quality
#               Indel quality
#               Maximum mapping quality
#               read coverage
#		output text file
#*---------------------------------------------------------*
#***********************************************************
# use
#***********************************************************
use strict;
#***********************************************************
# constant
#***********************************************************
#***********************************************************
# variable
#***********************************************************
my $line;
my $pileup;
my $output;
my @data;
my $consensus;
my $indel;
my $map;
my $coverage;
my $prePos = 0;
my $preLine = "";
#***********************************************************
# Main Coading
#***********************************************************
$pileup	   = $ARGV[0];
$consensus = $ARGV[1];
$indel     = $ARGV[2];
$map       = $ARGV[3];
$coverage  = $ARGV[4]; 
$output	   = $ARGV[5];

open (OUTPUT,    ">$output");
open (PILEUP,    "<$pileup")      or die "$pileup : No such file or directory\n";

while($line = <PILEUP>){
	@data = split /\t/, $line;
	if($prePos == $data[1] && $data[2] eq "\*") {
		if( $data[4] >= $consensus
		and $data[5] >= $indel
		and $data[6] >= $map
		and $data[7] >= $coverage){  
			if( $preLine ne "" ){
				## When one line of origin of indel is outputted ##
				#print OUTPUT "$preLine";
			}
			print OUTPUT "$line";
		}
		$preLine = "";
	}else{
		$preLine = $line;
	}
	$prePos = $data[1];
}
close PILEUP;
close OUTPUT;
