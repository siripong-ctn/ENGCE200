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

    signal L0, L1, L2, L3 : STD_LOGIC;
    signal L4, L5, L6, L7 : STD_LOGIC;
    signal L8, L9, L10, L11 : STD_LOGIC;

begin

    -- A > B
    L0 <= (not A2 and not A1) and
          (A0 and not B2 and not B1 and not B0);
    L1 <= (not A2 and A1) and
          ((not B2 and not B1) or
          (A0 and not B2 and B1 and not B0));
    L2 <= (A2 and not A1) and
          (B2 or
          (A0 and B2 and not B1 and not B0));
    L3 <= (A2 and A1) and
          (not B2 or not B1 or
          (A0 and B2 and B1 and not B0));

    -- A < B
    L4 <= (not A2 and not A1) and
          (B1 or B2 or
          (not A0 and not B2 and not B1 and B0));
    L5 <= (not A2 and A1) and
          (B2 or
          (not A0 and not B2 and B1));
    L6 <= (A2 and not A1) and
          ((B2 and B1) or
          (not A0 and B2 and not B1 and B0));
    L7 <= (A2 and A1) and
          (not A0 and B2 and B1 and B0);

    -- A = B
    L8 <= (not A2 and not A1) and
          ((not A0 and not B2 and not B1 and not B0) or
          (A0 and not B2 and not B1 and B0));
    L9 <= (not A2 and A1) and
          ((A0 and not B2 and B1 and B0) or
          (not A0 and not B2 and B1 and not B0));
    L10 <= (A2 and not A1) and
           ((not A0 and B2 and not B1 and not B0) or
           (A0 and B2 and not B1 and B0));
    L11 <= (A2 and A1) and
           ((A0 and B2 and B1 and B0) or
           (not A0 and B2 and B1 and not B0));
    -- Make L be input Multiplex
    -- A, B be output Multiplex       

    A_more_B  <= L0 or L1 or L2 or L3;
    A_less_B  <= L4 or L5 or L6 or L7;
    A_equal_B <= L8 or L9 or L10 or L11;

end Behavioral;