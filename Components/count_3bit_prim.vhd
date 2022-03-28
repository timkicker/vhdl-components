library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity count_3bit_prim is
    port(
        clk : in std_logic;
        reset : in std_logic;
        count : out std_logic_vector(2 downto 0)
    );
end count_3bit_prim;

architecture behav of count_3bit_prim is
    signal count_uns : unsigned(2 downto 0);
    begin
        process(clk, reset)
        begin
            if (reset = '1') then
                count_uns <= "010";
            elsif(clk'event and clk = '1') then
                case count_uns is
                    when "010" => count_uns <= "011";
                    when "011" => count_uns <= "101";
                    when "101" => count_uns <= "111";
                    when "111" => count_uns <= "010";
                    when others => null;
                end case;
            else null;
            end if;
        end process;
        count <= std_logic_vector(count_uns);
end behav;