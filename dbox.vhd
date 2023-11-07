----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:55:30 10/12/2023 
-- Design Name: 
-- Module Name:    dbox - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dbox is
port (
	input : in std_logic_vector(127 downto 0);
	output : out std_logic_vector(127 downto 0)
	);
end dbox;

architecture Behavioral of dbox is
signal y0,y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13,y14,y15 : std_logic_vector(7 downto 0);
--signal x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15 : std_logic_vector(7 downto 0);

begin

--x0 <= input(127 downto 120);
--x1 <= input(119 downto 112);
--x2 <= input(111 downto 104);
--x3 <= input(103 downto 96);
--x4 <= input(95 downto 88);
--x5 <= input(87 downto 80);
--x6 <= input(79 downto 72);
--x7 <= input(71 downto 64);
--x8 <= input(63 downto 56);
--x9 <= input(55 downto 48);
--x10 <= input(47 downto 40);
--x11 <= input(39 downto 32);
--x12 <= input(31 downto 24);
--x13 <= input(23 downto 16);
--x14 <= input(15 downto 8);
--x15 <= input(7 downto 0);

--
--y0 <= x3 xor x4 xor x6 xor x8 xor x9 xor x13 xor x14;
--y1 <= x2 xor x5 xor x7 xor x8 xor x9 xor x12 xor x15;
--y2 <= x1 xor x4 xor x6 xor x10 xor x11 xor x12 xor x15;
--y3 <= x0 xor x5 xor x7 xor x10 xor x11 xor x13 xor x14;
--y4 <= x0 xor x2 xor x5 xor x8 xor x11 xor x14 xor x15;
--y5 <= x1 xor x3 xor x4 xor x9  xor x10 xor x14 xor x15;
--y6 <= x0 xor x2 xor x7 xor x9  xor x10 xor x12 xor x13;
--y7 <= x1 xor x3 xor x6 xor x8  xor x11 xor x12 xor x13;
--y8 <= x0 xor x1 xor x4 xor x7  xor x10 xor x13 xor x15;
--y9 <= x0 xor x1 xor x5 xor x6  xor x11 xor x12 xor x14;
--y10 <= x2 xor x3 xor x5 xor x6  xor x8  xor x13 xor x15;
--y11 <= x2 xor x3 xor x4 xor x7  xor x9  xor x12 xor x14;
--y12 <= x1 xor x2 xor x6 xor x7  xor x9  xor x11 xor x12;
--y13 <= x0 xor x3 xor x6 xor x7  xor x8  xor x10 xor x13;
--y14 <= x0 xor x3 xor x4 xor x5  xor x9  xor x11 xor x14;
--y15 <= x1 xor x2 xor x4 xor x5  xor x8  xor x10 xor x15;




y0 <= input(103 downto 96) xor input(95 downto 88) xor input(79 downto 72) xor input(63 downto 56) xor input(55 downto 48) xor input(23 downto 16) xor input(15 downto 8);
y1 <= input(111 downto 104) xor input(87 downto 80) xor input(71 downto 64) xor input(63 downto 56) xor input(55 downto 48) xor input(31 downto 24) xor input(7 downto 0);
y2 <= input(119 downto 112) xor input(95 downto 88) xor input(79 downto 72) xor input(47 downto 40) xor input(39 downto 32) xor input(31 downto 24) xor input(7 downto 0);
y3 <= input(127 downto 120) xor input(87 downto 80) xor input(71 downto 64) xor input(47 downto 40) xor input(39 downto 32) xor input(23 downto 16) xor input(15 downto 8);
y4 <= input(127 downto 120) xor input(111 downto 104) xor input(87 downto 80) xor input(63 downto 56) xor input(39 downto 32) xor input(15 downto 8) xor input(7 downto 0);
y5 <= input(119 downto 112) xor input(103 downto 96) xor input(95 downto 88) xor input(55 downto 48) xor input(47 downto 40) xor input(15 downto 8) xor input(7 downto 0);
y6 <= input(127 downto 120) xor input(111 downto 104) xor input(71 downto 64) xor input(55 downto 48)  xor input(47 downto 40) xor input(31 downto 24) xor input(23 downto 16);
y7 <= input(119 downto 112) xor input(103 downto 96) xor input(79 downto 72) xor input(63 downto 56)  xor input(39 downto 32) xor input(31 downto 24) xor input(23 downto 16);
y8 <= input(127 downto 120) xor input(119 downto 112) xor input(95 downto 88) xor input(71 downto 64)  xor input(47 downto 40) xor input(23 downto 16) xor input(7 downto 0);
y9 <= input(127 downto 120) xor input(119 downto 112) xor input(87 downto 80) xor input(79 downto 72)  xor input(39 downto 32) xor input(31 downto 24) xor input(15 downto 8);
y10 <= input(111 downto 104) xor input(103 downto 96) xor input(87 downto 80) xor input(79 downto 72)  xor input(63 downto 56)  xor input(23 downto 16) xor input(7 downto 0);
y11 <= input(111 downto 104) xor input(103 downto 96) xor input(95 downto 88) xor input(71 downto 64)  xor input(55 downto 48)  xor input(31 downto 24) xor input(15 downto 8);
y12 <= input(119 downto 112) xor input(111 downto 104) xor input(79 downto 72) xor input(71 downto 64)  xor input(55 downto 48)  xor input(39 downto 32) xor input(31 downto 24);
y13 <= input(127 downto 120) xor input(103 downto 96) xor input(79 downto 72) xor input(71 downto 64)  xor input(63 downto 56)  xor input(47 downto 40) xor input(23 downto 16);
y14 <= input(127 downto 120) xor input(103 downto 96) xor input(95 downto 88) xor input(87 downto 80)  xor input(55 downto 48)  xor input(39 downto 32) xor input(15 downto 8);
y15 <= input(119 downto 112) xor input(111 downto 104) xor input(95 downto 88) xor input(87 downto 80) xor input(63 downto 56)  xor input(47 downto 40) xor input(7 downto 0);


output <= y0&y1&y2&y3&y4&y5&y6&y7&y8&y9&y10&y11&y12&y13&y14&y15;








end Behavioral;

