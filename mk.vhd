----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:32:06 10/12/2023 
-- Design Name: 
-- Module Name:    mk - Behavioral 
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

entity mk is
port (
	clock,load,reset : in std_logic;
	input : in std_logic_vector(127 downto 0);
	output : out std_logic_vector(127 downto 0)
);
end mk;

architecture Behavioral of mk is

begin

process(clock,reset,load)
begin
	if reset = '1' then 
		output <= (others => '0');
	elsif rising_edge(clock) then
		if load='1' then
			output <= input;
		end if;
	end if;
end process;

end Behavioral;

