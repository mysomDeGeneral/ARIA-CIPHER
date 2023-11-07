----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:10:39 10/15/2023 
-- Design Name: 
-- Module Name:    dmux3out - Behavioral 
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

entity dmux3out is
port (
		out1,out2,out3 : out std_logic_vector(127 downto 0);
		sel : in std_logic_vector(1 downto 0);
		din : in std_logic_vector(127 downto 0)
);
end dmux3out;

architecture Behavioral of dmux3out is

begin

process(sel,din)
begin
	if sel = "00" then
		out1 <= din;
		out2 <= (others => '0');
		out3 <= (others => '0');
	elsif sel = "01" then
		out2 <= din;
		out1 <= (others => '0');
		out3 <= (others => '0');
	elsif sel = "10" then
		out3 <= din;
		out1 <= (others => '0');
		out2 <= (others => '0');
	else
		out1 <= (others => '0');
		out2 <= (others => '0');
		out3 <= (others => '0');
	end if;
end process;

end Behavioral;

