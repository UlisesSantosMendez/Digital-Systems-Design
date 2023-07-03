--Santos Mèndez Ulises Jesus
--2CV8
--Pràctica 7"Aplicacion"//mensaje
library ieee;
use ieee.std_logic_1164.all;

entity mensaje is
port(clk,clr,en: in std_logic;
	 display: out std_logic_vector(6 downto 0));

	 attribute pin_numbers of mensaje: entity is
	 "clr:13 en:2 display(6):21 display(5):20 "
&    "display(4):19 display(3):18 display(2):17 "
&	 "display(1):16 display(0):15 ";
end mensaje;

architecture arqmensaje of mensaje is
constant l0: std_logic_vector(1 downto 0) := "00";
constant l1: std_logic_vector(1 downto 0) := "01";
constant l2: std_logic_vector(1 downto 0) := "10";
constant l3: std_logic_vector(1 downto 0) := "11";

constant sU: std_logic_vector(6 downto 0) := "0111110";
constant sL: std_logic_vector(6 downto 0) := "0001110";
constant sI: std_logic_vector(6 downto 0) := "0110000";
constant sS: std_logic_vector(6 downto 0) := "1011011";
constant sE: std_logic_vector(6 downto 0) := "1001111";
constant sA: std_logic_vector(6 downto 0) := "1110111";
constant sN: std_logic_vector(6 downto 0) := "0010101";
constant sT: std_logic_vector(6 downto 0) := "0001111";
constant sO: std_logic_vector(6 downto 0) := "1111110";

signal estado: std_logic_vector(8 downto 0);
begin

	process(clk,clr)
	begin
		if(clr = '1')then
			estado <= l0&sU;
		elsif(rising_edge(clk))then
			if(en = '1')then
				case estado is 
					when l0&sU => estado <= l0&sL;
					when l0&sL => estado <= l0&sI;
					when l0&sI => estado <= l0&sS;
					when l0&sS => estado <= l0&sE;
					when l0&sE => estado <= l1&sS;
					when l1&sS => estado <= l2&sS;
					when l2&sS => estado <= l0&sA;
					when l0&sA => estado <= l0&sN;
					when l0&sN => estado <= l0&sT;
					when l0&sT => estado <= l0&sO;
					when l0&sO => estado <= l3&sS;
					when l3&sS => estado <= l0&sU;
					when others => estado <= "---------";
			    end case;
			else
				estado <= estado;
			end if;
	  	end if;
	end process;
	display <= estado(6 downto 0);
end arqmensaje;
