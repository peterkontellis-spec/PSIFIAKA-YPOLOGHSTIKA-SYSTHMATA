-- Independent exhaustive binary truth-table test; one DUT, one testbench.
library ieee;
use ieee.std_logic_1164.all;

entity tb_gate_not is
end entity tb_gate_not;

architecture test of tb_gate_not is
  component gate_not is
    port (in0 : in std_logic; outGate : out std_logic);
  end component;
  for dut : gate_not use entity work.gate_not(rtl);
  signal in0, actual : std_logic;
  type case_t is record
    a, y : std_logic;
  end record;
  type cases_t is array (natural range <>) of case_t;
  constant cases : cases_t := (
    ('0', '1'),
    ('1', '0')
  );
begin
  dut : gate_not port map (in0 => in0, outGate => actual);
  stimulus : process
  begin
    for i in cases'range loop
      in0 <= cases(i).a;
      wait for 10 ns;
      assert actual = cases(i).y
        report "gate_not: wrong output at binary case " & integer'image(i)
        severity failure;
    end loop;
    report "PASS tb_gate_not: 2 binary cases" severity note;
    wait;
  end process;
end architecture test;
