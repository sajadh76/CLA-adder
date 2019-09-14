--------------------------------------------
-- Testbench for 16 bit CLA adder in VHDL -- 
-- Engineer: Sajad Hamzenejadi            --                                                       
-- Email: sajadhamzenejadi76@gmail.com    --                                                    
-- Iran                                   --                                                
--------------------------------------------

library ieee;
use ieee.std_logic_1164.all;entity carry_lookahead_adder_tb is
end carry_lookahead_adder_tb;
architecture behave of carry_lookahead_adder_tb is
signal r_ADD_1 : std_logic_vector(15 downto 0) := (others => '0');
signal r_ADD_2 : std_logic_vector(15 downto 0) := (others => '0');
signal w_RESULT : std_logic_vector(16 downto 0);
component carry_lookahead_adder is
port (
i_add1 : in std_logic_vector(15 downto 0);
i_add2 : in std_logic_vector(15 downto 0);
o_result : out std_logic_vector(16 downto 0)
);
end component carry_lookahead_adder;
begin
CLAtest : carry_lookahead_adder port map (
i_add1 => r_ADD_1,
i_add2 => r_ADD_2,
o_result => w_RESULT
);process is
begin
r_ADD_1 <= "0000000000000000";
r_ADD_2 <= "0000000000000000";
wait for 20 ns;
r_ADD_1 <= "1111111111111111";
r_ADD_2 <= "1111111111111111";
wait for 20 ns;
r_ADD_1 <= "0000001111110011";
r_ADD_2 <= "0010111000100011";
wait for 20 ns;
end process;
end behave;
