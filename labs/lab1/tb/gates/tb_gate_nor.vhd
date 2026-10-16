-- Independent exhaustive binary truth-table test; one DUT, one testbench.
library ieee;
use ieee.std_logic_1164.all;

entity tb_gate_nor is
end entity tb_gate_nor;

architecture test of tb_gate_nor is
  component gate_nor is
    port (in0, in1 : in std_logic; outGate : out std_logic);
  end component;
  for dut : gate_nor use entity work.gate_nor(rtl);
  signal in0, in1, actual : std_logic;
  type case_t is record
    a, b, y : std_logic;
  end record;
  type cases_t is array (natural range <>) of case_t;
  constant cases : cases_t := (
    ('0', '0', '1'),
    ('0', '1', '0'),
    ('1', '0', '0'),
    ('1', '1', '0')
  );
begin
  dut : gate_nor port map (in0 => in0, in1 => in1, outGate => actual);
  stimulus : process
  begin
    for i in cases'range loop
      in0 <= cases(i).a;
      in1 <= cases(i).b;
      wait for 10 ns;
      assert actual = cases(i).y
        report "gate_nor: wrong output at binary case " & integer'image(i)
        severity failure;
    end loop;
    report "PASS tb_gate_nor: 4 binary cases" severity note;
    wait;
  end process;
end architecture test;
