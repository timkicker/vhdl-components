library ieee;
use ieee.std_logic_1164.all;

entity half_adder_tb is
end half_adder_tb;

architecture behav of half_adder_tb is
    component half_adder
    port(
        a : in std_logic;
        b : in std_logic;
        sum : out std_logic;
        carry : out std_logic
    );
    end component;

    signal a : std_logic := '0';
    signal b : std_logic := '0';
    signal sum : std_logic;
    signal carry : std_logic;

    signal clk : std_logic := '0';
    constant clk_period : time := 20 ns;

    begin
        uut : half_adder port map (a => a, b => b, sum => sum, carry => carry);

        clock : process
        begin
            clk <= '0';
            wait for clk_period/2;
            clk <= '1';
            wait for clk_period/2;
        end process clock;

        stimuli : process
        begin
            a <= '0';
            b <= '0';
            wait for clk_period;
            a <= '1';
            b <= '0';
            wait for clk_period;
            a <= '0';
            b <= '1';
            wait for clk_period;
            a <= '1';
            b <= '1';
            wait;
        end process stimuli;
end behav;