-- Ulises Jesùs Santos Mèndez
-- 2CV8
-- Practica 11 "Cartas ASM"
library ieee;
use ieee.std_logic_1164.all;

entity GAL1 is
port(clk,clr,ini: in std_logic;
	 D: in std_logic_vector(5 downto 0);
	 EC,EB,LB: out std_logic;
	 A: inout std_logic_vector(5 downto 0));

	 attribute pin_numbers of GAL1: entity is
	 "clr:13 ini:8 D(0):7 D(1):6 D(2):5 D(3):4 "
&	 "D(4):3 D(5):2 EC:22 EB:21 LB:20 A(5):19 "
&	 "A(4):18 A(3):17 A(2):16 A(1):15 A(0):14 ";

end GAL1;

architecture CARTA of GAL1 is
type estados is (e0,e1,e2);
signal edo_act,edo_sig: estados;
signal LA,EA,z: std_logic;
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
	process(edo_act,ini,z,A)
	begin
-- Señales de salida en 0
		LA <= '0';
		EA <= '0';
		LB <= '0';
		EB <= '0';
		EC <= '0';
--		z <= not(A(5)or A(4)or A(3)or A(2) or A(1) or A(0));
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
				if(z='0' and A(0)='1')then
					EB<='1';
					edo_sig <= e1;
				elsif(z='0' and A(0)='0')then
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
z <= not(A(5)or A(4)or A(3)or A(2) or A(1) or A(0));
	process(clk,clr)
	begin
		if(clr='1')then
			A <= (others => '0');
		elsif(rising_edge(clk))then
			if(EA='0' and LA='1')then
				A <= D;
			elsif(EA='1' and LA='0')then
				A(4 downto 0) <= A(5 downto 1);
				A(5) <= '0';
			else
				A <= A;
			end if;
		end if;
	end process;

end CARTA; 
