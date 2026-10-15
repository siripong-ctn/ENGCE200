library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_BCD_Adder_Subtractor is
end tb_BCD_Adder_Subtractor;

architecture Behavioral of tb_BCD_Adder_Subtractor is

component BCD_Adder_Subtractor
Port (
    A_H, A_T, A_U : in  STD_LOGIC_VECTOR(3 downto 0);
    B_H, B_T, B_U : in  STD_LOGIC_VECTOR(3 downto 0);
    M             : in  STD_LOGIC;
    S_H, S_T, S_U : out STD_LOGIC_VECTOR(3 downto 0);
    COUT          : out STD_LOGIC
);
end component;

signal A_H,A_T,A_U : STD_LOGIC_VECTOR(3 downto 0);
signal B_H,B_T,B_U : STD_LOGIC_VECTOR(3 downto 0);

signal S_H,S_T,S_U : STD_LOGIC_VECTOR(3 downto 0);
signal M           : STD_LOGIC;
signal COUT        : STD_LOGIC;

begin

UUT: BCD_Adder_Subtractor
port map(
    A_H => A_H,
    A_T => A_T,
    A_U => A_U,

    B_H => B_H,
    B_T => B_T,
    B_U => B_U,

    M => M,

    S_H => S_H,
    S_T => S_T,
    S_U => S_U,

    COUT => COUT
);

stim_proc : process
begin

    ------------------------------------------------
    -- TEST 1 : 245 + 378 = 623
    ------------------------------------------------

    M <= '0';

    A_H <= "0010";
    A_T <= "0100";
    A_U <= "0101";

    B_H <= "0011";
    B_T <= "0111";
    B_U <= "1000";

    wait for 100 ns;

    ------------------------------------------------
    -- TEST 2 : 589 + 478 = 1067
    ------------------------------------------------

    M <= '0';

    A_H <= "0101";
    A_T <= "1000";
    A_U <= "1001";

    B_H <= "0100";
    B_T <= "0111";
    B_U <= "1000";

    wait for 100 ns;

    ------------------------------------------------
    -- TEST 3 : 635 - 214 = 421
    ------------------------------------------------

    M <= '1';

    A_H <= "0110";
    A_T <= "0011";
    A_U <= "0101";

    B_H <= "0010";
    B_T <= "0001";
    B_U <= "0100";

    wait for 100 ns;

    ------------------------------------------------
    -- TEST 4 : 500 - 125 = 375
    ------------------------------------------------

    M <= '1';

    A_H <= "0101";
    A_T <= "0000";
    A_U <= "0000";

    B_H <= "0001";
    B_T <= "0010";
    B_U <= "0101";

    wait for 100 ns;

    wait;

end process;

end Behavioral;