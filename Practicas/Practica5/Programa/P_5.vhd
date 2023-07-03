--Santos Mèndez Ulises Jesùs
--2CV8
--Practica 5 "Mensaje Multiplexado"
library ieee;
use ieee.std_logic_1164.all; 

entity mensaje is
port(clr,clk: in std_logic;
	 display: out std_logic_vector(6 downto 0);
	 cat: inout std_logic_vector(2 downto 0));

	 attribute pin_numbers of mensaje: entity is
	 "display(6):23 display(5):22 display(4):21 "
&	 "display(3):20 display(2):19 display(1):18 "
&	 "display(0):17 cat(2):16 cat(1):15 cat(0):14 ";
end mensaje;

architecture dismux of mensaje is
constant d0: std_logic_vector(6 downto 0) := "0111110";---U
constant d1: std_logic_vector(6 downto 0) := "1011011";---S
constant d2: std_logic_vector(6 downto 0) := "0110011";---4
begin
	deco: process(cat)
	begin
		case cat is
			when "110" => display <= d0;
			when "101" => display <= d1;
			when "011" => display <= d2;
			when others => display <= "-------";
	    end case;
   end process deco;

	tiempo: process(clk,clr)
	begin
		if(clr='1')then
			cat <= "110";
 	    elsif(rising_edge(clk))then
			cat <= to_stdlogicvector(to_bitvector(cat)
			rol 1);
		end if;
	end process tiempo;
end dismux;
