-- Santos Mèndez Ulises `Jesùs
-- Pràctica 12 "Marquesina con ROM"

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity marq2 is
port(clk,clr: in std_logic;
	 dir: in std_logic_vector(3 downto 0);
	 cat: inout std_logic_vector(2 downto 0);
	 display: out std_logic_vector(6 downto 0));
end marq2;

architecture arq_mar2 of marq2 is
--///////Declaracion de salidas de memoria como etiquetas/////////
constant cod_nu: std_logic_vector(3 downto 0):= "0000";
constant cod_d: std_logic_vector(3 downto 0):= "0001";
constant cod_i: std_logic_vector(3 downto 0):= "0011";
constant cod_s: std_logic_vector(3 downto 0):= "0010";
constant cod_e: std_logic_vector(3 downto 0):= "0110";
constant cod_n: std_logic_vector(3 downto 0):= "0111";
constant cod_o: std_logic_vector(3 downto 0):= "0101";
constant cod_g: std_logic_vector(3 downto 0):= "0100";
constant cod_t: std_logic_vector(3 downto 0):= "1100";
constant cod_a: std_logic_vector(3 downto 0):= "1101";
constant cod_l: std_logic_vector(3 downto 0):= "1111";
constant cod_x: std_logic_vector(3 downto 0):= "1110";

--//////Salidas de ROM0,ROM1 Y ROM2//////////
signal disp0: std_logic_vector(3 downto 0);
signal disp1: std_logic_vector(3 downto 0);
signal disp2: std_logic_vector(3 downto 0);
signal smem: std_logic_vector(3 downto 0);
--//////Declaracion de memorias///////////////
type memoria is array (0 to 15) of std_logic_vector(3 downto 0);
constant ROM0: memoria := (cod_d,cod_i,cod_s,cod_e,cod_n,cod_o,
						cod_nu,cod_d,cod_i,cod_g,cod_i,cod_t,
						cod_a,cod_l,cod_nu,cod_nu);

constant ROM1: memoria := (cod_nu,cod_d,cod_i,cod_s,cod_e,cod_n,cod_o,
						cod_nu,cod_d,cod_i,cod_g,cod_i,cod_t,
						cod_a,cod_l,cod_nu);

constant ROM2: memoria := (cod_nu,cod_nu,cod_d,cod_i,cod_s,cod_e,cod_n,cod_o,
						cod_nu,cod_d,cod_i,cod_g,cod_i,cod_t,
						cod_a,cod_l);
begin

-- ////////CONTADOR DE ANILLO//////
	process(clk,clr)
	begin
		if(clr='1')then
			cat <= "001";
		elsif(rising_edge(clk))then
			case cat is
				when "001" => cat <= "010";
				when "010" => cat <= "100";
				when "100" => cat <= "001";
				when others => cat <= "---";
		   end case;
		end if;
    end process;

--///////OPERACIONES DE LECTURA DE LA ROM/////////
	process(dir)
	begin
		disp0 <= ROM0(conv_integer(dir));
		disp1 <= ROM1(conv_integer(dir));
		disp2 <= ROM2(conv_integer(dir));
	end process;

--///////////MUX->DISPLAY///////////////
	process(cat,disp0,disp1,disp2)
	begin
		if(cat="001")then
			smem <= disp0;
		elsif(cat="010")then
			smem <= disp1;
		elsif(cat="100")then
			smem <= disp2;
		else
			smem <= cod_x;
		end if;
    end process;

-- //////////////Convertidor de còdigo//////////////
	process(smem)
	begin
		case smem is
			when "0000" => display <= "0000001";
			when "0001" => display <= "0111101";
			when "0011" => display <= "0110000";
			when "0010" => display <= "1011011";
			when "0110" => display <= "1001111";
			when "0111" => display <= "1010101";
			when "0101" => display <= "1111110";
			when "0100" => display <= "1111011";
			when "1100" => display <= "0001111";
			when "1101" => display <= "1110111";
			when "1111" => display <= "0001110";
			when others => display <= "-------";
		end case;
	end process;
end arq_mar2;
