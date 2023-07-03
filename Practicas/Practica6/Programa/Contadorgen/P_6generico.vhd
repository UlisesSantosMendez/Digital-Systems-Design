--Santos Mèndez Ulises Jesùs
--2CV8
--Pràctica 6 "Contadores"
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity contador is
port(clk,clr,en,le,ud: in std_logic;
	 d: in std_logic_vector(6 downto 0);
--	 c: out std_logic;
	 q: inout std_logic_vector(6 downto 0));

	 attribute pin_numbers of contador: entity is
	 " q(6):20 q(5):19 q(4):18 q(3):17 q(2):16 "
&    " q(1):15 q(0):14 clr:13 d(6):2 d(5):3 d(4):4 "
&    " d(3):5 d(2):6 d(1):7 d(0):8 en:9 le:10 ud:11 ";
end contador;

architecture arq_count of contador is
constant n:integer := 7; 
begin 
--En 0//Le x// Ud x// Retenciòn
--En 1//Le 1// Ud x// Carga
--En 1//Le 0// Ud 1// Conteo ascendente
--En 1//Le 0// Ud 0// Conteo descendente

	process(clk,clr)
	begin
		if(clr = '1')then
			q <= "0000000";
		elsif (rising_edge(clk))then
			case en is
				when '0' =>
					q <= q;
				when '1' =>
					if(le = '1' and ud = '-')then
						q <= d;
					elsif(le = '0' and ud = '1')then
						q <= q+1;
					elsif(le = '0' and ud = '0')then
						q <= q-1;
					end if;
				when others =>
					q <= "-------";
			end case;
	   end if;
--			if(en = '1')then
--				if(le = '1'and ud = '-')then
 --			    	for i in 0 to 6 loop
--					q(i) <= d(i);
--					end loop;
--				elsif(ud = '1' and le = '0')then
--					q <= q+1;
--				elsif(ud = '0' and le = '0')then
--					q <= q-1;
--				end if;
--			elsif(en = '0')then
--				q <= q;
--			end if;
--	    end if;
end process;

--c <= '1' when q = 2**n - 1 else '0'; 
end arq_count;
