----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:25:49 10/23/2023 
-- Design Name: 
-- Module Name:    RShift - Behavioral 
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

entity Shifter is
port (
	input : in std_logic_vector(127 downto 0);
	output : out std_logic_vector(127 downto 0);
	sel : in std_logic_vector(1 downto 0)
);
end Shifter;

architecture Behavioral of Shifter is

begin



	with sel select 
		output <= input(18 downto 0) & input(127 downto 19) when "11",
					 input(30 downto 0) & input(127 downto 31) when "10",
					 input(96 downto 0) & input(127 downto 97) when "01",
					 input(66 downto 0) & input(127 downto 67) when "00",
					 (others => '0') when others;



end Behavioral;

