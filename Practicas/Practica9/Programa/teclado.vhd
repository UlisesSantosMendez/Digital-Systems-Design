--Santos Mèndez Ulises Jesus
--2CV8
--Pràctica 9 "Teclado"
library ieee;
use ieee.std_logic_1164.all;

entity teclado is
port(clk,clr: in std_logic;
	 fil: in std_logic_vector(3 downto 0);
	 col: inout std_logic_vector(2 downto 0);
	 display: out std_logic_vector(6 downto 0));

	 attribute pin_numbers of teclado: entity is
	 "clr:13 display(6):21 display(5):20 "
&    "display(4):19 display(3):18 display(2):17 "
&	 "display(1):16 display(0):15 fil(3):8 "
&	 "fil(2):9 fil(1):10 fil(0):11 "
&	 "col(2):23 col(1):22 col(0):14 ";
end teclado;

architecture arqteclado of teclado is
signal tecla: std_logic_vector(6 downto 0);
signal l: std_logic;
begin
--CONTADOR DE ANILLO
	process(clk,clr)
	begin
		if(clr='1')then
			col <= "100";
		elsif(rising_edge(clk))then
			col <= to_stdlogicvector(to_bitvector(col)
			ror 1);
		end if;
    end process;
--CONVERTIDOR DE CODIGO
	process(col,fil,tecla)
	begin
		case col&fil is
			when "0100001" => tecla <= "1111110";--0
			when "1001000" => tecla <= "0110000";--1
			when "0101000" => tecla <= "1101101";--2
			when "0011000" => tecla <= "1111001";--3
			when "1000100" => tecla <= "0110011";--4
			when "0100100" => tecla <= "1011011";--5
			when "0010100" => tecla <= "1011111";--6
			when "1000010" => tecla <= "1110001";--7
			when "0100010" => tecla <= "1111111";--8
			when "0010010" => tecla <= "1110011";--9
			when "1000001" => tecla <= "1110111";--A
			when "0010001" => tecla <= "1111011";--g
			when others => tecla <= "-------";
		end case;
	end process;
--COMPUERTA
	process(fil)
	begin
		case fil is
			when "0000" =>
				l <= '0';
			when others =>
				l <= '1';
	    end case;
    end process;
--REGISTRO
	process(clk,clr)
	begin
		if(clr = '1')then
			display <= (others => '0');
		elsif(rising_edge(clk))then
			if(l = '1')then
				display <= tecla;
			else
				display <= display;
			end if;
		end if;
	end process;
end arqteclado;
