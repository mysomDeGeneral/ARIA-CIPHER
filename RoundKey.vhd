----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:31:50 10/23/2023 
-- Design Name: 
-- Module Name:    RoundKey - Behavioral 
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

entity RoundKey is
port (
	shiftsel,shiftmux,rsel : in std_logic_vector(1 downto 0);
	w0,w1,w2,w3 : in std_logic_vector(127 downto 0);
	xorsel,ramsel,mode : in std_logic;
	clock : in std_logic;
	address : in std_logic_vector(3 downto 0);
	key : out std_logic_vector(127 downto 0)
);
end RoundKey;

architecture Behavioral of RoundKey is
	component mux4in is
	port (
		in1,in2,in3,in4 : in std_logic_vector(127 downto 0);
		sel : in std_logic_vector(1 downto 0);
		mout : out std_logic_vector(127 downto 0)
	);
	end component;

	component mux2in is
	port (
			in1,in2 : in std_logic_vector(127 downto 0);
			sel : in std_logic;
			mout : out std_logic_vector(127 downto 0)
	);
	end component;
	

	component Shifter is
	port (
		input : in std_logic_vector(127 downto 0);
		output : out std_logic_vector(127 downto 0);
		sel : in std_logic_vector(1 downto 0)
	);
	end component;	

	component Ram is
		port(
			clock : in std_logic;
			address : in std_logic_vector(3 downto 0);
			mode : in std_logic;
			data_in : in std_logic_vector(127 downto 0);
			data_out : out std_logic_vector(127 downto 0)
		);
	end component;

	component dbox is
		port (
			input : in std_logic_vector(127 downto 0);
			output : out std_logic_vector(127 downto 0)
			);
		end component;
	
	signal no_shift,shifter_out,shiftmux_out,rkey,ram_in,ram_out,dbox_out : std_logic_vector(127 downto 0);
begin
									
Shift_Mux : mux4in port map (
									in1 => w0,
									in2 => w1,
									in3 => w2,
									in4 => w3,
									sel => shiftmux,
									mout => shiftmux_out
									);
									
No_Shift_Mux : mux4in port map (
									in1 => w0,
									in2 => w1,
									in3 => w2,
									in4 => w3,
									sel => rsel,
									mout => no_shift
									);


W_Shift : Shifter port map (
									input => shiftmux_out,
									output => shifter_out,
									sel => shiftsel
									);

Xor_mux : mux2in port map (
									in1 => ram_out,
									in2 => rkey,
									sel => xorsel,
									mout => key
									);

Ram_mux : mux2in port map (
									in1 => dbox_out,
									in2 => rkey,
									sel => ramsel,
									mout => ram_in
									);

rdbox : dbox port map (
									input => rkey,
									output => dbox_out
									);

Ram1 : Ram port map (
									clock => clock,
									address => address,
									mode => mode,
									data_in => ram_in,
									data_out => ram_out
									);

									
rkey <= shifter_out xor no_shift;

end Behavioral;

