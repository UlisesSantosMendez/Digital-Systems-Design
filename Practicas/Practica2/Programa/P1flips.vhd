--Santos Mèndez Ulises Jesùs
--2CV8
--Practica 2 "FLIP FLOPS"
library ieee;
use ieee.std_logic_1164.all;

entity pract is 
port (j,k,clk,clr,t,d,s,r: in std_logic;
		qsr,qd,qt,qjk: inout std_logic;
		sel: in std_logic_vector(1 downto 0);
	  display: out std_logic_vector (5 downto 0));
		
	attribute pin_numbers of pract: entity is
	"j:2 k:3 t:4 s:5 r:6 d:7 sel(0):8 sel(1):9 clr:13 "
&	"display(5):21 display(4):20 display(3):19 "
&	"display(2):18 display(1):17 display(0):16 ";
end pract;

architecture Apract of pract is 
	signal Q: std_logic;

begin
--Flip Flop JK
	process(clk,clr,qjk)
	begin
		if(clr= '1') then
		qjk<='0';
		elsif(rising_edge(clk)) then
	qjk<=(j and (not qjk)) or ((not k)and qjk);
		end if;
	end process;
--Flip Flop T
	process(clk,clr,qt)
	begin
		if(clr='1') then
		qt<='0';
		elsif(rising_edge(clk)) then
		qt<= t xor qt;
		end if;
	end process;

--Flip Flop D
	process(clk,clr,qd)
	begin
		if(clr='1') then
		qd<='0';
		elsif(rising_edge(clk)) then
		qd<=d;
		end if;
	end process;
--Flip Flop SR
	process(clk,clr,qsr)
	begin
		if(clr='1') then
		qsr<='0';
		elsif(rising_edge(clk)) then
		qsr<= s or ((not r) and qsr);
		end if;
		end process;
--Multiplexor
	process(qjk,sel,qt,qd,qsr,q)
	begin
		if(sel="00")then
			Q<= qjk;
		elsif (sel="01")then
			Q<= qt;
		elsif (sel="10")then
		 	Q<= qd;
		else
			Q<= qsr;
		end if;
	end process;
--Decodificador
	process(Q)
	begin
	case Q is
		when '0'=> display <= "111111";
		when others=> display <="011000";
	end case;
	end process;
end Apract;
