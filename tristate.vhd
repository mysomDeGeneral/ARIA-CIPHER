----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:14:14 10/16/2023 
-- Design Name: 
-- Module Name:    tristate - Behavioral 
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

entity tristate is
port (
	input : in std_logic_vector(127 downto 0);
	output : out std_logic_vector(127 downto 0);
	en : in std_logic
);
end tristate;

architecture Behavioral of tristate is

begin

process(en,input)
begin
	if (en = '1') then
		output <= input;
	else
		output <= (others => 'Z');
	end if;
end process;

end Behavioral;

