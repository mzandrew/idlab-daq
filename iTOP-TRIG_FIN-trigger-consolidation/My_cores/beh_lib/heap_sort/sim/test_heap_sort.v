`timescale 1ns/1ps

module test_heap_sort;

//fill the input array

parameter element_size=9;
parameter array_size=256;
parameter debug_submodule=0;
parameter debug=0;

parameter MIN_MAX=1;


reg [element_size*array_size-1:0] array_input;
reg [element_size*array_size-1:0] tmp_array;
reg [element_size*array_size-1:0] tmp_array_;
wire [element_size*array_size-1:0] array_output;
reg [element_size-1:0] tmp_reg;
reg [element_size-1:0] tmp_reg_;
reg start;
integer i,j;

initial begin
	array_input=0;
	start=0;
	#10 ;
	$display("random number generation ...");
	for(i=0;i<array_size;i=i+1) begin
		tmp_reg=($random);//%(1<<element_size));
		array_input=array_input|tmp_reg<<(element_size*i);
		if(debug==1)
			$display("%d: %x",i,tmp_reg);
		#1;
	end
	start=1;
	#10;
	if(debug==1)
		$display("array_output is %x",array_output);
	for(i=0;i<array_size;i=i+1) begin
		tmp_array=array_output>>(element_size*i);
		tmp_reg=tmp_array[element_size-1:0];
		tmp_array_=array_input>>(element_size*i);
		tmp_reg_=tmp_array_[element_size-1:0];
		if(debug==1)
			$display("array_input[%d]: %x\t array_reg[%d]: %x",i,tmp_reg_,i,tmp_reg);
	end
	$display("equivalence checking ...");
	for(i=0;i<array_size;i=i+1) begin
		tmp_array=array_output>>(element_size*i);
		tmp_reg=tmp_array[element_size-1:0];
		for(j=0;j<array_size;j=j+1) begin
			tmp_array_=array_input>>(element_size*j);
			tmp_reg_=tmp_array_[element_size-1:0];
			if(tmp_reg==tmp_reg_)
				j=array_size+1; //jump out
		end
		if(j==array_size) begin
			$display("equivalence checking failed: output data %x is not found in the input array", tmp_reg);
			$finish;
		end
	end
	for(i=0;i<array_size;i=i+1) begin
		tmp_array=array_input>>(element_size*i);
		tmp_reg=tmp_array[element_size-1:0];
		for(j=0;j<array_size;j=j+1) begin
			tmp_array_=array_output>>(element_size*j);
			tmp_reg_=tmp_array_[element_size-1:0];
			if(tmp_reg==tmp_reg_)
				j=array_size+1; //jump out
		end
		if(j==array_size) begin
			$display("equivalence checking failed: input data %x is not found in the output array", tmp_reg);
			$finish;
		end
	end
	if(array_size>1) begin
		$display("order checking ...");
		for(i=0;i<array_size-1;i=i+1) begin
			tmp_array=array_output>>(element_size*i);
			tmp_reg=tmp_array[element_size-1:0];
			tmp_reg_=tmp_array[2*element_size-1:element_size];
			if(MIN_MAX==1) begin //MIN
				if(tmp_reg_<tmp_reg) begin
					$display("order checking failed: data |%d| %x is smaller than data |%d| %x",i+1,tmp_reg_,i,tmp_reg);
					$finish;
				end
			end else begin
				if(tmp_reg_>tmp_reg) begin
					$display("order checking failed: data |%d| %x is larger than data |%d| %x",i+1,tmp_reg_,i,tmp_reg);
					$finish;
				end
			end
		end
	end
	$display("test is passed successfully!");
	$finish;
end


heap_sort #(.array_size(array_size),.element_size(element_size),.debug(debug_submodule),.MIN_MAX(MIN_MAX)) 
	UUT (.start(start),.array_i(array_input),.array_o(array_output));

endmodule


