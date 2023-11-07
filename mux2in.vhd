----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:36:54 10/15/2023 
-- Design Name: 
-- Module Name:    mux2in - Behavioral 
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

entity mux2in is
port (
		in1,in2 : in std_logic_vector(127 downto 0);
		sel : in std_logic;
		mout : out std_logic_vector(127 downto 0)
);
end mux2in;

architecture Behavioral of mux2in is

begin

with sel select
	mout <= in1 when '0',
				in2 when others;

end Behavioral;

