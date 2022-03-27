library ieee;
use ieee.std_logic_1164.all;

entity demultiplexer is
    port(
        q : in std_logic;
        src : in std_logic;
        a : out std_logic;
        b : out std_logic;
        c : out std_logic;
        d : out std_logic
    );
end demultiplexer;

architecture behav of demultiplexer is
    begin
        process(src, q)
        begin
            case src is
                when "00" => a <= q;
                when "01" => b <= q;
                when "10" => c <= q;
                when "11" => d <= q;
                when others => null;
            end case;
        end process;
end behav;