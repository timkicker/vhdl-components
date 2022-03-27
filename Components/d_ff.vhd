library ieee;
use ieee.std_logic_1164.all;

entity d_ff is
    port(
        d in std_logic;
        clk : in std_logic;
        q : out std_logic
    );
end d_ff;

architecture behav of d_ff is
    signal q_temp : std_logic;
    begin
        process(clk)
        begin
            if (clk'event and clk = '1') then
                q_temp <= d;
            end if;
        end process;
    q <= q_temp;
end behav;

