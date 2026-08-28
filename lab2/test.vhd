library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity test is
    Port (
        D0 : in STD_LOGIC;
        D1 : in STD_LOGIC;
        D2 : in STD_LOGIC;
        D3 : in STD_LOGIC;
        D4 : in STD_LOGIC;
        D5 : in STD_LOGIC;
        D6 : in STD_LOGIC;
        D7 : in STD_LOGIC;
        D8 : in STD_LOGIC;
        D9 : in STD_LOGIC;

        seg_a : out STD_LOGIC;
        seg_b : out STD_LOGIC;
        seg_c : out STD_LOGIC;
        seg_d : out STD_LOGIC;
        seg_e : out STD_LOGIC;
        seg_f : out STD_LOGIC;
        seg_g : out STD_LOGIC
    );
end test;

architecture Behavioral of test is

    -- Encoder Outputs
    signal A, B, C, D : STD_LOGIC;

    -- Inverted Signals
    signal NA, NB, NC, ND : STD_LOGIC;

    -- Decoder Outputs
    signal a_dec, b_dec, c_dec : STD_LOGIC;
    signal d_dec, e_dec, f_dec : STD_LOGIC;
    signal g_dec : STD_LOGIC;

    -- Enable Signal (OR 5 Input)
    signal EN : STD_LOGIC;

begin

--------------------------------------------------
-- Encoder
--------------------------------------------------

    A <= D8 or D9;
    B <= D4 or D5 or D6 or D7;
    C <= D2 or D3 or D6 or D7;
    D <= D1 or D3 or D5 or D7 or D9;

--------------------------------------------------
-- NOT Gates
--------------------------------------------------

    NA <= not A;
    NB <= not B;
    NC <= not C;
    ND <= not D;

--------------------------------------------------
-- OR 5 Input
-- D0 + A + B + C + D
--------------------------------------------------

    EN <= D0 or A or B or C or D;

--------------------------------------------------
-- Decoder Logic
--------------------------------------------------

    a_dec <= A or C or (B and D) or (NB and ND);
    b_dec <= NB or (C and D) or (NC and ND);
    c_dec <= B or NC or D;
    d_dec <= A or (NB and C) or (NB and ND) or (C and ND) or (B and NC and D);
    e_dec <= (NB and ND) or (C and ND);
    f_dec <= A or (B and NC) or (C and ND) or (NC and ND);
    g_dec <= A or (NB and C) or (B and NC) or (B and ND);

--------------------------------------------------
-- Final AND Gates
-------------------------------------------------- 

    seg_a <= a_dec and EN;
    seg_b <= b_dec and EN;
    seg_c <= c_dec and EN;
    seg_d <= d_dec and EN;
    seg_e <= e_dec and EN;
    seg_f <= f_dec and EN;
    seg_g <= g_dec and EN;

end Behavioral;