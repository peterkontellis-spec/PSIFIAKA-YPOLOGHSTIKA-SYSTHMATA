# Testbenches

`gates/` contains one independent exhaustive VHDL testbench per gate. Each run compiles only that gate and its own testbench in a separate working library.

Next add `tb_circuit1.vhd` (4 cases), `tb_circuit2.vhd` (8 cases, both outputs) and `tb_mux4to1.vhd` (64 data/selector cases), following the interface plan. Each must connect to its circuit's top-level module with `component` and `port map`.

Use a finite stimulus process with settling time and an assertion for each output on every case. End with a unique PASS report and `wait;`. A PASS message must occur only after all assertions and all cases. Do not add clocks to these combinational circuits. Binary coverage counts are derived from the specified ports, not an additional PDF requirement.
