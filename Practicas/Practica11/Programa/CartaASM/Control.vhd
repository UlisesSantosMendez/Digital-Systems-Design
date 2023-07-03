-- Ulises Jesùs Santos Mèndez
-- 2CV8
-- Practica 11 "Cartas ASM"
library ieee;
use ieee.std_logic_1164.all;

entity GAL1 is
port(clk,clr,ini,z,a0: in std_logic;
	 EC,EB,LB,LA,EA: out std_logic);
end GAL1;

architecture CARTA of GAL1 is
type estados is (e0,e1,e2);
signal edo_act,edo_sig: estados;
begin
-- Proceso de reseteo y de estado siguiente
	process(clk,clr)
	begin
		if(clr='1')then
			edo_act <= e0;
		elsif(rising_edge(clk))then
			edo_act <= edo_sig;
		end if;
	end process;
-- Parametrizacion de los estados
	process(edo_act,ini,z,a0)
	begin
-- Señales de salida en 0
		LA <= '0';
		EA <= '0';
		LB <= '0';
		EB <= '0';
		EC <= '0';
		case edo_act is
			when e0 =>
				LB <= '1';
				if(ini='1')then
					edo_sig <= e1;
				else
					LA <='1';
					edo_sig <= e0;
				end if;
			when e1 =>
				EA <= '1';
				if(z='0' and a0='1')then
					EB<='1';
					edo_sig <= e1;
				elsif(z='0' and a0='0')then
					edo_sig <= e1;
				else
					edo_sig <= e2;
				end if;
			when others =>
				EC <= '1';
				if(ini='1')then
					edo_sig <= e2;
				else
					edo_sig <= e0;			
				end if;
		end case;
	end process;
end CARTA;
