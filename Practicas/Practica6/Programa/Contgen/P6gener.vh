module contador ( 
	clk,
	clr,
	en,
	le,
	ud,
	d,
	c,
	q
	) ;

input  clk;
input  clr;
input  en;
input  le;
input  ud;
input [6:0] d;
inout  c;
inout [6:0] q;
