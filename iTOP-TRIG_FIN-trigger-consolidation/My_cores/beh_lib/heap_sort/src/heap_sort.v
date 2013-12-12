`timescale 1ns/1ps

module heap_sort(
		 start,
		 array_i,
		 array_o
		);

parameter array_size=32;
parameter element_size=32;
parameter debug=1;
parameter MIN_MAX=1; //by default is a MIN heap

input [element_size*array_size-1:0] array_i ;
input start;
output [element_size*array_size-1:0] array_o ;

reg [element_size*array_size-1:0] array;

function [element_size-1:0] index_value;
input integer index;
input [element_size*array_size-1:0] array_i;
reg [element_size*array_size-1:0] array_in;
begin
	array_in= (array_i>> (element_size*index));
	index_value=array_in[element_size-1:0];
end
endfunction

function comp; 
input [element_size-1:0] a;
input [element_size-1:0] b; 
begin
	if(MIN_MAX===0) begin //max
		if(a<=b)
			comp=1;
		else
			comp=0;
	end else begin //min
		if(a>=b)
			comp=1;
		else
			comp=0;
	end
end
endfunction

function integer parent_index_heap;
input integer index;
begin
	parent_index_heap=(index+1)/2-1;
end
endfunction

function integer left_child_heap;
input integer index;
begin
	left_child_heap=2*index+1;
end
endfunction

function integer right_child_heap;
input integer index;
begin
	right_child_heap=2*index+2;
end
endfunction


function automatic [element_size*array_size-1:0] heapify;
input integer index;
input integer length;
input [element_size*array_size-1:0] array_i;
reg [element_size*array_size-1:0] array_ii;
//input [element_size*array_size-1:0] array;
integer largest;
integer left_index,right_index;
reg [element_size-1:0] tmp;
reg [element_size-1:0] tmp_reg;
reg [element_size*array_size-1:0] tmp_array;
reg [element_size-1:0] tmp1;
reg [element_size-1:0] tmp2;
reg tmp_comp;
integer i;
begin

array_ii=array_i;

if(debug==1)
	$display("debug heap_sort: in heapify: array_ii is %x, index is %d, length is %d", array_ii,index,length);

left_index=left_child_heap(index);
right_index=right_child_heap(index);

if(debug==1)
	$display("debug heap_sort: in heapify: left_index is %d, right_index is %d",left_index,right_index);

tmp1=index_value(left_index,array_ii);
tmp2=index_value(index,array_ii);
tmp_comp=comp(tmp1,tmp2);

if(debug==1)
	$display("debug heap_sort: after first comp in heapify: tmp1 %x; tmp2 %x; %d", tmp1,tmp2,comp);

if((left_index >=0) && (left_index<length) && tmp_comp==1)
	largest=left_index;
else
	largest=index;

if(debug==1)
	$display("debug heap_sort: after first comp in heapify: largest is %d", largest);

tmp1=index_value(right_index,array_ii);
tmp2=index_value(largest,array_ii);
tmp_comp=comp(tmp1,tmp2);


if(debug==1)
	$display("debug heap_sort: after second comp in heapify: tmp1 %x; tmp2 %x; %d", tmp1,tmp2,comp);

if((right_index>=0) && (right_index<length) && tmp_comp==1)
	largest=right_index;
else
	largest=largest;

if(debug==1)
	$display("debug heap_sort: heapify: largest is %d",largest);

if(largest!=index) begin
	tmp=index_value(index,array_ii);

	tmp_array=0;
	for(i=0;i<array_size;i=i+1) begin
		if(i!=index) begin
			tmp_reg={element_size{1'b1}};
			tmp_array=tmp_array|(tmp_reg<<(element_size*i));
		end
	end
	array_ii=array_ii&tmp_array;

	tmp_reg=index_value(largest,array_ii);
	tmp_array=(tmp_reg<<(element_size*index));
	array_ii=array_ii|tmp_array;

	tmp_array=0;
	for(i=0;i<array_size;i=i+1) begin
		if(i!=largest) begin
			tmp_reg={element_size{1'b1}};
			tmp_array=tmp_array|(tmp_reg<<(element_size*i));
		end
	end
	array_ii=array_ii&tmp_array;

		
	tmp_array=(tmp<<(element_size*largest));
	array_ii=array_ii|tmp_array;

	heapify=heapify(largest,length,array_ii);
end else begin
	heapify=array_ii;
end

end
endfunction


function [element_size*array_size-1:0] build_heap; 
input integer length;
input [element_size*array_size-1:0] array_i;
integer i;
reg [element_size*array_size-1:0] array_ii;
begin
	array_ii=array_i;
	if(debug==1)
		$display("debug heap_sort: in build_heap: array_ii is %x; length is %d",array_ii,length);
	for(i=(length)/2-1;i>=0;i=i-1) begin
		array_ii=heapify(i,length,array_ii);
	end
	build_heap=array_ii;
end
endfunction


function [element_size*array_size-1:0] heap_sort_algorithm;
input [element_size*array_size-1:0] array_i;
reg [element_size*array_size-1:0] array_ii;
integer i;
integer length;
reg [element_size-1:0] tmp;
reg [element_size-1:0] tmp_reg;
reg [element_size*array_size-1:0] tmp_array;
integer j;
begin
	if(debug==1)
		$display("debug heap_sort: before build_heap array_i is %x, array_size is %d",array_i,array_size);
	array_ii=build_heap(array_size,array_i);
	if(debug==1)
		$display("debug heap_sort: after build_heap array_ii is %x",array_ii);
	length=array_size;
	for(i=array_size-1;i>=1;i=i-1) begin

		tmp=index_value(0,array_ii);
		array_ii[element_size-1:0]=index_value(i,array_ii);

		tmp_array=0;
		for(j=0;j<array_size;j=j+1) begin
			if(j!=i) begin
				tmp_reg={element_size{1'b1}};
				tmp_array=tmp_array|(tmp_reg<<(element_size*j));
			end
		end
		array_ii=array_ii&tmp_array;

			
		tmp_array=(tmp<<(element_size*i));
		array_ii=array_ii|tmp_array;

		length=length-1;
		array_ii=heapify(0,length,array_ii);
	end
	if(debug==1)
		$display("after heap sort: array_ii is %x\n",array_ii);
	heap_sort_algorithm=array_ii;
end
endfunction

always@(*) begin
	if(start)	
		array=array_i;
	else
		array=0;
end

assign array_o= heap_sort_algorithm(array);

initial begin
	if(debug==1)
		$monitor("debug heap_sort: array %t\t%x",$time,array); 
end

endmodule


