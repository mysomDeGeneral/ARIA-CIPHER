----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:53:45 10/15/2023 
-- Design Name: 
-- Module Name:    mux4in - Behavioral 
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

entity mux4in is
port (
		in1,in2,in3,in4 : in std_logic_vector(127 downto 0);
		sel : in std_logic_vector(1 downto 0);
		mout : out std_logic_vector(127 downto 0)
);
end mux4in;

architecture Behavioral of mux4in is

begin

with sel select
	mout <= in1 when "00",
				in2 when "01",
				in3 when "10",
				in4 when "11",
				(others => '0') when others;

end Behavioral;

