#!/usr/bin/perl

#A simple perl program to generate pattern

use Getopt::Std;

getopt("ndiv");

$cno=$opt_n;
$max_depth=$opt_d;
$max_interval=$opt_i;
$v=$opt_v;

if($v>0){
	print("cno is $cno, max_depth is $max_depth, max_interval is $max_interval\n");
	}

$total=0;
open(OUTFILE,">","test_pattern.txt") 
	or die ("Unable to open test_pattern.txt");
open(RESULT,">","sorted_pattern.txt");
my @result;
for(my $i=0;$i<$cno;$i++)
	{
	 $num=int(rand($max_depth));
	 $num++;
	 $total=$total+$num;
	 my @pattern;
	 for($j=0;$j<$num;$j++)
		{
		 $tmp=int(rand($max_interval));
		 unshift @pattern,$tmp;
		 unshift @result,$tmp;
		}
	 @pattern=sort {$b<=>$a} @pattern;
	 unshift @pattern,$num;
	 print OUTFILE "@pattern\n";
	}
@result=sort {$a<=>$b} @result;
while(scalar(@result)>0){
	$tmp=shift @result;
	print RESULT "$tmp\n";
}
close(OUTFILE);
close(RESULT);
print "total number of samples is $total\n";

