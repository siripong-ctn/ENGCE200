library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity nand_gate_tb is
end nand_gate_tb;
architecture Behavior of nand_gate_tb is
    component nand_gate
        Port ( 
            A : in  STD_LOGIC;
            B : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;
    signal tb_A : STD_LOGIC := '0';
    signal tb_B : STD_LOGIC := '0';
    signal tb_Y : STD_LOGIC;
begin
    uut: nand_gate Port Map (
          A => tb_A,
          B => tb_B,
          Y => tb_Y
        );
    stim_proc: process
    begin
        tb_A <= '0'; tb_B <= '0';
        wait for 10 ns;

        tb_A <= '0'; tb_B <= '1';
        wait for 10 ns;

        tb_A <= '1'; tb_B <= '0';
        wait for 10 ns;

        tb_A <= '1'; tb_B <= '1';
        wait for 10 ns;

        tb_A <= '0'; tb_B <= '0';

        wait;
    end process;
end Behavior;