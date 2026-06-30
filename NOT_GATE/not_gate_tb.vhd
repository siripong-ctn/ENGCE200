library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity not_gate_tb is
end not_gate_tb;
architecture Behavior of not_gate_tb is
    component not_gate
        Port ( 
            A : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;
    signal tb_A : STD_LOGIC := '0';
    signal tb_Y : STD_LOGIC;
begin
    uut: not_gate Port Map (
          A => tb_A,
          Y => tb_Y
        );
    stim_proc: process
    begin
        tb_A <= '0';
        wait for 10 ns;

        tb_A <= '1';
        wait for 10 ns;

        tb_A <= '0';

        wait;
    end process;
end Behavior;