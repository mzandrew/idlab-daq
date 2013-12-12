#!/usr/bin/perl

for($i=0;$i<10;$i++){
	for($j=0;$j<10;$j++){
		print(".B${i}_R${j}(\"./ROM/B${i}_R${j}.coe\"),\n");
	}
	for($j=0;$j<10;$j++){
		$k=4*$j;
		print(".ID_B${i}_R${j}_0($k),\n");
		$k=$k+2;
		print(".ID_B${i}_R${j}_1($k)");
		if($i!=9 || $j!=9){
			print(",\n");
		}
	}
	print("\n");
}

