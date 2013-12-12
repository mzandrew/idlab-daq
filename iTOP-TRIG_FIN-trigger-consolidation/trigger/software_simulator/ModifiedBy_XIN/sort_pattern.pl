#!/usr/bin/perl

open(INFILE,"<","./K_C_2.5.0_WB.txt") 
	or die "can not open file K_C_2.5.0_WB.txt";
open(OUTFILE,">","sorted_K_C_2.5.0_WB.txt")
	or die "can not open file sorted_K_C_2.5.0_WB.txt";
$max_num=0;
$i=0;
while($line = <INFILE>) {
	chomp($line);
	@line=split(/ /,$line);
	#print "$line[0] pixels:";
	$num=$line[0];
	if(${max_num}<$num){
		${max_num}=$num;
	}
	shift @line;
	@line=sort {$a<=>$b} @line; #descent order, because of the shift operation in verilog code 
	unshift(@line,$num);
	print OUTFILE "@line\n";
	$i++;
}
close(INFILE);
close(OUTFILE);
print "max num of pixels is ${max_num}, pattern no is $i\n";
exit(0);


