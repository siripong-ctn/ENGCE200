library IEEE; --เรียกใช้ Library IEEE
use IEEE.STD_LOGIC_1164.ALL; --นำ Package STD_LOGIC_1164 ทั้งหมดมาใช้งาน
entity or_gate is --ประกาศตัวแปรขาเข้าขาออก
    Port ( 
        A : in  STD_LOGIC;
        B : in  STD_LOGIC;
        Y : out STD_LOGIC
    );
end or_gate;
architecture Dataflow of or_gate is --กำหนดการทำงานของวงจร
begin
    Y <= A or B; -- output <= input *or* input
end Dataflow;

--ghdl -a or_gate.vhd or_gate_tb.vhd
--ghdl -e or_gate_tb
--ghdl -r or_gate_tb --wave=or_gate_wave.vcd