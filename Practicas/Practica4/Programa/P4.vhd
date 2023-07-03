library ieee;
use ieee.std_logic_1164.all;

entity mealy is
port(clk,clr: in std_logic;
	 e: inout std_logic;
	 dis: out std_logic_vector(6 downto 0));
	
	 attribute pin_numbers of mealy: entity is
	 "e:3 dis(6):21 dis(5):20 dis(4):19 dis(3):18 "
&	 "dis(2):17 dis(1):16 dis(0):15 ";

end mealy;

architecture macmealy of mealy is
signal q0,q1,d0,d1,s: std_logic;
begin 
	process(clk,clr)
	begin
		if (clr = '1') then
		q0<= '0';
		q1<= '0';
		elsif (rising_edge(clk)) then
		q0 <= d0;
		q1 <= d1;
		end if;
	end process;
-- Estructura de la maquina de mealy 
	d1 <= (q1 and (not q0))or (((not q1)and q0)and e);
	d0 <= ((q1 and (not q0))and (not e))or(((not q1)
			and (not q0))and e);
	s <= ((q1 and q0)and e);
-- Convertidor de codigo 
	process(s,dis)
	begin 
	case s is
	when '0' => dis <= "1110111";
	when '1' => dis <= "1001111";
	when others => dis <= "0000000";
	end case;
	end process;
end macmealy;
