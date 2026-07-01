library IEEE; --เรียกใช้ Library IEEE
use IEEE.STD_LOGIC_1164.ALL; --นำ Package STD_LOGIC_1164 ทั้งหมดมาใช้งาน
entity or_gate_tb is --ประกาศตัวแปร
end or_gate_tb;
architecture Behavior of or_gate_tb is --กำหนดการทำงานของวงจร
    component or_gate
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
    uut: or_gate Port Map ( --สร้างการจำลอง OR Gate
          A => tb_A,
          B => tb_B,
          Y => tb_Y
        );
    stim_proc: process --เริ่มต้นการทำงาน
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
    end process; --สิ้นสุดการทำงาน
end Behavior;

-- OR GATE TRUTH TABLE
--| A | B |(Y)|
--| 0 | 0 | 0 |
--| 0 | 1 | 1 |
--| 1 | 0 | 1 |
--| 1 | 1 | 1 |