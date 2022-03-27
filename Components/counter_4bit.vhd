library ieee;
use ieee.std_logic_1164.all;

entity counter_4bit is
    port(
        clk : in std_logic;
        reset : in std_logic;
        count : in std_logic_vector(3 downto 0)
    );
end counter_4bit;

architecture behav of counter_4bit is
    component jk_ff_r 
    port(
        clk : in std_logic;
        j : in std_logic;
        k : in std_logic;
        r : in std_logic;
        q : out std_logic
    );
    end component;

    signal t0, t1, t2, t3, q0, q1, q2, q3 : std_logic;

    begin
        t0 <= '1';
        t1 <= q0;
        t2 <= q0 and q1;
        t3 <= q2 and t2;

        DD0 : jk_ff_r port map (clk => clk, j => t0, k => t0, r => reset, q => q0);
        DD1 : jk_ff_r port map (clk => clk, j => t1, k => t1, r => reset, q => q1);
        DD2 : jk_ff_r port map (clk => clk, j => t2, k => t2, r => reset, q => q2);
        DD3 : jk_ff_r port map (clk => clk, j => t3, k => t3, r => reset, q => q3);

        count <= q3 and q2 and q1 and q0;

end behav;