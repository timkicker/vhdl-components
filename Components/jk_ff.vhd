library ieee;
use ieee.std_logic_1164.all;

entity jk_ff is 
port(
    j : in std_logic;
    k : in std_logic;
    clk : in std_logic;
    q : out std_logic
);
end jk_ff;

architecture behav of jk_ff is
    signal q_temp : std_logic;

    begin
        process (clk)
        begin
            if (clk'event and clk = '1') then
                if (j = '1' and k = '1') then
                    null;
                elsif ( j = '1' and k = '0') then
                    q_temp <= '1';
                elsif ( j = '0' and k = '1') then
                    q_temp <= '0';
                else
                    q_temp <= not q_temp;
                end if;
            end if;
        end process;
    end behav;
    