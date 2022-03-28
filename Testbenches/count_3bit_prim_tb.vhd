library ieee;
use ieee.std_logic_1164.all;

entity count_3bit_prim_tb is
end count_3bit_prim_tb;

architecture behav of count_3bit_prim_tb is
    component count_3bit_prim
    port(
        clk : in std_logic;
        reset : in std_logic;
        count : out std_logic_vector(2 downto 0)
    );
    end component;
    
    signal count : std_logic_vector(2 downto 0);
    signal clk : std_logic := '0';
    signal reset : std_logic := '0';

    constant clk_period : time := 20 ns;

    begin
        uut : count_3bit_prim port map (clk => clk, reset => reset , count => count);

        clock : process
        begin
            clk <= '0';
            wait for clk_period/2;
            clk <= '1';
            wait for clk_period/2;
        end process;

        stim_proc: process
        begin		
            reset <= '1';
            wait for clk_period*2;	
            reset <= '0';		
            wait;
        end process;

end behav;
