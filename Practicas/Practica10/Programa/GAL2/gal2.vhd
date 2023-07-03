--Ulises Jesùs Santos Mèndez
--Pràctica 10 "Sensores"
library ieee;
use ieee.std_logic_1164.all;

entity saldisp is
port(clk,clr: in std_logic;
     uni: in std_logic_vector(3 downto 0);
	 dec: in std_logic_vector(2 downto 0);
	 cat: inout std_logic_vector(2 downto 0);
	 display: out std_logic_vector(6 downto 0));
	
	 attribute pin_numbers of saldisp: entity is
	 "clr:13 uni(3):8 uni(2):9 uni(1):10 uni(0):11 "
&    "dec(2):5 dec(1):6 dec(0):7 cat(2):22 cat(1):23 "
&    "cat(0):14 display(6):21 display(1):20 display(4):19 "
&    "display(3):18 display(2):17 display(5):16 "
&    "display(0):15 ";
end saldisp;

architecture arqsal of saldisp is
signal su: std_logic_vector(3 downto 0):= "0000";
constant sd: std_logic_vector(3 downto 0):= '0'&dec;
signal bcd: std_logic_vector(3 downto 0);
begin
--Contador de anillo
	process(clk,clr)
	begin
		if(clr='1')then
			cat <= "011";
		elsif(rising_edge(clk))then
			cat <= to_stdlogicvector(to_bitvector(cat)
			ror 1);
		end if;
	end process;

--Multiplexor
	process(bcd,uni,dec,cat,sd,cat,su)
	begin
			if(cat="011")then
				bcd <= su;
			elsif(cat="101")then
				bcd <= sd;
			elsif(cat="110")then
				bcd <= uni;
			else
				bcd <= "----";
			end if;
    end process;

--Decodificador
	process(bcd)
	begin
		case bcd is
			when "0000" => display <= "1111110";--0//7E
			when "0001" => display <= "0110000";--1//30
			when "0010" => display <= "1101101";--2//6D
			when "0011" => display <= "1111001";--3//79
			when "0100" => display <= "0110011";--4//33
			when "0101" => display <= "1011011";--5//5B
			when "0110" => display <= "1011111";--6//5F
			when "0111" => display <= "1110001";--7//71
			when "1000" => display <= "1111111";--8//7F
			when "1001" => display <= "1110011";--9//73
			when others => display <= "-------";
		end case;
    end process;
end arqsal;
