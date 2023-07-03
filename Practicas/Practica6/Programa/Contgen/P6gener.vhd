--Santos Mèndez Ulises Jesùs
--2CV8
--Pràctica 6 "Contadores"
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity contador is
port(clk,clr,en,le,ud: in std_logic;
	 D: in std_logic_vector(6 downto 0);
	 c: out std_logic;
	 q: inout std_logic_vector(6 downto 0));

	 attribute pin_numbers of contador: entity is
	 "c:22 q(6):20 q(5):19 q(4):18 q(3):17 q(2):16 "
&    "q(1):15 q(0):14 clr:13 d(6):2 d(5):3 d(4):4 "
&    "d(3):5 d(2):6 d(1):7 d(0):8 en:9 le:10 ud:11 ";
end contador;

architecture arq_count of contador is 
begin 
--En 0//Le x// Ud x// Retenciòn
--En 1//Le 1// Ud x// Carga
--En 1//Le 0// Ud 1// Conteo ascendente
--En 1//Le 0// Ud 0// Conteo descendente

	process(clk,clr)
	begin
		if(clr = '1')then
			q <= (others => '0');
		elsif(rising_edge(clk))then
			if(en = '1')then
				if(le = '1')then
					q <= D;
				elsif(ud = '1' and le = '0')then
					q <= q+1;
				elsif(ud = '0' and le = '0')then
					q <= q-1;
				end if;
			else
				q <= q;
			end if;
	    end if;
  end process;
process(q,c)
begin
	case q is
		when "1111111" =>
			c <= '1';
		when "0000000" =>
			c <= '1';
		when others =>
			c <= '0';
	end case;
end process;
end arq_count;
