library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity Practica1 is port (
	a,b,ref : in std_logic_vector (2 downto 0);
	sel : in std_logic;
	display : inout std_logic_vector(6 downto 0)
); 

	attribute pin_numbers of Practica1: entity is
	"a(2):2 a(1):3 a(0):4 b(2):5 b(1):6 b(0):7 "
&	"ref(2):8 ref(1):9 ref(0):10 sel:11 ";
	end Practica1;

architecture APractica1 of Practica1 is
signal auxMux: std_logic_vector(2 downto 0);--salida del mux
signal salcom: std_logic_vector(2 downto 0);--salida del comparador
begin
--Salida del multiplexor	
	auxMux <= a when sel = '0' else b;
	
--	process(a, b, sel,auxMux)
--	begin 
--		if(sel = '0') then
--			auxMux <= a;
--	   	else
--		auxMux <= b;
--	   	end if;
--	end process;

--Comparador
	process(auxMux,ref)
	begin
		if (auxMux < ref) then
		salcom<="000";
		elsif (auxMux > ref) then
		salcom<="001";
		elsif (auxMux = ref) then
		salcom<="010";
		else
		salcom<="011";
		salcom<="100";
		salcom<="101";
		salcom<="110";
		salcom<="111";
		end if;
    end process;

--Decodificador	
		process(salcom)
		begin
		case salcom is
			when "000"=> display <= "0111001"; --4E
			when "001"=> display <= "0001111"; --78
			when "010"=> display <= "0001001"; --48
			when others=> display <= "0000000"; --00
		end case;
	end process;

end APractica1;