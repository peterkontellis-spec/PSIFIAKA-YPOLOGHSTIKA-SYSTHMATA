-- Independent exhaustive binary truth-table test; one DUT, one testbench.
library ieee;
use ieee.std_logic_1164.all;

entity tb_gate_nand is
end entity tb_gate_nand;

architecture test of tb_gate_nand is
  component gate_nand is
    port (in0, in1 : in std_logic; outGate : out std_logic);
  end component;
  for dut : gate_nand use entity work.gate_nand(rtl);
  signal in0, in1, actual : std_logic;
  type case_t is record
    a, b, y : std_logic;
  end record;
  type cases_t is array (natural range <>) of case_t;
  constant cases : cases_t := (
    ('0', '0', '1'),
    ('0', '1', '1'),
    ('1', '0', '1'),
    ('1', '1', '0')
  );
begin
  dut : gate_nand port map (in0 => in0, in1 => in1, outGate => actual);
  stimulus : process
  begin
    for i in cases'range loop
      in0 <= cases(i).a;
      in1 <= cases(i).b;
      wait for 10 ns;
      assert actual = cases(i).y
        report "gate_nand: wrong output at binary case " & integer'image(i)
        severity failure;
    end loop;
    report "PASS tb_gate_nand: 4 binary cases" severity note;
    wait;
  end process;
end architecture test;
