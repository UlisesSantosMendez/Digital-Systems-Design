--Ulises Jesùs Santos Mèndez
--2CV8
--Pràctica 8 "Marquesina"
library ieee;
use ieee.std_logic_1164.all;

entity marq is
port(clk,clr: in std_logic;
	 e: in std_logic_vector(2 downto 0);
	 display: out std_logic_vector(9 downto 0));

	 attribute pin_numbers of marq: entity is
	 "clr:13 display(9):23 display(8):22 display(7):21 "
&    "display(6):14 display(5):19 display(4):18 display(3):17 "
&	 "display(2):16 display(1):15 display(0):20 "
&	 "e(2):3 e(1):4 e(0):5 ";
end marq;

architecture arqmarq of marq is
--NINGUN DISPLAY
constant ND: std_logic_vector(2 downto 0) := "111";
--DISPLAY DERECHO
constant D0: std_logic_vector(2 downto 0) := "110";
--DISPLAY IZQUIERDO
constant D1: std_logic_vector(2 downto 0) := "101";
--DISPLAY CENTRAL
constant D2: std_logic_vector(2 downto 0) := "011";
--NINGUNA LETRA
constant NL: std_logic_vector(6 downto 0) := "0000001";
--H
constant L1: std_logic_vector(6 downto 0) := "0110111";
--O
constant L2: std_logic_vector(6 downto 0) := "1111110";
--L
constant L3: std_logic_vector(6 downto 0) := "0001110";
--A
constant L4: std_logic_vector(6 downto 0) := "1110111";

constant q0:std_logic_vector(9 downto 0):= ND&NL;
constant q1:std_logic_vector(9 downto 0):= D0&L1;
constant q2:std_logic_vector(9 downto 0):= D1&L1;
constant q3:std_logic_vector(9 downto 0):= D0&L2;
constant q4:std_logic_vector(9 downto 0):= D2&L1;
constant q5:std_logic_vector(9 downto 0):= D1&L2;
constant q6:std_logic_vector(9 downto 0):= D0&L3;
constant q7:std_logic_vector(9 downto 0):= D2&L2;
constant q8:std_logic_vector(9 downto 0):= D1&L3;
constant q9:std_logic_vector(9 downto 0):= D0&L4;
constant q10:std_logic_vector(9 downto 0):= D2&L3;
constant q11:std_logic_vector(9 downto 0):= D1&L4;
constant q12:std_logic_vector(9 downto 0):= D2&L4;

signal aux: std_logic_vector(9 downto 0);

begin

	process(clk,clr)
	begin
		if(clr = '1')then
			aux <= q0;
		elsif(rising_edge(clk))then
			case aux is 
				when q0 =>
					if(e="000" or e="001")then
						aux <= q0;
					elsif(e="010")then
						aux <= q1;
					else
						aux <= "----------";
					end if;
				when q1 =>
					if(e="010")then
						aux <= q1;
 				    elsif(e="011")then
						aux <= q2;
					else
						aux <= "----------";
					end if;
				when q2 =>
					if(e="011")then
						aux <= q3;
 				    elsif(e="100")then
						aux <= q4;
					else
						aux <= "----------";
					end if;
			    when q3 =>
                    if(e="011")then
						aux <= q2;
					elsif(e="100")then
						aux <= q4;
					else
						aux <= "----------";
					end if;
				when q4 =>
					if(e="100")then
						aux <= q5;
					elsif(e="101")then
						aux <= q7;
					else
						aux <= "----------";
			   		end if;
				when q5 =>
					if(e="100")then
						aux <= q6;
					elsif(e="101")then
						aux <= q7;
					else
						aux <= "----------";
			   		end if;
			    when q6 =>
					if(e="100")then
						aux <= q4;
					elsif(e="101")then
						aux <= q7;
					else
						aux <= "----------";
			   		end if;
			    when q7 =>
					if(e="101")then
						aux <= q8;
					elsif(e="110")then
						aux <= q10;
					else
						aux <= "----------";
			   		end if;
				when q8 =>
					if(e="101")then
						aux <= q9;
					elsif(e="110")then
						aux <= q10;
					else
						aux <= "----------";
			   		end if;
				when q9 =>
					if(e="101")then
						aux <= q7;
					elsif(e="110")then
						aux <= q10;
					else
						aux <= "----------";
			   		end if;
				when q10 =>
					if(e="110")then
						aux <= q11;
					elsif(e="111")then
						aux <= q12;
					else
						aux <= "----------";
			   		end if;
				when q11 =>
					if(e="111")then
						aux <= q12;
					elsif(e="110")then
						aux <= q10;
					else
						aux <= "----------";
			   		end if;
				when q12 =>
					if(e="111")then
						aux <= q12;
					elsif(e="000")then
						aux <= q0;
					else
						aux <= "----------";
			   		end if;
				when others =>
					aux <= "----------";
			end case;
		end if;
end process;
display <= aux;
end arqmarq;
