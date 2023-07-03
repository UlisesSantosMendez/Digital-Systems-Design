module pract ( 
	j,
	k,
	clk,
	clr,
	t,
	d,
	s,
	r,
	qsr,
	qd,
	qt,
	qjk,
	sel,
	display
	) ;

input  j;
input  k;
input  clk;
input  clr;
input  t;
input  d;
input  s;
input  r;
inout  qsr;
inout  qd;
inout  qt;
inout  qjk;
input [1:0] sel;
inout [5:0] display;
