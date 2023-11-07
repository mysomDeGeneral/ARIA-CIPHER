----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:10:55 10/30/2023 
-- Design Name: 
-- Module Name:    Ram - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Ram is
    port(
        clock : in std_logic;
        address : in std_logic_vector(3 downto 0);
        mode : in std_logic;
        data_in : in std_logic_vector(127 downto 0);
        data_out : out std_logic_vector(127 downto 0)
    );
end Ram;

architecture Behavioral of Ram is
    type ram is array(0 to 15) of std_logic_vector(127 downto 0);
    signal ram_data : ram;

begin

    process(clock)
    begin
        if rising_edge(clock) then
            if mode = '1' then
                ram_data(to_integer(unsigned(address))) <= data_in;
            else
                data_out <= ram_data(to_integer(unsigned(address)));
            end if;
        end if;
    end process;

end Behavioral;

