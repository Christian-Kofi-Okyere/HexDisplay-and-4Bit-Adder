-- Christian Okyere
-- project2
-- Two 4-bit binary numbers with sum as 5-bit ouput

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity task2 is

	port 
	(
		A	   : in unsigned  (3 downto 0);
		B	   : in unsigned  (3 downto 0);
		C : out unsigned (4 downto 0)
	);

end entity;

architecture rtl of task2 is
begin

	C <= ('0' & a) + ('0' & b);

end rtl;
