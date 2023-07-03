module marq1 ( 
	clk,
	clr,
	dir,
	cat,
	display
	) ;

input  clk;
input  clr;
input [2:0] dir;
inout [2:0] cat;
inout [6:0] display;
