----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:35:46 10/28/2023 
-- Design Name: 
-- Module Name:    rkey - Behavioral 
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

entity rkey is
port (
	shiftin,noshift: in std_logic_vector(127 downto 0);
	sel : in std_logic_vector(1 downto 0);
	key : out std_logic_vector(127 downto 0)
);
end rkey;

architecture Behavioral of rkey is
component Shifter is
port (
	input : in std_logic_vector(127 downto 0);
	output : out std_logic_vector(127 downto 0);
	sel : in std_logic_vector(1 downto 0)
);
end component;

signal shiftout : std_logic_vector(127 downto 0);

begin

Shift : Shifter port map(
input => shiftin,
output => shiftout,
sel => sel
);

key <= noshift xor shiftout;

end Behavioral;

