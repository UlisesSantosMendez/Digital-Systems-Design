-- Ulises Jesùs Santos Mèndez
-- 2CV8
-- Practica 11 "Cartas ASM"

library ieee;
use ieee.std_logic_1164.all;

entity GAL2 is
port(clk,clr,LB,EB,EC: in std_logic;
	 disp: out std_logic_vector(6 downto 0));

	 attribute pin_numbers of GAL2: entity is
	 "clr:13 LB:5 EB:4 EC:3 disp(6):21 disp(5):20 "
&	 "disp(4):19 disp(3):18 disp(2):17 disp(1):16 "
&	 "disp(0):15 ";

end GAL2;

architecture arq_cont of GAL2 is
-- Señal de salida del contador
signal qb: std_logic_vector(2 downto 0);
-- Representacion de 0-6
constant e0: std_logic_vector(2 downto 0):="000";
constant e1: std_logic_vector(2 downto 0):="001";
constant e2: std_logic_vector(2 downto 0):="010";
constant e3: std_logic_vector(2 downto 0):="011";
constant e4: std_logic_vector(2 downto 0):="100";
constant e5: std_logic_vector(2 downto 0):="101";
constant e6: std_logic_vector(2 downto 0):="110";

begin
-- ////////////CONTADOR/////////////////
	process(clk,clr)
	begin
		if(clr='1')then
			qb <= e0;
		elsif(rising_edge(clk))then
			if(LB='1'and EB='0')then
				qb <= e0;
			elsif(LB='0' and EB='1')then
				case qb is
					when e0 => qb <= e1;
					when e1 => qb <= e2;
					when e2 => qb <= e3;
					when e3 => qb <= e4;
					when e4 => qb <= e5;
					when others => qb <= e6;
				end case;
			elsif (LB='0' and EB='0')then
				qb <= qb;
			else
				qb <= "---";
			end if;
		 end if;
	end process;

--///////////DECODIFICADOR Y MUX///////////////
	process(clk,EC,qb)
	begin
		if(EC='0')then
			disp <= "0000001";
		else
			case qb is
				when e0 => disp <= "1111110";
				when e1 => disp <= "0110000";
				when e2 => disp <= "1101101";
				when e3 => disp <= "1111001";
				when e4 => disp <= "0110011";
				when e5 => disp <= "1011011";
				when others => disp <= "1011111";
			end case;
	    end if;
	end process;
end arq_cont;
