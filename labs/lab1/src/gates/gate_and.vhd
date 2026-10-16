-- Lab 1: separately verified combinational gate (PDF pp. 2, 4).
library ieee;
use ieee.std_logic_1164.all;

entity gate_and is
  port (in0, in1 : in std_logic; outGate : out std_logic);
end entity gate_and;

architecture rtl of gate_and is
begin
  outGate <= in0 and in1;
end architecture rtl;
