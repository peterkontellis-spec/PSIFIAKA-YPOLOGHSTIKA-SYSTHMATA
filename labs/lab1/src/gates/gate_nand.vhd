-- Lab 1: separately verified combinational gate (PDF pp. 2, 4).
library ieee;
use ieee.std_logic_1164.all;

entity gate_nand is
  port (in0, in1 : in std_logic; outGate : out std_logic);
end entity gate_nand;

architecture rtl of gate_nand is
begin
  outGate <= in0 nand in1;
end architecture rtl;
