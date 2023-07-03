module saldisp ( 
	clk,
	clr,
	uni,
	dec,
	cat,
	display
	) ;

input  clk;
input  clr;
input [3:0] uni;
input [2:0] dec;
inout [2:0] cat;
inout [6:0] display;
