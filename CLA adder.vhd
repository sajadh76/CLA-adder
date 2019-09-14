---------------------------------------------------------------------
--  selection sort algorithm with a random number generator using MIPS - Assembly           
--  engineer: sajad hamzenejadi                                                            
--  email: sajadhamzenejadi76@gmail.com                                                     
-- 2017, iran                                                                      
---------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
entity carry_lookahead_adder is
port (
i_add1 : in std_logic_vector(15 downto 0);
i_add2 : in std_logic_vector(15 downto 0);
o_result : out std_logic_vector(16 downto 0)
);
end carry_lookahead_adder;
architecture simple of carry_lookahead_adder is
component full_adder is
port (
a : in std_logic;
b : in std_logic;
cin : in std_logic;sum : out std_logic;
cout : out std_logic
);
end component full_adder;
signal Generat: std_logic_vector(15 downto 0); -- Generate
signal Propagate: std_logic_vector(15 downto 0); -- Propagate
signal Cin: std_logic_vector(16 downto 0); -- Carry
signal Sum : std_logic_vector(15 downto 0);
begin
-- Create the Full Adders
GEN_FULL_ADDERS : for ii in 0 to 15 generate
FULL_ADDER_INST : full_adder
port map (a => i_add1(ii), b => i_add2(ii), cin => Cin(ii), sum => Sum(ii), cout => open);
end generate GEN_FULL_ADDERS;-- Gi=Ai*Bi
-- Pi=Ai+Bi
-- Create the Carry Terms
GEN_CLA : for jj in 0 to 15 generate
Generat (jj) <= i_add1(jj) and i_add2(jj);
Propagate (jj) <= i_add1(jj) or i_add2(jj);
Cin(jj+1) <= Generat (jj) or (Propagate (jj) and Cin(jj)); ----Cin = Pi or Gi
end generate GEN_CLA;
Cin(0) <= '0'; -- no carry input
o_result <= Cin(16) & Sum ;
end simple;
