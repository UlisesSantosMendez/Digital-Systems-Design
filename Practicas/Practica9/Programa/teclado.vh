module teclado ( 
	clk,
	clr,
	fil,
	col,
	display
	) ;

input  clk;
input  clr;
input [3:0] fil;
inout [2:0] col;
inout [6:0] display;
