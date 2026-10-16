# Interfaces and hierarchy

All circuit designs are combinational. Use `ieee.std_logic_1164`; all named scalar ports below are `std_logic`. Use separate files, `component` declarations and named `port map` associations. Read [REQUIREMENTS.md](REQUIREMENTS.md) first. The verified VHDL-93 testbenches use explicit configuration specifications such as `for dut : gate_and use entity work.gate_and(rtl);` to bind components reliably; use equivalent bindings for new instances.

## Verified building blocks

`gate_and`, `gate_nand`, `gate_nor`, `gate_xor`: inputs `in0`, `in1`; output `outGate`.
`gate_not`: input `in0`; output `outGate`.

Each gate has its own file and its own testbench. Gate entity names and internal interfaces are project choices. Circuits 1 and 2 reuse these verified source files; do not create diverging copies.

## Circuit 1: next implementation

File: `labs/lab1/src/circuit1/topLevel_circuit1.vhd`.
Entity: `topLevel_circuit1`.

| Ports | Direction | Width |
|---|---|---|
| in0, in1 | in | 1 each |
| outAND, outNAND, outNOT, outNOR, outXOR | out | 1 each |

Instantiate all five gates. Both inputs feed the two-input gates; only `in0` feeds NOT. Connect each gate output to the identically named function output. Do not flatten the top into five Boolean expressions.
Final testbench: `labs/lab1/tb/tb_circuit1.vhd`, entity `tb_circuit1`; 4 cases, 5 output checks per case. Final completion message: `PASS tb_circuit1: 4 binary cases`.

## Circuit 2: next implementation

File: `labs/lab1/src/circuit2/topLevel_circuit2.vhd`.
Entity: `topLevel_circuit2`.

| Ports | Direction | Width |
|---|---|---|
| in0, in1, in2 | in | 1 each |
| outCircuit, outCircuitCompl | out | 1 each |

Prepare the truth table before connecting gates (already recorded in [TRUTH_TABLES.md](TRUTH_TABLES.md)). Use exactly these instances and nets:

| Instance | Inputs | Output |
|---|---|---|
| u_nor: gate_nor | in0, in1 | nor_result |
| u_not_input: gate_not | in2 | not_in2 |
| u_and: gate_and | nor_result, not_in2 | circuit_result |
| u_not_output: gate_not | circuit_result | outCircuitCompl |

Assign `outCircuit <= circuit_result`. The internal `circuit_result` net permits fanout without reading an `out` port in VHDL-93. Declare `gate_not` once and instantiate it twice. Keep intermediate nets visible in waveforms.
Final testbench: `labs/lab1/tb/tb_circuit2.vhd`, entity `tb_circuit2`; 8 cases, both outputs checked. Message: `PASS tb_circuit2: 8 binary cases`.

## Circuit 3: next implementation

Files: `labs/lab1/src/circuit3/mux4to1.vhd` and `topLevel_mux4to1.vhd`.

| Ports on both modules | Direction | Type / width |
|---|---|---|
| d0, d1, d2, d3 | in | std_logic, 1 bit each |
| sel | in | std_logic_vector(1 downto 0), 2 bits |
| y | out | std_logic, 1 bit |

Implement selection with `when-else` inside entity `mux4to1`. Entity `topLevel_mux4to1` contains one mux component instance and passes through those ports. Test the leaf module separately before adding the wrapper, then test the wrapper with one final testbench. The runner schedules the independent mux test before its integrated run.

Independent testbench: `labs/lab1/tb/tb_mux4to1_unit.vhd`, entity `tb_mux4to1_unit`; 64 cases and completion message `PASS tb_mux4to1_unit: 64 binary cases`.

Map `00 -> d0`, `01 -> d1`, `10 -> d2`, `11 -> d3`. Enumerate all 16 data patterns and all 4 selectors. Document bit order; for a data vector `data(3 downto 0)`, connect `data(0)` to `d0` through `data(3)` to `d3`.
Final testbench: `labs/lab1/tb/tb_mux4to1.vhd`, entity `tb_mux4to1`; message: `PASS tb_mux4to1: 64 binary cases`.

The PDF requires a vector selector and asks for its width; 2 bits is the derived answer. It does not prescribe the chosen data/selector names.
