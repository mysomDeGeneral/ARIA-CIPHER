----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:33:43 10/26/2023 
-- Design Name: 
-- Module Name:    key_reg - Behavioral 
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

entity key_reg is
port(
	clock,load,rst : in std_logic;
	input : in std_logic_vector(127 downto 0);
	output : out std_logic_vector(127 downto 0)
	);
end key_reg;

architecture Behavioral of key_reg is

begin

process(clock,rst,load)
begin
	if (rst = '1') then
		output <= (others => '0');
	elsif rising_edge(clock) then
		if load='1' then
			output <= input;
		end if;
	end if;
end process;

end Behavioral;

