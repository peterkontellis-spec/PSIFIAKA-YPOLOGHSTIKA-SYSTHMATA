-- Lab 1: separately verified combinational gate (PDF pp. 2, 4).
library ieee;
use ieee.std_logic_1164.all;

entity gate_nor is
  port (in0, in1 : in std_logic; outGate : out std_logic);
end entity gate_nor;

architecture rtl of gate_nor is
begin
  outGate <= in0 nor in1;
end architecture rtl;
