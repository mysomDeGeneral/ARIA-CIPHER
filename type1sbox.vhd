----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:17:53 10/12/2023 
-- Design Name: 
-- Module Name:    type1sbox - Behavioral 
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

entity type1sbox is
port (
	input : in std_logic_vector(127 downto 0);
	output : out std_logic_vector(127 downto 0)
	);
end type1sbox;

architecture Behavioral of type1sbox is
component sbox1 is
port (
		address : in std_logic_vector(7 downto 0);
		data : out std_logic_vector(7 downto 0)
);
end component;

component sbox2 is
port (
		address : in std_logic_vector(7 downto 0);
		data : out std_logic_vector(7 downto 0)
);
end component;

component sbox3 is
port (
		address : in std_logic_vector(7 downto 0);
		data : out std_logic_vector(7 downto 0)
);
end component;

component sbox4 is
port (
		address : in std_logic_vector(7 downto 0);
		data : out std_logic_vector(7 downto 0)
);
end component;

signal x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15 : std_logic_vector(7 downto 0);
signal y0,y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13,y14,y15 : std_logic_vector(7 downto 0);
--signal addr1,addr2,addr3,addr4 : std_logic_vector(7 downto 0);
--signal data1,data2,data3,data4 : std_logic_vector(7 downto 0);
begin

x0 <= input(127 downto 120);
x1 <= input(119 downto 112);
x2 <= input(111 downto 104);
x3 <= input(103 downto 96);
x4 <= input(95 downto 88);
x5 <= input(87 downto 80);
x6 <= input(79 downto 72);
x7 <= input(71 downto 64);
x8 <= input(63 downto 56);
x9 <= input(55 downto 48);
x10 <= input(47 downto 40);
x11 <= input(39 downto 32);
x12 <= input(31 downto 24);
x13 <= input(23 downto 16);
x14 <= input(15 downto 8);
x15 <= input(7 downto 0);



sb1 : sbox1 port map(
							address => x0,
							data => y0
							);
							
sb2 : sbox2 port map(
							address => x1,
							data => y1
							);
							
sb3 : sbox3 port map(
							address => x2,
							data => y2
							);
							
sb4 : sbox4 port map(
							address => x3,
							data => y3
							);
sb5 : sbox1 port map(
							address => x4,
							data => y4
							);
sb6 : sbox2 port map(
							address => x5,
							data => y5
							);
sb7 : sbox3 port map(
							address => x6,
							data => y6
							);
sb8 : sbox4 port map(
							address => x7,
							data => y7
							);

sb9 : sbox1 port map(
							address => x8,
							data => y8
							);
							
sb10 : sbox2 port map(
							address => x9,
							data => y9
							);
sb11 : sbox3 port map(
							address => x10,
							data => y10
							);
							
sb12 : sbox4 port map(
							address => x11,
							data => y11
							);
sb13 : sbox1 port map(
							address => x12,
							data => y12
							);
							
sb14 : sbox2 port map(
							address => x13,
							data => y13
							);	

sb15 : sbox3 port map(
							address => x14,
							data => y14
							);		

sb16 : sbox4 port map(
							address => x15,
							data => y15
							);



output <= y0&y1&y2&y3&y4&y5&y6&y7&y8&y9&y10&y11&y12&y13&y14&y15;

end Behavioral;

