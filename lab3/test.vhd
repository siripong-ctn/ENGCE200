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

    -- A > B
    process(A2, A1, A0, B2, B1, B0)
        variable SEL : STD_LOGIC_VECTOR(1 downto 0);
    begin
        SEL := A2 & A1;

        case SEL is
            when "00" =>
                A_more_B <= (A0 and not B2 and not B1 and not B0);

            when "01" =>
                A_more_B <= ((not B2 and not B1) or (A0 and not B2 and B1 and not B0));

            when "10" =>
                A_more_B <= (B2 or (A0 and B2 and not B1 and not B0));

            when others =>
                A_more_B <= (not B2 or not B1 or (A0 and B2 and B1 and not B0));
        end case;
    end process;

    -- A < B
    process(A2, A1, A0, B2, B1, B0)
        variable SEL : STD_LOGIC_VECTOR(1 downto 0);
    begin
        SEL := A2 & A1;

        case SEL is
            when "00" =>
                A_less_B <=
                    (B1 or B2 or
                     (not A0 and not B2 and not B1 and B0));

            when "01" =>
                A_less_B <=
                    (B2 or
                     (not A0 and not B2 and B1 and B0));

            when "10" =>
                A_less_B <=
                    ((B2 and B1) or
                     (not A0 and B2 and not B1 and B0));

            when others =>
                A_less_B <=
                    (not A0 and B2 and B1 and B0);
        end case;
    end process;

    -- A = B
    process(A2, A1, A0, B2, B1, B0)
        variable SEL : STD_LOGIC_VECTOR(1 downto 0);
    begin
        SEL := A2 & A1;

        case SEL is
            when "00" =>
                A_equal_B <=
                    ((not A0 and not B2 and not B1 and not B0) or
                     (A0 and not B2 and not B1 and B0));

            when "01" =>
                A_equal_B <=
                    ((A0 and not B2 and B1 and B0) or
                     (not A0 and not B2 and B1 and not B0));

            when "10" =>
                A_equal_B <=
                    ((not A0 and B2 and not B1 and not B0) or
                     (A0 and B2 and not B1 and B0));

            when others =>
                A_equal_B <=
                    ((A0 and B2 and B1 and B0) or
                     (not A0 and B2 and B1 and not B0));
        end case;
    end process;

end Behavioral;