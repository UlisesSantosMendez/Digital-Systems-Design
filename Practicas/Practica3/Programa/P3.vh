module registro ( 
	es,
	clk,
	clr,
	d,
	op,
	q
	) ;

input  es;
input  clk;
input  clr;
input [6:0] d;
input [1:0] op;
inout [6:0] q;
