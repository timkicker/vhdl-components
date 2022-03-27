library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter_4bit_arith is
    port(
        clk : in std_logic;
        reset : in std_logic;
        count : out std_logic_vect(3 downto 0)
    );
end counter_4bit_arith;

architecture behav of counter_4bit_arith is
    signal count_uns : unsigned(3 downto 0);
    begin
        cnt : process(clk, reset)
        begin
            if (reset = '1') then
                count_uns <= (others => '0');
            elsif (clk'event and clk = '1') then
                count_uns <= count_uns + 1; -- change "+" in order to count backwards
            else null;
            end if;
        end process cnt;

        count <= std_logic_vector(count_uns);

end behav;
