--Ulises Jesùs Santos Mèndez
--Pràctica 10 "Sensores"
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity contador is
port(clk,clr: in std_logic;
	 sen: in std_logic_vector(1 downto 0);
	 uni: out std_logic_vector(3 downto 0);
	 dec: out std_logic_vector(2 downto 0));

	 attribute pin_numbers of contador: entity is
	 "clr:13 sen(1):2 sen(0):3 dec(2):20 dec(1):19 "
&    "dec(0):18 uni(3):17 uni(2):16 uni(1):15 "
&    "uni(0):14 ";
end contador;

architecture arqgal of contador is
--Estados de la màquina de Mealy
type estados is (q0,q1,q2,q3,q4,q5,q6,q7);
signal act,sig: estados;
signal sal: std_logic_vector(1 downto 0);
begin

--Proceso cambio de estado para estado actual
	process(clk,clr)
	begin
		if(clr='1')then
			act <= q0;
		elsif(rising_edge(clk))then
			act <= sig;
		end if;
	end process;

--Proceso para determinar el estado siguiente
	process(sen,act)
	begin
		case act is
			when q0 =>
				if(sen = "00")then 
					sal <= "00";
 			    	sig <= q0;
				elsif(sen = "01")then
 			    	sal <= "00";
					sig <= q4;
			    elsif(sen = "10")then
					sal <= "00";
					sig <= q1;
				else
					sal <= "00";
					sig <= q7;
				end if;
		    when q1 =>
 		    	if(sen = "00")then
					sal <= "00";
					sig <= q0;
				elsif(sen = "01")then
 			    	sal <= "00";
					sig <= q4;
			    elsif(sen = "10")then
					sal <= "00";
					sig <= q1;
				else
					sal <= "00";
					sig <= q2;
				end if;
		    when q2 =>
				if(sen = "00")then
					sal <= "00";
					sig <= q0;
				elsif(sen = "01")then
 			    	sal <= "00";
					sig <= q3;
			    elsif(sen = "10")then
					sal <= "00";
					sig <= q1;
				else
					sal <= "00";
					sig <= q2;
				end if;
			when q3 =>
 				if(sen = "00")then
					sal <= "01";
					sig <= q0;
				elsif(sen = "01")then
 			    	sal <= "00";
					sig <= q3;
			    elsif(sen = "10")then
					sal <= "01";
					sig <= q1;
				else
					sal <= "00";
					sig <= q2;
				end if;
			when q4 =>
				if(sen = "00")then
					sal <= "00";
					sig <= q0;
				elsif(sen = "01")then
 			    	sal <= "00";
					sig <= q4;
			    elsif(sen = "10")then
					sal <= "00";
					sig <= q1;
				else
					sal <= "00";
					sig <= q5;
				end if;
			when q5 =>
				if(sen = "00")then
					sal <= "00";
					sig <= q0;
				elsif(sen = "01")then
 			    	sal <= "00";
					sig <= q4;
			    elsif(sen = "10")then
					sal <= "00";
					sig <= q6;
				else
					sal <= "00";
					sig <= q5;
				end if;
		    when q6 =>
				if(sen = "00")then
					sal <= "10";
					sig <= q0;
				elsif(sen = "01")then
 			    	sal <= "10";
					sig <= q4;
			    elsif(sen = "10")then
					sal <= "00";
					sig <= q6;
				else
					sal <= "00";
					sig <= q5;
				end if;
		    when q7 =>
				if(sen = "00")then
					sal <= "00";
					sig <= q0;
				elsif(sen = "01")then
 			    	sal <= "00";
					sig <= q4;
			    elsif(sen = "10")then
					sal <= "00";
					sig <= q1;
				else
					sal <= "00";
					sig <= q7;
				end if;
		end case;
	end process;
--Proceso contador de decada
	process(clk,clr)
	begin
		if(clr='1')then
			uni <= (others => '0');
			dec <= (others => '0');
		elsif(rising_edge(clk))then
			if(sen="00")then
				uni <= uni;
				dec <= dec;
			elsif(sen="01")then
		    		if(uni="1001")then
						uni <= "0000";
						dec <= dec+1;
					else
						uni <= uni+1;	
 			    	end if;
			elsif(sen="10")then
					if(uni="0000")then
						uni <= "1001";
						dec <= dec-1;
					else
						uni <= uni-1;
					end if;
			end if;
	    end if;
	end process;
end arqgal;
