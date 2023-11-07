----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:07:14 10/23/2023 
-- Design Name: 
-- Module Name:    Encryption - Behavioral 
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

entity Encryption is
port (
	clock : in std_logic;
	kload,w1load,w2load,w3load,w0load,ssel,outen,sel,dsel,tload,rst,xorsel,ramsel,mode : in  std_logic;
	shiftmux,shiftsel,rsel,wsel,tsel : in std_logic_vector(1 downto 0);
	address : in std_logic_vector(3 downto 0);
	Text,master_key : in std_logic_vector(127 downto 0);
	output : out std_logic_vector(127 downto 0)
);
end Encryption;

architecture Behavioral of Encryption is
	component key_expansion is
	port (
		clock,rst : in std_logic;
		w1load,w2load,w3load,w0load,ssel,kload : in  std_logic;
		Extw0,Extw1,Extw2,Extw3 : out std_logic_vector(127 downto 0);
		csel,wsel,ksel : in std_logic_vector(1 downto 0);
		key : in std_logic_vector(127 downto 0)
		);
	end component;
	
	component RoundKey is
	port (
		shiftsel,shiftmux,rsel : in std_logic_vector(1 downto 0);
		w0,w1,w2,w3 : in std_logic_vector(127 downto 0);
		xorsel,ramsel,mode : in std_logic;
		clock : in std_logic;
		address : in std_logic_vector(3 downto 0);
		key : out std_logic_vector(127 downto 0)
		);
	end component;	
	
	component type1sbox is
	port (
		input : in std_logic_vector(127 downto 0);
		output : out std_logic_vector(127 downto 0)
		);
	end component;

	component type2sbox is
	port (
		input : in std_logic_vector(127 downto 0);
		output : out std_logic_vector(127 downto 0)
		);
	end component;
	
	component dbox is
	port (
		input : in std_logic_vector(127 downto 0);
		output : out std_logic_vector(127 downto 0)
		);
	end component;
	
	component mux2in is
	port (
			in1,in2 : in std_logic_vector(127 downto 0);
			sel : in std_logic;
			mout : out std_logic_vector(127 downto 0)
		);
	end component;
	
	component mux3in is
	port (
		in1,in2,in3 : in std_logic_vector(127 downto 0);
		sel : in std_logic_vector(1 downto 0);
		mout : out std_logic_vector(127 downto 0)
		);
	end component;
	

	
	component tristate is
	port (
		input : in std_logic_vector(127 downto 0);
		output : out std_logic_vector(127 downto 0);
		en : in std_logic
		);
	end component;
	
	component w is
	port (
		clock,load : in std_logic;
		input : in std_logic_vector(127 downto 0);
		output : out std_logic_vector(127 downto 0)
		);
	end component;
	
	
	signal roundtext,xor_out,sbox1out,sbox2out,dboxout,smuxout,dmuxout,tmuxout,key,w0,w1,w2,w3 : std_logic_vector(127 downto 0);  

begin


tmux : mux3in port map (
							in1 => dmuxout, 
							in2 => Text,
							in3 => xor_out,
							sel => tsel,
							mout => tmuxout
							);
						
type1_sbox : type1sbox port map (
									input => xor_out,
									output => sbox1out
									);							
							
type2_sbox : type2sbox port map (
									input => xor_out,
									output => sbox2out
									);							

smux : mux2in port map (
							in1 => sbox2out, 
							in2 => sbox1out,
							sel => sel,
							mout => smuxout
							);
							
diffusion_box : dbox port map (
									input => smuxout,
									output => dboxout
									);							
							
							
dmux : mux2in port map (
							in1 => dboxout, 
							in2 => sbox2out,
							sel => dsel,
							mout => dmuxout
							);
							
T : tristate port map (
							input => roundtext,
							output => Output,
							en => outen
							);
							
Round_key : RoundKey port map (
										clock => clock,
										shiftmux => shiftmux,
										shiftsel => shiftsel,
										rsel => rsel,
										w0 => w0,
										w1 => w1,
										w2 => w2,
										w3 => w3,
										xorsel => xorsel,
										ramsel => ramsel, 
										mode => mode,
										address => address,
										key => key
									);								

Expanded_keys : key_expansion port map (
										clock => clock,
										rst => rst,
										w1load => w1load,
										w2load => w2load,
										w3load => w3load,
										w0load => w0load,
										Extw0 => w0,
										Extw1 => w1,
										Extw2 => w2,
										Extw3 => w3,
										csel => wsel,
										wsel => wsel,
										ksel => wsel,
										ssel => ssel,
										kload => kload,
										key => master_key
								);
								
Round_text : w port map (
								clock => clock,
								load => tload,
								input => tmuxout,
								output => roundtext
								);
						

xor_out <= roundtext xor key;
						


end Behavioral;

