--Santos Mèndez Ulises Jesus
--2CV8
--Pràctica 7"Aplicacion"//dados
library ieee;
use ieee.std_logic_1164.all;

entity dados is
port(clk,clr,en: in std_logic;
	 display: out std_logic_vector(6 downto 0));

	 attribute pin_numbers of dados: entity is
	 "clr:13 en:2 display(6):21 display(5):20 "
&    "display(4):19 display(3):18 display(2):17 "
&	 "display(1):16 display(0):15 ";
end dados;

architecture arqdados of dados is
constant s1: std_logic_vector(6 downto 0) := "0110000";
constant s2: std_logic_vector(6 downto 0) := "1101101";
constant s3: std_logic_vector(6 downto 0) := "1111001";
constant s4: std_logic_vector(6 downto 0) := "0110011";
constant s5: std_logic_vector(6 downto 0) := "1011011";
constant s6: std_logic_vector(6 downto 0) := "1011111";
begin

	process(clk,clr)
	begin
		if(clr = '1')then
			display <= s1;
		elsif(rising_edge(clk))then
			if(en = '1')then
				case display is 
					when s1 => display <= s2;
					when s2 => display <= s3;
					when s3 => display <= s4;
					when s4 => display <= s5;
					when s5 => display <= s6;
					when s6 => display <= s1;
					when others => display <= s1;
			    end case;
			else
				display <= display;
			end if;
	  	end if;
	end process;
end arqdados;

