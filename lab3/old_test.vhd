library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity test is
    Port (
        A2, A1, A0 : in STD_LOGIC;
        B2, B1, B0 : in STD_LOGIC;
        A_more_B   : out STD_LOGIC;
        A_less_B   : out STD_LOGIC;
        A_equal_B  : out STD_LOGIC
    );
end test;

architecture Behavioral of test is
begin
    -- A>B
    A_more_B  <= (not A2 and not A1) and (A0 and not B2 and not B1 and not B0)or 
        (not A2 and A1) and((not B2 and not B1) or(A0 and not B2 and B1 and not B0))or 
        (A2 and not A1) and(B2 or(A0 and B2 and not B1 and not B0))or 
        (A2 and A1) and(not B2 or not B1 or(A0 and B2 and B1 and not B0));
    -- A<B
    A_less_B  <= (not A2 and not A1) and(B1 or B2 or(not A0 and not B2 and not B1 and B0)) or
        (not A2 and A1) and(B2 or(not A0 and not B2 and B1)) or
        (A2 and not A1) and((B2 and B1) or(not A0 and B2 and not B1 and B0)) or
        (A2 and A1) and(not A0 and B2 and B1 and B0);
    -- A=B
    A_equal_B <= (not A2 and not A1) and((not A0 and not B2 and not B1 and not B0) or(A0 and not B2 and not B1 and B0)) or
        (not A2 and A1) and((A0 and not B2 and B1 and B0) or(not A0 and not B2 and B1 and not B0)) or
        (A2 and not A1) and((not A0 and B2 and not B1 and not B0) or(A0 and B2 and not B1 and B0)) or
        (A2 and A1) and((A0 and B2 and B1 and B0) or(not A0 and B2 and B1 and not B0));

end Behavioral;