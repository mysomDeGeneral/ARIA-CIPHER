----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:41:04 10/12/2023 
-- Design Name: 
-- Module Name:    sbox2 - Behavioral 
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

entity sbox2 is
port (
		address : in std_logic_vector(7 downto 0);
		data : out std_logic_vector(7 downto 0)
);
end sbox2;

architecture Behavioral of sbox2 is
type ROM is array(0 to 255) of std_logic_vector(7 downto 0);
constant sbox2 : ROM :=(
0=>x"e2",1=>x"4e",2=>x"54",3=>x"fc",4=>x"94",5=>x"c2",6=>x"4a",7=>x"cc",8=>x"62",9=>x"0d",10=>x"6a",11=>x"46",12=>x"3c",13=>x"4d",14=>x"8b",15=>x"d1",
16=>x"5e",17=>x"fa",18=>x"64",19=>x"cb",20=>x"b4",21=>x"97",22=>x"be",23=>x"2b",24=>x"bc",25=>x"77",26=>x"2e",27=>x"03",28=>x"d3",29=>x"19",30=>x"59",31=>x"c1",
32=>x"1d",33=>x"06",34=>x"41",35=>x"6b",36=>x"55",37=>x"f0",38=>x"99",39=>x"69",40=>x"ea",41=>x"9c",42=>x"18",43=>x"ae",44=>x"63",45=>x"df",46=>x"e7",47=>x"bb",
48=>x"00",49=>x"73",50=>x"66",51=>x"fb",52=>x"96",53=>x"4c",54=>x"85",55=>x"e4",56=>x"3a",57=>x"09",58=>x"45",59=>x"aa",60=>x"0f",61=>x"ee",62=>x"10",63=>x"eb",
64=>x"2d",65=>x"7f",66=>x"f4",67=>x"29",68=>x"ac",69=>x"cf",70=>x"ad",71=>x"91",72=>x"8d",73=>x"78",74=>x"c8",75=>x"95",76=>x"f9",77=>x"2f",78=>x"ce",79=>x"cd",
80=>x"08",81=>x"7a",82=>x"88",83=>x"38",84=>x"5c",85=>x"83",86=>x"2a",87=>x"28",88=>x"47",89=>x"db",90=>x"b8",91=>x"c7",92=>x"93",93=>x"a4",94=>x"12",95=>x"53",
96=>x"ff",97=>x"87",98=>x"0e",99=>x"31",100=>x"36",101=>x"21",102=>x"58",103=>x"48",104=>x"01",105=>x"8e",106=>x"37",107=>x"74",108=>x"32",109=>x"ca",110=>x"e9",111=>x"b1",
112=>x"b7",113=>x"ab",114=>x"0c",115=>x"d7",116=>x"c4",117=>x"56",118=>x"42",119=>x"26",120=>x"07",121=>x"98",122=>x"60",123=>x"d9",124=>x"b6",125=>x"b9",126=>x"11",127=>x"40",
128=>x"ec",129=>x"20",130=>x"8c",131=>x"bd",132=>x"a0",133=>x"c9",134=>x"84",135=>x"04",136=>x"49",137=>x"23",138=>x"f1",139=>x"4f",140=>x"50",141=>x"1f",142=>x"13",143=>x"dc",
144=>x"d8",145=>x"c0",146=>x"9e",147=>x"57",148=>x"e3",149=>x"c3",150=>x"7b",151=>x"65",152=>x"3b",153=>x"02",154=>x"8f",155=>x"3e",156=>x"e8",157=>x"25",158=>x"92",159=>x"e5",
160=>x"15",161=>x"dd",162=>x"fd",163=>x"17",164=>x"a9",165=>x"bf",166=>x"d4",167=>x"9a",168=>x"7e",169=>x"c5",170=>x"39",171=>x"67",172=>x"fe",173=>x"76",174=>x"9d",175=>x"43",
176=>x"a7",177=>x"e1",178=>x"d0",179=>x"f5",180=>x"68",181=>x"f2",182=>x"1b",183=>x"34",184=>x"70",185=>x"05",186=>x"a3",187=>x"8a",188=>x"d5",189=>x"79",190=>x"86",191=>x"a8",
192=>x"30",193=>x"c6",194=>x"51",195=>x"4b",196=>x"1e",197=>x"a6",198=>x"27",199=>x"f6",200=>x"35",201=>x"d2",202=>x"6e",203=>x"24",204=>x"16",205=>x"82",206=>x"5f",207=>x"da",
208=>x"e6",209=>x"75",210=>x"a2",211=>x"ef",212=>x"2c",213=>x"b2",214=>x"1c",215=>x"9f",216=>x"5d",217=>x"6f",218=>x"80",219=>x"0a",220=>x"72",221=>x"44",222=>x"9b",223=>x"6c",
224=>x"90",225=>x"0b",226=>x"5b",227=>x"33",228=>x"7d",229=>x"5a",230=>x"52",231=>x"f3",232=>x"61",233=>x"a1",234=>x"f7",235=>x"b0",236=>x"d6",237=>x"3f",238=>x"7c",239=>x"6d",
240=>x"ed",241=>x"14",242=>x"e0",243=>x"a5",244=>x"3d",245=>x"22",246=>x"b3",247=>x"f8",248=>x"89",249=>x"de",250=>x"71",251=>x"1a",252=>x"af",253=>x"ba",254=>x"b5",255=>x"81"
);

begin

data <= sbox2(conv_integer(address));
end Behavioral;

