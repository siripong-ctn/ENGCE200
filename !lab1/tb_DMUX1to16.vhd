library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_DMUX1to16 is
end tb_DMUX1to16;

architecture sim of tb_DMUX1to16 is

    signal D : STD_LOGIC := '0';
    signal S : STD_LOGIC_VECTOR(3 downto 0);

    signal Y : STD_LOGIC_VECTOR(15 downto 0);

    -- แยกออกมาเพื่อดูทีละเส้นใน GTKWave
    signal Y0  : STD_LOGIC;
    signal Y1  : STD_LOGIC;
    signal Y2  : STD_LOGIC;
    signal Y3  : STD_LOGIC;
    signal Y4  : STD_LOGIC;
    signal Y5  : STD_LOGIC;
    signal Y6  : STD_LOGIC;
    signal Y7  : STD_LOGIC;
    signal Y8  : STD_LOGIC;
    signal Y9  : STD_LOGIC;
    signal Y10 : STD_LOGIC;
    signal Y11 : STD_LOGIC;
    signal Y12 : STD_LOGIC;
    signal Y13 : STD_LOGIC;
    signal Y14 : STD_LOGIC;
    signal Y15 : STD_LOGIC;

begin

    uut : entity work.DMUX1to16
    port map (
        D => D,
        S => S,
        Y => Y
    );

    -- แตก Bus ออกเป็นรายบิต
    Y0  <= Y(0);
    Y1  <= Y(1);
    Y2  <= Y(2);
    Y3  <= Y(3);
    Y4  <= Y(4);
    Y5  <= Y(5);
    Y6  <= Y(6);
    Y7  <= Y(7);
    Y8  <= Y(8);
    Y9  <= Y(9);
    Y10 <= Y(10);
    Y11 <= Y(11);
    Y12 <= Y(12);
    Y13 <= Y(13);
    Y14 <= Y(14);
    Y15 <= Y(15);

    process
    begin

        D <= '1';

        S <= "0000"; wait for 10 ns;
        S <= "0001"; wait for 10 ns;
        S <= "0010"; wait for 10 ns;
        S <= "0011"; wait for 10 ns;

        S <= "0100"; wait for 10 ns;
        S <= "0101"; wait for 10 ns;
        S <= "0110"; wait for 10 ns;
        S <= "0111"; wait for 10 ns;

        S <= "1000"; wait for 10 ns;
        S <= "1001"; wait for 10 ns;
        S <= "1010"; wait for 10 ns;
        S <= "1011"; wait for 10 ns;

        S <= "1100"; wait for 10 ns;
        S <= "1101"; wait for 10 ns;
        S <= "1110"; wait for 10 ns;
        S <= "1111"; wait for 10 ns;

        D <= '0';

        wait;

    end process;

end sim;