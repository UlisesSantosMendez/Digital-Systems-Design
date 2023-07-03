--Santos Mèndez Ulises Jesus
--2CV8
--Pràctica 7"Aplicacion"//contador hexadecimal
library ieee;
use ieee.std_logic_1164.all;

entity chexad is
port(clk,clr,en: in std_logic;
	 display: out std_logic_vector(6 downto 0));

	 attribute pin_numbers of chexad: entity is
	 "clr:13 en:2 display(6):21 display(5):20 "
&    "display(4):19 display(3):18 display(2):17 "
&	 "display(1):16 display(0):15 ";
end chexad;

architecture arqchex of chexad is
constant s0: std_logic_vector(6 downto 0) := "1111110";
constant s1: std_logic_vector(6 downto 0) := "0110000";
constant s2: std_logic_vector(6 downto 0) := "1101101";
constant s3: std_logic_vector(6 downto 0) := "1111001";
constant s4: std_logic_vector(6 downto 0) := "0110011";
constant s5: std_logic_vector(6 downto 0) := "1011011";
constant s6: std_logic_vector(6 downto 0) := "1011111";
constant s7: std_logic_vector(6 downto 0) := "1110001";
constant s8: std_logic_vector(6 downto 0) := "1111111";
constant s9: std_logic_vector(6 downto 0) := "1110011";
constant sA: std_logic_vector(6 downto 0) := "1110111";
constant sB: std_logic_vector(6 downto 0) := "0011111";
constant sC: std_logic_vector(6 downto 0) := "1001110";
constant sD: std_logic_vector(6 downto 0) := "0111101";
constant sE: std_logic_vector(6 downto 0) := "1001111";
constant sF: std_logic_vector(6 downto 0) := "1000111";
begin	process(clk,clr)
	begin
		if(clr = '1')then
			display <= s0;
		elsif(rising_edge(clk))then
			if(en = '1')then
				case display is
					when s0 => display <= s1;
					when s1 => display <= s2;
					when s2 => display <= s3;
					when s3 => display <= s4;
					when s4 => display <= s5;
					when s5 => display <= s6;
					when s6 => display <= s7;
					when s7 => display <= s8;
					when s8 => display <= s9;
					when s9 => display <= sA;
					when sA => display <= sB;
					when sB => display <= sC;
					when sC => display <= sD;
					when sD => display <= sE;
					when sE => display <= sF;
					when sF => display <= s0;
					when others => display <= s0;
			    end case;
			else
				display <= display;
			end if;
	  	end if;
	end process;
end arqchex;

