library ieee;
use ieee.std_logic_1164.all;

entity multiplexer_tb is
end multiplexer_tb;

architecture behav of multiplexer_tb is
    signal a : std_logic := '1';
    signal b : std_logic := '0';
    signal c : std_logic := '1';
    signal d : std_logic := '0';

    signal src : std_logic_vector(1 downto 0) := "00";

    signal q : std_logic;

    signal clk : std_logic := '0';
    constant clk_period : time := 20 ns;

    component multiplexer is
        port(
            a : in std_logic;
            b : in std_logic;
            c : in std_logic;
            d : in std_logic;
            src : in std_logic_vector(1 downto 0);
            q : out std_logic  
        );
    end component;

    begin
        uut : multiplexer port map (a => a, b => b , c => c, d => d, src => src , q => q);

        clock : process
        begin
            clk <= '0';
            wait for clk_period/2;
            clk <= '1';
            wait for clk_period/2;
        end process clock;

        stimuli : process
        begin
            src <= "00";
            wait for clk_period;
            src <= "01";
            wait for clk_period;
            src <= "10";
            wait for clk_period;
            src <= "11";
            wait for clk_period;
        end process stimuli;
end behav;

    