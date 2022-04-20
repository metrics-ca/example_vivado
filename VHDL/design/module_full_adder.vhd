-------------------------------------------------------------------------------
-- File Downloaded from Nandland.com
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library unisim;
--use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;


entity module_full_adder is
  port (
    i_bit1  : in std_logic;
    i_bit2  : in std_logic;
    i_carry : in std_logic;
    --
    o_sum   : out std_logic;
    o_carry : out std_logic
    );
end module_full_adder;


architecture rtl of module_full_adder is

  signal w_WIRE_1 : std_logic;
  signal w_WIRE_2 : std_logic;
  signal w_WIRE_3 : std_logic;
  
begin 

  -- w_WIRE_1 <= i_bit1 xor i_bit2;
  -- w_WIRE_2 <= w_WIRE_1 and i_carry;
  -- w_WIRE_3 <= i_bit1 and i_bit2;

  -- o_sum   <= w_WIRE_1 xor i_carry;
  -- o_carry <= w_WIRE_2 or w_WIRE_3;

  -- FYI: Code above using wires will produce the same results as:
  -- o_sum   <= i_bit1 xor i_bit2 xor i_carry;
  -- o_carry <= (i_bit1 xor i_bit2) and i_carry) or (i_bit1 and i_bit2);

  -- Wires are just used to be explicit. 


  -- Mapping to use Xilinx UNISIM
  -- May require glbl

  -- xor_i0 : XOR2 port map (w_WIRE_1, i_bit1, i_bit2);
  xor_i0 : XOR2 port map (
    O => w_WIRE_1, 
    I0 => i_bit1, 
    I1 => i_bit2);
  and_i1 : AND2 port map (w_WIRE_2, w_WIRE_1, i_carry);
  and_i2 : AND2 port map (w_WIRE_3, i_bit1, i_bit2);
  xor_i3 : XOR2 port map (o_sum, w_WIRE_1, i_carry);
  xor_i4 : OR2  port map (o_carry, w_WIRE_2, w_WIRE_3);

end rtl;
