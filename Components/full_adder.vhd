library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
    port(
        a : in std_logic;
        b : in std_logic;
        carryIn : in std_logic;
        carryOut : out std_logic;
        sum : out std_logic
    );
end full_adder;

architecture behav of full_adder is

-- intern signals for carryOut
signal aAndB : std_logic;   
signal aAndCIn : std_logic;
signal bAndCIn : std_logic;
signal allSig : std_logic;

-- intern signals for sum
signal allXor : std_logic;



begin
    -- declare intern signals
    aAndB <= a and b;
    aAndCIn <= a and carryIn;
    bAndCIn <= b and carryIn;
    allSig <= a and b and carryIn;
    allXor <= a xor b xor carryIn;

    -- cases for sum and carryOut
    carryOut <= aAndB or aAndCin or bAndCin or allSig;
    sum <= allSig or allXor;
    
end behav;

