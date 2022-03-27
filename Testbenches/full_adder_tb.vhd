LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY full_adder_tb IS
END full_adder_tb;
 
ARCHITECTURE behavior OF full_adder_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT full_adder
    PORT(
         a : IN  std_logic;
         b : IN  std_logic;
         carryIn : IN  std_logic;
         carryOut : OUT  std_logic;
         sum : OUT  std_logic
        );
    END COMPONENT;
    
	signal clk : std_logic := '0';

   --Inputs
   signal a : std_logic := '0';
   signal b : std_logic := '0';
   signal carryIn : std_logic := '0';

 	--Outputs
   signal carryOut : std_logic;
   signal sum : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: full_adder PORT MAP (
          a => a,
          b => b,
          carryIn => carryIn,
          carryOut => carryOut,
          sum => sum
        );

   -- Clock process definitions
   clock : process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process clock;
 

   -- Stimulus process
   stim : process
   begin		
      -- hold reset state for 100 ns.
      wait for clk_period*2;
		a <= '1';
		b <= '0';
		carryIn <= '0';
		wait for clk_period*2;
		a <= '0';
		b <= '1';
		carryIn <= '0';
		wait for clk_period*2;
		a <= '0';
		b <= '0';
		carryIn <= '1';
		wait for clk_period*2;
		a <= '1';
		b <= '1';
		carryIn <= '0';
		wait for clk_period*2;
		a <= '0';
		b <= '1';
		carryIn <= '1';
		wait for clk_period*2;
		a <= '1';
		b <= '0';
		carryIn <= '1';
		wait for clk_period*2;
		a <= '1';
		b <= '1';
		carryIn <= '1';
      wait;
   end process stim;

END;
