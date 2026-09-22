library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity test is
    Port (
        M, S1, S0, Co : in STD_LOGIC;
        Cin, GB, FB, GA, FA  : out STD_LOGIC;
        A1, A0, B1, B0 : in STD_LOGIC;
        F0, F1, F2, F3, F4  : out STD_LOGIC;
        Mini0, Mini1, Mini2, Mini3, Mini4  : out STD_LOGIC;
        C0, C1, C2, C3, C4  : out STD_LOGIC;
    );
end test;
architecture Behavioral of test is
begin
    Cin <= not M and Co;
    GB <= M or S1 or S0;
    FB <= not M and S1 and not S0;
    GA <= 1;
    FA <= not M and S1 and S0;

    -- Mini0
    process(A0, B0)
        variable SEL : STD_LOGIC_VECTOR(1 downto 0);
    begin
        SEL := S1 & S0;
        case SEL is
            when "00" => Mini0 <= A0 and B0;
            when "01" => Mini0 <= A0 or B0;
            when "10" => Mini0 <= A0 xor B0;
            when others => Mini0 <= A0 xnor B0;
        end case;
    end process;

    -- F0
    process(A0, B0)
        variable SEL : STD_LOGIC_VECTOR(1 downto 0);
    begin
        SEL := M;
        case SEL is
            when "0" => F0 <= (Cin xor (FA xor (GA and A0)) xor (FB xor (GB and B0)));
            when others => F0 <= Mini0;
        end case;
    end process;

    C0 <= (Cin and ((FA xor (GA and A0) or (FB xor (GB and B0))))) or ((FA xor (GA and A0) and (FB xor (GB and B0))));

    ---------
end Behavioral;