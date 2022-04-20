///////////////////////////////////////////////////////////////////////////////
// File Downloaded from Nandland.com
///////////////////////////////////////////////////////////////////////////////
module module_full_adder 
  (
   i_bit1,
   i_bit2,
   i_carry,
   o_sum,
   o_carry
   );

  input  i_bit1;
  input  i_bit2;
  input  i_carry;
  output o_sum;
  output o_carry;

  wire   w_WIRE_1;
  wire   w_WIRE_2;
  wire   w_WIRE_3;

/*      
  assign w_WIRE_1 = i_bit1 ^ i_bit2;
  assign w_WIRE_2 = w_WIRE_1 & i_carry;
  assign w_WIRE_3 = i_bit1 & i_bit2;

  assign o_sum   = w_WIRE_1 ^ i_carry;
  assign o_carry = w_WIRE_2 | w_WIRE_3;
*/

  // FYI: Code above using wires will produce the same results as:
  // assign o_sum   = i_bit1 ^ i_bit2 ^ i_carry;
  // assign o_carry = (i_bit1 ^ i_bit2) & i_carry) | (i_bit1 & i_bit2);

  // Wires are just used to be explicit. 

  // Mapping to use Xilinx UNISIM
  // Not, these components don't require glbl (unlike AND2B1 for example)
  XOR2 xor_i0(w_WIRE_1, i_bit1, i_bit2);
  AND2 and_i1(w_WIRE_2, w_WIRE_1, i_carry);
  AND2 and_i2(w_WIRE_3, i_bit1, i_bit2);
  XOR2 xor_i3(o_sum, w_WIRE_1, i_carry);
  OR2  or_i4(o_carry, w_WIRE_2, w_WIRE_3);
 
endmodule // module_full_adder
