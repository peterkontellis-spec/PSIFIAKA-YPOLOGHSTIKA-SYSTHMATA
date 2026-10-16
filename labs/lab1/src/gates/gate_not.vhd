-- Lab 1: separately verified combinational gate (PDF pp. 2, 4).
library ieee;
use ieee.std_logic_1164.all;

entity gate_not is
  port (in0 : in std_logic; outGate : out std_logic);
end entity gate_not;

architecture rtl of gate_not is
begin
  outGate <= not in0;
end architecture rtl;
