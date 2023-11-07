----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:01:46 10/15/2023 
-- Design Name: 
-- Module Name:    key_expansion - Behavioral 
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

entity key_expansion is
port (
	clock,rst : in std_logic;
	w1load,w2load,w3load,w0load : in  std_logic;
	Extw0,Extw1,Extw2,Extw3 : out std_logic_vector(127 downto 0);
	csel,wsel,ksel : in std_logic_vector(1 downto 0);
	ssel,kload : in std_logic;
	key : in std_logic_vector(127 downto 0)
);
end key_expansion;

architecture Behavioral of key_expansion is
	component w is
	port (
	clock,load : in std_logic;
	input : in std_logic_vector(127 downto 0);
	output : out std_logic_vector(127 downto 0)
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
	
	component mux3in is
	port (
		in1,in2,in3 : in std_logic_vector(127 downto 0);
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

	component key_reg is
		port(
			clock,load,rst : in std_logic;
			input : in std_logic_vector(127 downto 0);
			output : out std_logic_vector(127 downto 0)
			);
	end component;
	
	
	

signal w0out,w1out,w2out,win,w3out,key_out : std_logic_vector(127 downto 0);
signal cmuxout,wmuxout,smuxout,dboxout,kmuxout,sbox2out,sbox1out,sbox : std_logic_vector(127 downto 0);
constant c1 : std_logic_vector(127 downto 0) := x"517cc1b727220a94fe13abe8fa9a6ee0";
constant c2 : std_logic_vector(127 downto 0) := x"6db14acc9e21c820ff28b1d5ef5de2b0";
constant c3 : std_logic_vector(127 downto 0) := x"db92371d2126e9700324977504e8c90e";


begin

Extw0 <= w0out;
Extw1 <= w1out;
Extw2 <= w2out;
Extw3 <= w3out;


MK: key_reg port map(
	clock => clock,
	rst => rst,
	load => kload,
	input => key,
	output => key_out
);


w0 : w port map (
						clock => clock,
						load => w0load,
						input => key_out,
						output => w0out
						);

w1 : w port map (
						clock => clock,
						load => w1load,
						input => win,
						output => w1out
						);
						
w2 : w port map (
						clock => clock,
						load => w2load,
						input => win,
						output => w2out
						);
						
						
w3 : w port map (
						clock => clock,
						load => w3load,
						input => win,
						output => w3out
						);

cmux : mux3in port map (
								in1 => c3,
								in2 => c2,
								in3 => c1,
								sel => csel,
								mout => cmuxout
								);
								
wmux : mux3in port map (
								in1 => w2out,
								in2 => w1out,
								in3 => w0out,
								sel => wsel,
								mout => wmuxout
								);
								
smux : mux2in port map (
								in1 => sbox2out,
								in2 => sbox1out,
								sel => ssel,
								mout => smuxout
								);
															
								
kmux : mux3in port map (
								in1 => w1out,
								in2 => w0out,
								in3 => key_out,
								sel => ksel,
								mout => kmuxout
								);	

diffusion_box : dbox port map (
									input => smuxout,
									output => dboxout
									);

type1_sbox : type1sbox port map (
									input => sbox,
									output => sbox1out
									);									

type2_sbox : type2sbox port map (
									input => sbox,
									output => sbox2out
									);	
									


sbox <= cmuxout xor wmuxout;
win <= kmuxout xor dboxout;
								
end Behavioral;

