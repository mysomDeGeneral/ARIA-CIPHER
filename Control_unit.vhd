----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:18:54 10/26/2023 
-- Design Name: 
-- Module Name:    Control_unit - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Control_unit is
    port (
        clock,reset,mode : in std_logic;
        kload,tload,sel,ssel,w0load,w1load,w2load,w3load,dsel,outen,rst,xorsel,ramsel,rmode : out std_logic;
        shiftsel,shiftmux,wsel,rsel ,tsel: out std_logic_vector(1 downto 0);
        address : out std_logic_vector(3 downto 0):="0000"
    );
end Control_unit;

architecture Behavioral of Control_unit is
    type state_type is (ST0,ST1,ST2,ST3,ST4);
    signal NS,PS : state_type;
    signal encrypt_contrl : std_logic_vector(11 downto 0);
    signal k_expand_contrl : std_logic_vector(11 downto 0);
    signal next_icount: std_logic_vector(1 downto 0);
    signal i_count : std_logic_vector(1 downto 0) := "00";
    signal next_ncount,next_dcount : std_logic_vector(3 downto 0);
    signal n_count,d_count: std_logic_vector(3 downto 0) := "0000";

begin

    kload <= k_expand_contrl(11);
    tsel <= k_expand_contrl(10) & k_expand_contrl(9);
    rst <= k_expand_contrl(8);
    tload <= k_expand_contrl(7);
    ssel <= k_expand_contrl(6);
    wsel <= k_expand_contrl(5) &  k_expand_contrl(4);
    w0load <= k_expand_contrl(3);
    w1load <= k_expand_contrl(2);
    w2load <= k_expand_contrl(1);
    w3load <= k_expand_contrl(0);

    
    outen <= encrypt_contrl(11);
    sel <= encrypt_contrl(10);
    dsel <= encrypt_contrl(9);
    shiftsel <= encrypt_contrl(8) & encrypt_contrl(7);
    shiftmux <= encrypt_contrl(6) & encrypt_contrl(5);
    rsel <= encrypt_contrl(4) & encrypt_contrl(3);
    ramsel <= encrypt_contrl(2);
    xorsel <= encrypt_contrl(1);
    rmode <= encrypt_contrl(0);


    sync:process(clock,reset)
    begin
        if (reset='1') then
            PS <= ST0;
        elsif rising_edge(clock) then 
            PS <= NS;
            i_count <= next_icount;
            n_count <= next_ncount;
            d_count <= next_dcount;
        end if;

    end process;

    comb:process(PS,n_count,i_count,d_count,mode)
    begin
        case (PS) is 
            when ST0 =>
                k_expand_contrl <= "101000000000";
                encrypt_contrl <= "000000000000";
                next_icount <= "00";
                next_ncount <= "0000";
                next_dcount <= "0000";
                address <= "0000";
                NS <= ST1;

            when ST1 =>
					next_ncount <= "0000";
                    next_dcount <= "0000";
                    address <= "0000";
                    encrypt_contrl <= "000000000000";
                if (i_count="00") then
                    k_expand_contrl <= "000000001000";
                    next_icount <= i_count + 1;
                    NS <= ST1;
                elsif (i_count = "01") then
                    k_expand_contrl <= "000101100100";
                    next_icount <= i_count + 1;
                    NS <= ST1;
                elsif (i_count = "10") then
                    k_expand_contrl <= "000000010010";
                    next_icount <= i_count + 1;
                    NS <= ST1;
                else
                    next_icount <= "00";
                    NS <= ST2;
                    if (mode = '0') then
                        k_expand_contrl <= "001011000001";
                    else
                        k_expand_contrl <= "000001000001";
                    end if;
                end if;
                    

            when ST2 =>
					next_icount <= "00";
                    next_dcount <= "0000";
                    if (mode = '0') then
                        address <= "0000";
                        k_expand_contrl <= "000010000000";
                        if (n_count = "0000") then
                            encrypt_contrl <= "010110100010";
                            next_ncount <= n_count + 1;
                            NS <= ST2;
                        elsif (n_count = "0001") then
                            encrypt_contrl <= "000111001010";
                            next_ncount <= n_count + 1;
                            NS <= ST2;
                        elsif (n_count = "0010") then
                            encrypt_contrl <= "010111110010";
                            next_ncount <= n_count + 1;
                            NS <= ST2;
                        elsif (n_count = "0011") then
                            encrypt_contrl <= "000110011010";
                            next_ncount <= n_count + 1;
                            NS <= ST2;
                        elsif (n_count = "0100") then
                            encrypt_contrl <= "010100100010";
                            next_ncount <= n_count + 1;
                            NS <= ST2;
                        elsif (n_count = "0101") then
                            encrypt_contrl <= "000101001010";
                            next_ncount <= n_count + 1;
                            NS <= ST2;
                        elsif (n_count = "0110") then
                            encrypt_contrl <= "010101110010";
                            next_ncount <= n_count + 1;
                            NS <= ST2;
                        elsif (n_count = "0111") then
                            encrypt_contrl <= "000100011010";
                            next_ncount <= n_count + 1;
                            NS <= ST2;
                        elsif (n_count = "1000") then
                            encrypt_contrl <= "010000100010";
                            next_ncount <= n_count + 1;
                            NS <= ST2;
                        elsif (n_count = "1001") then
                            encrypt_contrl <= "000001001010";
                            next_ncount <= n_count + 1;
                            NS <= ST2;
                        elsif (n_count = "1010") then
                            encrypt_contrl <= "010001110010";
                            next_ncount <= n_count + 1;
                            NS <= ST2;
                        elsif (n_count = "1011") then
                            encrypt_contrl <= "001000011010";
                            next_ncount <= n_count + 1;
                            NS <= ST2;
                        elsif (n_count = "1100") then
                            k_expand_contrl <= "010010000000";
                            encrypt_contrl <= "000010100010";
                            next_ncount <= n_count + 1;
                            NS <= ST4;
                        else
                            encrypt_contrl <= "000000000000";
                            next_ncount <= "0000";
                            NS <= ST4;
                        end if;
                    else
                        k_expand_contrl <= "000000000000";
                        if (n_count = "0000") then
                            encrypt_contrl <= "010110100101";
                            next_ncount <= n_count + 1;
                            address <= "1100";
                            NS <= ST2;
                        elsif (n_count = "0001") then
                            encrypt_contrl <= "000111001001";
                            next_ncount <= n_count + 1;
                            address <= "1011";
                            NS <= ST2;
                        elsif (n_count = "0010") then
                            encrypt_contrl <= "010111110001";
                            next_ncount <= n_count + 1;
                            address <= "1010";
                            NS <= ST2;
                        elsif (n_count = "0011") then
                            encrypt_contrl <= "000110011001";
                            next_ncount <= n_count + 1;
                            address <= "1001";
                            NS <= ST2;
                        elsif (n_count = "0100") then
                            encrypt_contrl <= "010100100001";
                            next_ncount <= n_count + 1;
                            address <= "1000";
                            NS <= ST2;
                        elsif (n_count = "0101") then
                            encrypt_contrl <= "000101001001";
                            next_ncount <= n_count + 1;
                            address <= "0111";
                            NS <= ST2;
                        elsif (n_count = "0110") then
                            encrypt_contrl <= "010101110001";
                            next_ncount <= n_count + 1;
                            address <= "0110";
                            NS <= ST2;
                        elsif (n_count = "0111") then
                            encrypt_contrl <= "000100011001";
                            next_ncount <= n_count + 1;
                            address <= "0101";
                            NS <= ST2;
                        elsif (n_count = "1000") then
                            encrypt_contrl <= "010000100001";
                            next_ncount <= n_count + 1;
                            address <= "0100";
                            NS <= ST2;
                        elsif (n_count = "1001") then
                            encrypt_contrl <= "000001001001";
                            next_ncount <= n_count + 1;
                            address <= "0011";
                            NS <= ST2;
                        elsif (n_count = "1010") then
                            encrypt_contrl <= "010001110001";
                            next_ncount <= n_count + 1;
                            address <= "0010";
                            NS <= ST2;
                        elsif (n_count = "1011") then
                            encrypt_contrl <= "001000011001";
                            next_ncount <= n_count + 1;
                            address <= "0001";
                            NS <= ST2;
                        elsif (n_count = "1100") then
                            k_expand_contrl <= "010000000000";
                            encrypt_contrl <= "000010100101";
                            next_ncount <= n_count + 1;
                            address <= "0000";
                            NS <= ST2;
                        else
                            encrypt_contrl <= "000000000000";
                            k_expand_contrl <= "001010000000";
                            next_ncount <= "0000";
                            address <= "0000";
                            NS <= ST3;
                        end if;
                    end if;
            

            when ST3 =>
                next_icount <= "00";
                next_ncount <= "0000";
                k_expand_contrl <= "000010000000";
                if (d_count = "0000") then
                    encrypt_contrl <= "010110100000";
                    next_dcount <= d_count + 1;
                    address <= "0001";
                    NS <= ST3;
                elsif (d_count = "0001") then
                    encrypt_contrl <= "000111001000";
                    next_dcount <= d_count + 1;
                    address <= "0010";
                    NS <= ST3;
                elsif (d_count = "0010") then
                    encrypt_contrl <= "010111110000";
                    next_dcount <= d_count + 1;
                    address <= "0011";
                    NS <= ST3;
                elsif (d_count = "0011") then
                    encrypt_contrl <= "000110011000";
                    next_dcount <= d_count + 1;
                    address <= "0100";
                    NS <= ST3;
                elsif (d_count = "0100") then
                    encrypt_contrl <= "010100100000";
                    next_dcount <= d_count + 1;
                    address <= "0101";
                    NS <= ST3;
                elsif (d_count = "0101") then
                    encrypt_contrl <= "000101001000";
                    next_dcount <= d_count + 1;
                    address <= "0110";
                    NS <= ST3;
                elsif (d_count = "0110") then
                    encrypt_contrl <= "010101110000";
                    next_dcount <= d_count + 1;
                    address <= "0111";
                    NS <= ST3;
                elsif (d_count = "0111") then
                    encrypt_contrl <= "000100011000";
                    next_dcount <= d_count + 1;
                    address <= "1000";
                    NS <= ST3;
                elsif (d_count = "1000") then
                    encrypt_contrl <= "010000100000";
                    next_dcount <= d_count + 1;
                    address <= "1001";
                    NS <= ST3;
                elsif (d_count = "1001") then
                    encrypt_contrl <= "000001001000";
                    next_dcount <= d_count + 1;
                    address <= "1010";
                    NS <= ST3;
                elsif (d_count = "1010") then
                    encrypt_contrl <= "010001110000";
                    next_dcount <= d_count + 1;
                    address <= "1011";
                    NS <= ST3;
                elsif (d_count = "1011") then
                    encrypt_contrl <= "001000011000";
                    next_dcount <= d_count + 1;
                    address <= "1100";
                    NS <= ST3;
                elsif (d_count = "1100") then
                    k_expand_contrl <= "010010000000";
                    encrypt_contrl <= "000010100000";
                    next_dcount <= d_count + 1;
                    address <= "1100";
                    NS <= ST4;
                else
                    encrypt_contrl <= "000000000000";
                    next_dcount <= "0000";
                    address <= "0000";
                    NS <= ST4;
                end if;
                

            when ST4 =>
                k_expand_contrl <= "000000000000";
                encrypt_contrl <= "100000000000";
				next_icount <= "00";
                next_ncount <= "0000";
                next_dcount <= "0000";
                address <= "0000";
                NS <= ST4;

            when others =>
                k_expand_contrl <= "000000000000";
                encrypt_contrl <= "000000000000";
				next_icount <= "00";
                next_ncount <= "0000";
                next_dcount <= "0000";
                address <= "0000";
                NS <= ST4;
        end case;
    end process;

end Behavioral;

