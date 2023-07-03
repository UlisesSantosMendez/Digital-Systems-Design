-- Santos Mèndez Ulises `Jesùs
-- Pràctica 12 "Marquesina con ROM"

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity marq1 is
port(clk,clr: in std_logic;
	 dir: in std_logic_vector(2 downto 0);
	 cat: inout std_logic_vector(2 downto 0);
	 display: out std_logic_vector(6 downto 0));

	 attribute pin_numbers of marq1: entity is
	 "dir(2):4  dir(1):5  dir(0):6 clr:13 "
&    "cat(2):22  cat(1):23  cat(0):14 "
&	 "display(6):21  display(5):20  display(4):19  "
&	 "display(3):18  display(2):17  display(1):16  display(0):15  ";   

end marq1;

architecture arq_mar of marq1 is
--///////Declaracion de salidas de memoria/////////
constant d: std_logic_vector(6 downto 0):= "0111101"; --3D
constant i: std_logic_vector(6 downto 0):= "0110000"; --30
constant s: std_logic_vector(6 downto 0):= "1011011"; --5B
constant e: std_logic_vector(6 downto 0):= "1001111"; --4F
constant n: std_logic_vector(6 downto 0):= "1010101"; --55
constant o: std_logic_vector(6 downto 0):= "1111110"; --7E
constant nu: std_logic_vector(6 downto 0):= "0000001";--01
--//////Salidas de ROM0,ROM1 Y ROM2//////////
signal disp0: std_logic_vector(6 downto 0);
signal disp1: std_logic_vector(6 downto 0);
signal disp2: std_logic_vector(6 downto 0);
--//////Declaracion de memorias///////////////
type memoria is array (0 to 7) of std_logic_vector(6 downto 0);
constant ROM0: memoria := (d,i,s,e,n,o,nu,nu);
constant ROM1: memoria := (nu,d,i,s,e,n,o,nu);
constant ROM2: memoria := (nu,nu,d,i,s,e,n,o);
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
			display <= disp0;
		elsif(cat="010")then
			display <= disp1;
		else
			display <= disp2;
		end if;
    end process;
end arq_mar;
