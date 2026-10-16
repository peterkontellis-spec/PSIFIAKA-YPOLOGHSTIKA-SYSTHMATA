-- Lab 1: separately verified combinational gate (PDF pp. 2, 4).
library ieee;
use ieee.std_logic_1164.all;

entity gate_xor is
  port (in0, in1 : in std_logic; outGate : out std_logic);
end entity gate_xor;

architecture rtl of gate_xor is
begin
  outGate <= in0 xor in1;
end architecture rtl;
