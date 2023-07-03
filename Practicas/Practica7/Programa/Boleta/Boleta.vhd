--Santos Mèndez Ulises Jesus
--2CV8
--Pràctica 7"Aplicacion"//No.Boleta
library ieee;
use ieee.std_logic_1164.all;

entity boleta is
port(clk,clr,en: in std_logic;
	 display: out std_logic_vector(6 downto 0));

	 attribute pin_numbers of boleta: entity is
	 "clr:13 en:2 display(6):21 display(5):20 "
&    "display(4):19 display(3):18 display(2):17 "
&	 "display(1):16 display(0):15 ";
end boleta;

architecture arqboleta of boleta is
constant l0: std_logic_vector(1 downto 0) := "00";
constant l1: std_logic_vector(1 downto 0) := "01";
constant l2: std_logic_vector(1 downto 0) := "10";
constant l3: std_logic_vector(1 downto 0) := "11";

constant s2: std_logic_vector(6 downto 0) := "1101101";
constant s0: std_logic_vector(6 downto 0) := "1111110";
constant s6: std_logic_vector(6 downto 0) := "1011111";
constant s3: std_logic_vector(6 downto 0) := "1111001";
constant s4: std_logic_vector(6 downto 0) := "0110011";

signal estado: std_logic_vector(8 downto 0);
begin

	process(clk,clr)
	begin
		if(clr = '1')then
			estado <= l0&s2;
		elsif(rising_edge(clk))then
			if(en = '1')then
				case estado is 
					when l0&s2 => estado <= l0&s0;
					when l0&s0 => estado <= l1&s2;
					when l1&s2 => estado <= l1&s0;
					when l1&s0 => estado <= l0&s6;
					when l0&s6 => estado <= l0&s3;
					when l0&s3 => estado <= l2&s0;
					when l2&s0 => estado <= l0&s4;
					when l0&s4 => estado <= l1&s6;
					when l1&s6 => estado <= l3&s0;
					when l3&s0 => estado <= l0&s2;
					when others => estado <= "---------";
			    end case;
			else
				estado <= estado;
			end if;
	  	end if;
	end process;
	display <= estado(6 downto 0);
end arqboleta;
