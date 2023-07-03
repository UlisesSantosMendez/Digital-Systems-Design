--Santos Mèndez Ulises Jesùs
--2CV8
--Practica 6 "Contadores"
--Contador de 3 bits
library ieee;
use ieee.std_logic_1164.all;

entity counter is
port(clk,clr,en: in std_logic;
	 q: out std_logic_vector(2 downto 0));

	 attribute pin_numbers of counter: entity is
	 "q(2):16 q(1):15 q(0):14 clr:2 en:3 ";
end counter;

architecture arq_count of counter is
begin 
	process(clk,clr)
	variable aux: std_logic;
	begin
		if(clr='1')then
			q <= (others => '0');
		elsif (rising_edge(clk))then
		aux := '1';
			for i in 0 to 2 loop
				if(i-1 >= 0)then
					for j in 0 to i-1 loop
						aux := aux and q(j);
					end loop;
				end if;
				aux := aux and en;
				q(i) <= q(i) xor aux;
			end loop;
	    end if;
   end process;
end arq_count;
