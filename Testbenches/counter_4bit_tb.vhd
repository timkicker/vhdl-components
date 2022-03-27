library ieee;
use ieee.std_logic_1164.all

entity counter_4bit_tb is
end counter_4bit_tb;

architecture struct of counter_4bit_tb is
    component counter_4bit
    port(
        clk : in std_logic;
        reset : in std_logic;
        count : in std_logic_vector(3 downto 0)
    );
    end component;

    signal clk : std_logic := '0';
    signal reset : std_logic := '0';
    signal count : std_logic_vector(3 downto 0);

    constant clk_period : time := 20 ns;

    begin
        uut : counter_4bit port map (clk => clk, reset => reset , count => count);

        clock : process
        begin
            clk = '0';
            wait for clk_period/2;
            clk = '1';
            wait for clk_period/2;
        end process clk;

        stimuli : process
        begin
            wait for clk_period;
            reset <='1';
            wait;
        end process stimuli;
end struct;
            
            