
--  CYPRESS NOVA XVL Structural Architecture

--  JED2VHD Reverse Assembler - 6.3 IR 35


--    VHDL File: P1.vhd

--    Date: Thu Oct 08 11:52:06 2020

--  Disassembly from Jedec file for: c22v10

--  Device Ordercode is: PALC22V10D-25PC
library ieee;
use ieee.std_logic_1164.all;

library primitive;
use primitive.primitive.all;


-- Beginning Test Bench Header

ENTITY practica1 IS
    PORT (
	                   a :    in std_logic_vector (2 downto 0) ;
	                   b :    in std_logic_vector (2 downto 0) ;
	                 ref :    in std_logic_vector (2 downto 0) ;
	                 sel :    in std_logic ;
	             display : inout std_logic_vector (6 downto 0)
    );
END practica1;

-- End of Test Bench Header

ARCHITECTURE DSMB of practica1 is

	signal jed_node1	: std_logic:='0' ;
	signal jed_node2	: std_logic:='0' ; -- a(2)
	signal jed_node3	: std_logic:='0' ; -- a(1)
	signal jed_node4	: std_logic:='0' ; -- a(0)
	signal jed_node5	: std_logic:='0' ; -- b(2)
	signal jed_node6	: std_logic:='0' ; -- b(1)
	signal jed_node7	: std_logic:='0' ; -- b(0)
	signal jed_node8	: std_logic:='0' ; -- ref(2)
	signal jed_node9	: std_logic:='0' ; -- ref(1)
	signal jed_node10	: std_logic:='0' ; -- ref(0)
	signal jed_node11	: std_logic:='0' ; -- sel
	signal jed_node12	: std_logic:='0' ;
	signal jed_node13	: std_logic:='0' ;
	signal jed_node18	: std_logic:='0' ;
	signal jed_node19	: std_logic:='0' ;
	signal jed_node21	: std_logic:='0' ;
	signal jed_node24	: std_logic:='0' ;

	for all: c22v10m use entity primitive.c22v10m (sim);

SIGNAL  one:std_logic:='1';
SIGNAL  zero:std_logic:='0';
SIGNAL  jed_oept_1:std_logic:='0';
--Attribute PIN_NUMBERS of jed_node1:SIGNAL is "0001";

SIGNAL  jed_oept_2:std_logic:='0';
--Attribute PIN_NUMBERS of a(2):SIGNAL is "0002";

SIGNAL  jed_oept_3:std_logic:='0';
--Attribute PIN_NUMBERS of a(1):SIGNAL is "0003";

SIGNAL  jed_oept_4:std_logic:='0';
--Attribute PIN_NUMBERS of a(0):SIGNAL is "0004";

SIGNAL  jed_oept_5:std_logic:='0';
--Attribute PIN_NUMBERS of b(2):SIGNAL is "0005";

SIGNAL  jed_oept_6:std_logic:='0';
--Attribute PIN_NUMBERS of b(1):SIGNAL is "0006";

SIGNAL  jed_oept_7:std_logic:='0';
--Attribute PIN_NUMBERS of b(0):SIGNAL is "0007";

SIGNAL  jed_oept_8:std_logic:='0';
--Attribute PIN_NUMBERS of ref(2):SIGNAL is "0008";

SIGNAL  jed_oept_9:std_logic:='0';
--Attribute PIN_NUMBERS of ref(1):SIGNAL is "0009";

SIGNAL  jed_oept_10:std_logic:='0';
--Attribute PIN_NUMBERS of ref(0):SIGNAL is "0010";

SIGNAL  jed_oept_11:std_logic:='0';
--Attribute PIN_NUMBERS of sel:SIGNAL is "0011";

SIGNAL  jed_oept_14:std_logic:='0';
SIGNAL  jed_sum_14,jed_fb_14:std_logic:='0';
--Attribute PIN_NUMBERS of display(6):SIGNAL is "0014";

SIGNAL  jed_oept_15:std_logic:='0';
SIGNAL  jed_sum_15,jed_fb_15:std_logic:='0';
--Attribute PIN_NUMBERS of display(3):SIGNAL is "0015";

SIGNAL  jed_oept_16:std_logic:='0';
SIGNAL  jed_sum_16,jed_fb_16:std_logic:='0';
--Attribute PIN_NUMBERS of display(0):SIGNAL is "0016";

SIGNAL  jed_oept_17:std_logic:='0';
SIGNAL  jed_sum_17,jed_fb_17:std_logic:='0';
--Attribute PIN_NUMBERS of display(5):SIGNAL is "0017";

SIGNAL  jed_oept_20:std_logic:='0';
SIGNAL  jed_sum_20,jed_fb_20:std_logic:='0';
--Attribute PIN_NUMBERS of display(2):SIGNAL is "0020";

SIGNAL  jed_oept_22:std_logic:='0';
SIGNAL  jed_sum_22,jed_fb_22:std_logic:='0';
--Attribute PIN_NUMBERS of display(1):SIGNAL is "0022";

SIGNAL  jed_oept_23:std_logic:='0';
SIGNAL  jed_sum_23,jed_fb_23:std_logic:='0';
--Attribute PIN_NUMBERS of display(4):SIGNAL is "0023";

SIGNAL  jed_oept_25:std_logic:='0';
SIGNAL  jed_node25,jed_sum_25:std_logic:='0';
SIGNAL  jed_oept_26:std_logic:='0';
SIGNAL  jed_node26,jed_sum_26:std_logic:='0';

BEGIN
jed_node2 <= a(2) ;
jed_node3 <= a(1) ;
jed_node4 <= a(0) ;
jed_node5 <= b(2) ;
jed_node6 <= b(1) ;
jed_node7 <= b(0) ;
jed_node8 <= ref(2) ;
jed_node9 <= ref(1) ;
jed_node10 <= ref(0) ;
jed_node11 <= sel ;
Mcell_14:c22v10m
generic map(comb,
   ninv,
   xpin,
   	25 ns, --tpd
	25 ns, --tea
	25 ns, --ter
	15 ns, --tco
	18 ns, --ts
	0 ns, --th
	14 ns, --twh
	14 ns, --twl
	13 ns, --tcf
	25 ns, --taw
	25 ns, --tar
	25 ns, --tap
	25 ns  --tspr
)
port map(
     d=>jed_sum_14,
     clk=>jed_node1,
     oe=>jed_oept_14,
     ss=>jed_sum_26,
     ar=>jed_sum_25,
     y=>display(6),
     fb=>jed_fb_14
   );

Mcell_15:c22v10m
generic map(comb,
   ninv,
   xpin,
   	25 ns, --tpd
	25 ns, --tea
	25 ns, --ter
	15 ns, --tco
	18 ns, --ts
	0 ns, --th
	14 ns, --twh
	14 ns, --twl
	13 ns, --tcf
	25 ns, --taw
	25 ns, --tar
	25 ns, --tap
	25 ns  --tspr
)
port map(
     d=>jed_sum_15,
     clk=>jed_node1,
     oe=>jed_oept_15,
     ss=>jed_sum_26,
     ar=>jed_sum_25,
     y=>display(3),
     fb=>jed_fb_15
   );

Mcell_16:c22v10m
generic map(comb,
   ninv,
   xpin,
   	25 ns, --tpd
	25 ns, --tea
	25 ns, --ter
	15 ns, --tco
	18 ns, --ts
	0 ns, --th
	14 ns, --twh
	14 ns, --twl
	13 ns, --tcf
	25 ns, --taw
	25 ns, --tar
	25 ns, --tap
	25 ns  --tspr
)
port map(
     d=>jed_sum_16,
     clk=>jed_node1,
     oe=>jed_oept_16,
     ss=>jed_sum_26,
     ar=>jed_sum_25,
     y=>display(0),
     fb=>jed_fb_16
   );

Mcell_17:c22v10m
generic map(comb,
   ninv,
   xpin,
   	25 ns, --tpd
	25 ns, --tea
	25 ns, --ter
	15 ns, --tco
	18 ns, --ts
	0 ns, --th
	14 ns, --twh
	14 ns, --twl
	13 ns, --tcf
	25 ns, --taw
	25 ns, --tar
	25 ns, --tap
	25 ns  --tspr
)
port map(
     d=>jed_sum_17,
     clk=>jed_node1,
     oe=>jed_oept_17,
     ss=>jed_sum_26,
     ar=>jed_sum_25,
     y=>display(5),
     fb=>jed_fb_17
   );

Mcell_20:c22v10m
generic map(comb,
   ninv,
   xpin,
   	25 ns, --tpd
	25 ns, --tea
	25 ns, --ter
	15 ns, --tco
	18 ns, --ts
	0 ns, --th
	14 ns, --twh
	14 ns, --twl
	13 ns, --tcf
	25 ns, --taw
	25 ns, --tar
	25 ns, --tap
	25 ns  --tspr
)
port map(
     d=>jed_sum_20,
     clk=>jed_node1,
     oe=>jed_oept_20,
     ss=>jed_sum_26,
     ar=>jed_sum_25,
     y=>display(2),
     fb=>jed_fb_20
   );

Mcell_22:c22v10m
generic map(comb,
   ninv,
   xpin,
   	25 ns, --tpd
	25 ns, --tea
	25 ns, --ter
	15 ns, --tco
	18 ns, --ts
	0 ns, --th
	14 ns, --twh
	14 ns, --twl
	13 ns, --tcf
	25 ns, --taw
	25 ns, --tar
	25 ns, --tap
	25 ns  --tspr
)
port map(
     d=>jed_sum_22,
     clk=>jed_node1,
     oe=>jed_oept_22,
     ss=>jed_sum_26,
     ar=>jed_sum_25,
     y=>display(1),
     fb=>jed_fb_22
   );

Mcell_23:c22v10m
generic map(comb,
   ninv,
   xpin,
   	25 ns, --tpd
	25 ns, --tea
	25 ns, --ter
	15 ns, --tco
	18 ns, --ts
	0 ns, --th
	14 ns, --twh
	14 ns, --twl
	13 ns, --tcf
	25 ns, --taw
	25 ns, --tar
	25 ns, --tap
	25 ns  --tspr
)
port map(
     d=>jed_sum_23,
     clk=>jed_node1,
     oe=>jed_oept_23,
     ss=>jed_sum_26,
     ar=>jed_sum_25,
     y=>display(4),
     fb=>jed_fb_23
   );

jed_node25<=jed_sum_25;
jed_node26<=jed_sum_26;
jed_oept_14<=(one);

jed_oept_15<=(one);

jed_sum_15<= ((one));

jed_oept_16<=(one);

jed_sum_16<= ((one));

jed_oept_17<=(one);

jed_sum_17<= ((not(jed_node7) and (jed_node8) and (jed_node9) and (jed_node10)
 and (jed_node11)) or
(not(jed_node6) and not(jed_node7) and (jed_node8) and (jed_node10)
 and (jed_node11)) or
(not(jed_node5) and not(jed_node7) and (jed_node9) and (jed_node10)
 and (jed_node11)) or
(not(jed_node5) and not(jed_node6) and not(jed_node7)
 and (jed_node10) and (jed_node11)) or
(not(jed_node4) and (jed_node8) and (jed_node9) and (jed_node10)
 and not(jed_node11)) or
(not(jed_node3) and not(jed_node4) and (jed_node8) and (jed_node10)
 and not(jed_node11)) or
(not(jed_node2) and not(jed_node4) and (jed_node9) and (jed_node10)
 and not(jed_node11)) or
(not(jed_node2) and not(jed_node3) and not(jed_node4)
 and (jed_node10) and not(jed_node11)) or
(not(jed_node6) and (jed_node8) and (jed_node9) and (jed_node11)
) or
(not(jed_node5) and not(jed_node6) and (jed_node9) and (jed_node11)
) or
(not(jed_node3) and (jed_node8) and (jed_node9) and not(jed_node11)
) or
(not(jed_node2) and not(jed_node3) and (jed_node9) and not(jed_node11)
) or
(not(jed_node5) and (jed_node8) and (jed_node11)) or
(not(jed_node2) and (jed_node8) and not(jed_node11)
));

jed_oept_20<=(one);

jed_sum_20<= (((jed_node5) and (jed_node6) and (jed_node7) and not(jed_node10)
 and (jed_node11)) or
((jed_node5) and (jed_node7) and not(jed_node9) and not(jed_node10)
 and (jed_node11)) or
((jed_node6) and (jed_node7) and not(jed_node8) and not(jed_node10)
 and (jed_node11)) or
((jed_node7) and not(jed_node8) and not(jed_node9) and not(jed_node10)
 and (jed_node11)) or
((jed_node2) and (jed_node3) and (jed_node4) and not(jed_node10)
 and not(jed_node11)) or
((jed_node2) and (jed_node4) and not(jed_node9) and not(jed_node10)
 and not(jed_node11)) or
((jed_node3) and (jed_node4) and not(jed_node8) and not(jed_node10)
 and not(jed_node11)) or
((jed_node4) and not(jed_node8) and not(jed_node9) and not(jed_node10)
 and not(jed_node11)) or
((jed_node5) and (jed_node6) and not(jed_node9) and (jed_node11)
) or
((jed_node6) and not(jed_node8) and not(jed_node9) and (jed_node11)
) or
((jed_node2) and (jed_node3) and not(jed_node9) and not(jed_node11)
) or
((jed_node3) and not(jed_node8) and not(jed_node9) and not(jed_node11)
) or
((jed_node5) and not(jed_node8) and (jed_node11)) or
((jed_node2) and not(jed_node8) and not(jed_node11)
));

jed_oept_22<=(one);

jed_sum_22<= (((jed_fb_20)));

jed_oept_23<=(one);

jed_sum_23<= (((jed_fb_17)));

end DSMB;
