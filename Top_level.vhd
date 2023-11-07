----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:12:55 10/26/2023 
-- Design Name: 
-- Module Name:    Encryption_top_level - Behavioral 
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

entity Top_level is
    port(
        clock,reset,mode : in std_logic;
        Text,master_key : in std_logic_vector(127 downto 0);
        output : out std_logic_vector(127 downto 0)
    );
end Top_level;

architecture Behavioral of Top_level is
    component Control_unit is
        port (
            clock,reset,mode : in std_logic;
            kload,tload,sel,ssel,w0load,w1load,w2load,w3load,dsel,outen,rst,xorsel,ramsel,rmode : out std_logic;
            shiftsel,shiftmux,wsel,rsel,tsel : out std_logic_vector(1 downto 0);
            address : out std_logic_vector(3 downto 0)
        );
    end component;

    component Encryption is
        port (
            clock : in std_logic;
            kload,w1load,w2load,w3load,w0load,ssel,outen,sel,dsel,tload,rst,xorsel,ramsel,mode : in  std_logic;
            shiftmux,shiftsel,rsel,wsel,tsel: in std_logic_vector(1 downto 0);
            address : in std_logic_vector(3 downto 0);
            Text,master_key : in std_logic_vector(127 downto 0);
            output : out std_logic_vector(127 downto 0)
        );
        end component;

        signal kload,tload,sel,ssel,w0load,w1load,w2load,w3load,dsel,outen,rst,xorsel,ramsel,rmode : std_logic;
        signal shiftsel,shiftmux,wsel,rsel,tsel : std_logic_vector(1 downto 0);
        signal address : std_logic_vector(3 downto 0);

begin

    DP : Encryption port map (
        clock => clock,
        rst => rst,
        w1load => w1load,
        w2load => w2load,
        w3load => w3load,
        w0load => w0load,
        ssel => ssel,
        outen => outen,
        tsel => tsel,
        sel => sel,
        dsel => dsel,
        tload => tload,
        kload => kload,
        shiftmux => shiftmux,
        shiftsel => shiftsel,
        rsel => rsel,
        xorsel => xorsel,
        ramsel => ramsel,
        mode => rmode,
        address => address,
        wsel => wsel,
        Text => Text,
        master_key => master_key,
        output => output
           ); 

    CU : Control_unit port map (
        clock => clock,
        reset => reset,
        mode => mode,
        w1load => w1load,
        w2load => w2load,
        w3load => w3load,
        w0load => w0load,
        ssel => ssel,
        outen => outen,
        tsel => tsel,
        sel => sel,
        dsel => dsel,
        tload => tload,
        kload => kload,
        shiftmux => shiftmux,
        shiftsel => shiftsel,
        rsel => rsel,
        wsel => wsel,
        rst => rst,
        xorsel => xorsel,
        ramsel => ramsel,
        rmode => rmode,
        address => address
    );


end Behavioral;

