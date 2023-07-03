--Ulises Jesùs Santos Mèndez
--Pràctica 3 Registros
--2CV8
library ieee;
use ieee.std_logic_1164.all;
use work.std_arith.all;

entity registro is
port(es,clk,clr: in std_logic;
	 d: in std_logic_vector(6 downto 0);
	 op: in std_logic_vector(1 downto 0);
	 q: out std_logic_vector(6 downto 0));
	
	attribute pin_numbers of registro: entity is
	"clk:1 es:2 d(6):3 d(5):4 d(4):5 d(3):6 d(2):7 "
&	"d(1):8 d(0):9 op(0):10 op(1):11 clr:13 q(6):20 "
&	"q(5):19 q(4):18 q(3):17 q(2):16 q(1):15 q(0):14 ";

end registro;

architecture arqreg of registro is
	signal auxD,auxQ: std_logic_vector (6 downto 0);
begin
--Ciclo concurrente del multiplexor
-- 00 -> retencion
-- 01 -> carga
-- 10 -> corrimiento izquierda
-- 11 -> corrimiento derecha
	process(op,d,auxQ,es, auxD)
	begin
		case op is
			when "00" =>
				auxD <= auxQ;
			when "01" =>
				auxD <= d;
			when "10" =>
				for i in 0 to 6 loop
					if(i>0) then 
					auxD(i)<=auxQ(i-1);
					else
					auxD(i)<=es;
					end if;
				end loop;
		   when "11" =>
		   		for i in 0 to 6 loop
					if(i<6) then
					auxD(i)<=auxQ(i+1);
					else
					auxD(i)<=es;
				    end if;
			    end loop;
		   when others =>
 		   		auxD<="0000000";
		   end case;
			end process;


--Ciclo secuencial para la serie de flip flops
	process(clk, clr)
	begin
		if(clr = '1')then
			for i in 0 to 6 loop
			auxQ(i)<='0';
		end loop;
		elsif(rising_edge(clk))then
			for i in 0 to 6 loop
			auxQ <= auxD;
			end loop;
		end if;
	end process;
	q<= auxQ;
end arqreg;