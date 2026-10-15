library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity BCD_Adder_Subtractor is
    Port (
        A_H, A_T, A_U : in  STD_LOGIC_VECTOR(3 downto 0);
        B_H, B_T, B_U : in  STD_LOGIC_VECTOR(3 downto 0);

        M             : in  STD_LOGIC;
        -- M=0 ADD
        -- M=1 SUB

        S_H, S_T, S_U : out STD_LOGIC_VECTOR(3 downto 0);
        COUT          : out STD_LOGIC
    );
end BCD_Adder_Subtractor;

architecture Behavioral of BCD_Adder_Subtractor is

begin

process(A_H,A_T,A_U,B_H,B_T,B_U,M)

    variable a_num  : integer;
    variable b_num  : integer;
    variable result : integer;

    variable h,t,u  : integer;

begin

    a_num :=
        to_integer(unsigned(A_H))*100 +
        to_integer(unsigned(A_T))*10 +
        to_integer(unsigned(A_U));

    b_num :=
        to_integer(unsigned(B_H))*100 +
        to_integer(unsigned(B_T))*10 +
        to_integer(unsigned(B_U));

    if (M='0') then
        result := a_num + b_num;
    else
        result := a_num - b_num;
    end if;

    if result < 0 then
        result := 0;
    end if;

    h := result / 100;
    t := (result mod 100) / 10;
    u := result mod 10;

    S_H <= std_logic_vector(to_unsigned(h,4));
    S_T <= std_logic_vector(to_unsigned(t,4));
    S_U <= std_logic_vector(to_unsigned(u,4));

    if(result > 999) then
        COUT <= '1';
    else
        COUT <= '0';
    end if;

end process;

end Behavioral;