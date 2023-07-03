-- Santos Mèndez Ulises Jesùs
-- Pràctica 12 "Marquesina con ROM"

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity contador is
port(clk,en: in std_logic;
	 clr: inout std_logic;
	 q: inout std_logic_vector(9 downto 0));

	 attribute pin_numbers of contador: entity is
	 "clr:13 en:2 q(9):21 q(8):20 q(7):19 q(6):18 "
&	 "q(5):17 q(4):16 q(3):15 q(2):14 q(1):23 q(0):22 ";
end contador;

architecture arq_conta of contador is
begin
	process(clk,clr)
	begin
		if(clr = '1')then
			q <= (others => '0');
		elsif(rising_edge(clk))then
			if(en = '1')then
				q<= q+1;
			else
				q <= q;
			end if;
		end if;
	end process;
end arq_conta;
