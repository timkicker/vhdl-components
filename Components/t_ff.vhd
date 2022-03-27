library ieee;
use ieee.std_logic_1164.all;

entity t_ff is
    port(
        clk : in std_logic;
        t : in std_logic;
        q : out std_logic
    );
end t_ff;

architecture behav of t_ff is
    signal q_temp <= q;
    begin
        process(clk)
        begin
            if (clk'event and clk = '1') then
                if (t = '1') then
                    q_temp <= not q_temp;
                end if;
            end if;
        end process;
    q <= q_temp;
end behav;