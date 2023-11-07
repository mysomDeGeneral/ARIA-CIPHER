----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:23:59 10/15/2023 
-- Design Name: 
-- Module Name:    dmux2out - Behavioral 
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

entity dmux2out is
port (
		out1,out2 : out std_logic_vector(127 downto 0);
		sel : in std_logic;
		din : in std_logic_vector(127 downto 0)
);
end dmux2out;

architecture Behavioral of dmux2out is

begin

process(sel,din)
begin
	if sel = '0' then
		out1 <= din;
		out2 <= (others => '0');
	else
		out1 <= (others => '0');
		out2 <= din;
	end if;
end process;

end Behavioral;

