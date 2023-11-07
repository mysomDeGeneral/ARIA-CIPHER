----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:42:34 10/12/2023 
-- Design Name: 
-- Module Name:    sbox4 - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sbox4 is
port (
		address : in std_logic_vector(7 downto 0);
		data : out std_logic_vector(7 downto 0)
);
end sbox4;

architecture Behavioral of sbox4 is
type ROM is array(0 to 255) of std_logic_vector(7 downto 0);

constant sbox4 : ROM :=(
0=>x"30",1=>x"68",2=>x"99",3=>x"1b",4=>x"87",5=>x"b9",6=>x"21",7=>x"78",8=>x"50",9=>x"39",10=>x"db",11=>x"e1",12=>x"72",13=>x"09",14=>x"62",15=>x"3c",
16=>x"3e",17=>x"7e",18=>x"5e",19=>x"8e",20=>x"f1",21=>x"a0",22=>x"cc",23=>x"a3",24=>x"2a",25=>x"1d",26=>x"fb",27=>x"b6",28=>x"d6",29=>x"20",30=>x"c4",31=>x"8d",
32=>x"81",33=>x"65",34=>x"f5",35=>x"89",36=>x"cb",37=>x"9d",38=>x"77",39=>x"c6",40=>x"57",41=>x"43",42=>x"56",43=>x"17",44=>x"d4",45=>x"40",46=>x"1a",47=>x"4d",
48=>x"c0",49=>x"63",50=>x"6c",51=>x"e3",52=>x"b7",53=>x"c8",54=>x"64",55=>x"6a",56=>x"53",57=>x"aa",58=>x"38",59=>x"98",60=>x"0c",61=>x"f4",62=>x"9b",63=>x"ed",
64=>x"7f",65=>x"22",66=>x"76",67=>x"af",68=>x"dd",69=>x"3a",70=>x"0b",71=>x"58",72=>x"67",73=>x"88",74=>x"06",75=>x"c3",76=>x"35",77=>x"0d",78=>x"01",79=>x"8b",
80=>x"8c",81=>x"c2",82=>x"e6",83=>x"5f",84=>x"02",85=>x"24",86=>x"75",87=>x"93",88=>x"66",89=>x"1e",90=>x"e5",91=>x"e2",92=>x"54",93=>x"d8",94=>x"10",95=>x"ce",
96=>x"7a",97=>x"e8",98=>x"08",99=>x"2c",100=>x"12",101=>x"97",102=>x"32",103=>x"ab",104=>x"b4",105=>x"27",106=>x"0a",107=>x"23",108=>x"df",109=>x"ef",110=>x"ca",111=>x"d9",
112=>x"b8",113=>x"fa",114=>x"dc",115=>x"31",116=>x"6b",117=>x"d1",118=>x"ad",119=>x"19",120=>x"49",121=>x"bd",122=>x"51",123=>x"96",124=>x"ee",125=>x"e4",126=>x"a8",127=>x"41",
128=>x"da",129=>x"ff",130=>x"cd",131=>x"55",132=>x"86",133=>x"36",134=>x"be",135=>x"61",136=>x"52",137=>x"f8",138=>x"bb",139=>x"0e",140=>x"82",141=>x"48",142=>x"69",143=>x"9a",
144=>x"e0",145=>x"47",146=>x"9e",147=>x"5c",148=>x"04",149=>x"4b",150=>x"34",151=>x"15",152=>x"79",153=>x"26",154=>x"a7",155=>x"de",156=>x"29",157=>x"ae",158=>x"92",159=>x"d7",
160=>x"84",161=>x"e9",162=>x"d2",163=>x"ba",164=>x"5d",165=>x"f3",166=>x"c5",167=>x"b0",168=>x"bf",169=>x"a4",170=>x"3b",171=>x"71",172=>x"44",173=>x"46",174=>x"2b",175=>x"fc",
176=>x"eb",177=>x"6f",178=>x"d5",179=>x"f6",180=>x"14",181=>x"fe",182=>x"7c",183=>x"70",184=>x"5a",185=>x"7d",186=>x"fd",187=>x"2f",188=>x"18",189=>x"83",190=>x"16",191=>x"a5",
192=>x"91",193=>x"1f",194=>x"05",195=>x"95",196=>x"74",197=>x"a9",198=>x"c1",199=>x"5b",200=>x"4a",201=>x"85",202=>x"6d",203=>x"13",204=>x"07",205=>x"4f",206=>x"4e",207=>x"45",
208=>x"b2",209=>x"0f",210=>x"c9",211=>x"1c",212=>x"a6",213=>x"bc",214=>x"ec",215=>x"73",216=>x"90",217=>x"7b",218=>x"cf",219=>x"59",220=>x"8f",221=>x"a1",222=>x"f9",223=>x"2d",
224=>x"f2",225=>x"b1",226=>x"00",227=>x"94",228=>x"37",229=>x"9f",230=>x"d0",231=>x"2e",232=>x"9c",233=>x"6e",234=>x"28",235=>x"3f",236=>x"80",237=>x"f0",238=>x"3d",239=>x"d3",
240=>x"25",241=>x"8a",242=>x"b5",243=>x"e7",244=>x"42",245=>x"b3",246=>x"c7",247=>x"ea",248=>x"f7",249=>x"4c",250=>x"11",251=>x"33",252=>x"03",253=>x"a2",254=>x"ac",255=>x"60"
);
begin

data <= sbox4(conv_integer(address));
end Behavioral;

