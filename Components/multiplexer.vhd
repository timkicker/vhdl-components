library ieee;
use ieee.std_logic_1164.all;

entity multiplexer is
    port(
        a : in std_logic;
        b : in std_logic;
        c : in std_logic;
        d : in std_logic;
        src : in std_logic_vector(1 downto 0);
        q : out std_logic
    );
end multiplexer;

architecture behaviour of multiplexer is
    signal q_temp : std_logic;

begin
    
    process(src, a, b, c, d )
    begin
        case src is
            when "00" => q_temp <= a;
            when "01" => q_temp <= b;
            when "10" => q_temp <= c;
            when "11" => q_temp <= d;
            when others => null;
        end case;
    end process;
    q <= q_temp;
end behaviour;
