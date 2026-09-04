library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_test is
end tb_test;

architecture Behavioral of tb_test is

    component test
        Port (
            A2, A1, A0 : in STD_LOGIC;
            B2, B1, B0 : in STD_LOGIC;
            A_more_B   : out STD_LOGIC;
            A_less_B   : out STD_LOGIC;
            A_equal_B  : out STD_LOGIC
        );
    end component;

    signal A2, A1, A0 : STD_LOGIC := '0';
    signal B2, B1, B0 : STD_LOGIC := '0';
    signal A_more_B, A_less_B, A_equal_B : STD_LOGIC;

begin

    UUT: test
    port map (
        A2 => A2,
        A1 => A1,
        A0 => A0,
        B2 => B2,
        B1 => B1,
        B0 => B0,
        A_more_B => A_more_B,
        A_less_B => A_less_B,
        A_equal_B => A_equal_B
    );

    stimulus : process
    begin

        -- A=3, B=6 => A<B
        A2<='1'; A1<='0'; A0<='1';
        B2<='1'; B1<='1'; B0<='0';
        wait for 10 ns;

        -- A=6, B=3 => A>B
        A2<='1'; A1<='1'; A0<='0';
        B2<='1'; B1<='0'; B0<='1';
        wait for 10 ns;

        -- A=6, B=6 => A=B
        A2<='1'; A1<='1'; A0<='0';
        B2<='1'; B1<='1'; B0<='0';
        wait for 10 ns;

        wait;
    end process;

end Behavioral;