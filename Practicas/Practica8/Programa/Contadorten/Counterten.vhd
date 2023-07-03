--Santos Mèndez Ulises Jesùs
--2CV8
--Pràctica 8 "Contador de 10 bits"
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity contador is
port(clk,clr,en: in std_logic;
	 q: inout std_logic_vector(9 downto 0));

	 attribute pin_numbers of contador: entity is
     "q(2):22 q(1):21 q(0):20 clr:13 en:2 ";
end contador;

architecture arq_count of contador is 
begin 

	process(clk,clr)
	begin
		if(clr = '1')then
			q <= (others => '0');
		elsif(rising_edge(clk))then
			if(en = '1')then
				q<= q+1;
			end if;
		end if;
	end process;
end arq_count;
