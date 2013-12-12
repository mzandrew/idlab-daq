#!/usr/bin/perl

#prints parameter list
for($i=0;$i<10;$i++) {
	for($j=0;$j<10;$j++) {
		print("parameter B${i}_R${j}=\"NULL.mif\"\n");
	}
}
print("\n");
for($i=0;$i<10;$i++) {
	for($j=0;$j<10;$j++) {
		print("parameter ID_B${i}_R${j}_0=8'h00\n");
		print("parameter ID_B${i}_R${j}_1=8'h00\n");
	}
}
print("\n");
#prints instantiation
for($i=0;$i<10;$i++) {
	print("correlator_block #(\n");
	for($j=0;$j<10;$j++) {
	 	print(".ROM${j}_coe(B${i}_R${j}),\n");
	}
	for($j=0;$j<10;$j++) {
	 	print(".ID_0_${j}(ID_B${i}_R${j}_0),\n");
	 	print(".ID_1_${j}(ID_B${i}_R${j}_1)");
		if($j<9){
			print(",");
		}
		print("\n")
	}
	print(")\n");
	print("u_correlator_block_${i}(\n");
	print(".clk(clk),\n.rst(rst),\n.cmd_i(cmd_reg[2*${i}+1:2*${i}]),\n.addr_i(addr_reg[6*${i}+5:6*${i}]),\n.max_sum(sums[26*${i}+25:26*${i}]),\n.max_sumid(sumids[8*${i}+7:8*${i}]),\n.max_sum_valid(sum_valids[$i])\n");
	print(");\n");
}

