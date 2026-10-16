# Lab 1 requirements and acceptance checks

Reviewed on 16 October 2026 against all four pages of the original exercise PDF, including visual inspection of Figure 1, and both pages of the laboratory regulations. See [SOURCES.md](SOURCES.md) for provenance. The user confirmed that no pre-existing work exists.

This checklist maps requirements to planned files. A planned path does not mean the implementation exists. See [STATUS.md](../../STATUS.md) for actual progress.

| ID | Requirement | Source | Project implementation / acceptance |
|---|---|---|---|
| R01 | Describe circuits, connections and testbenches entirely in VHDL | PDF p. 1 | `labs/lab1/src/` and `labs/lab1/tb/`; Python only launches the simulator |
| R02 | Synthesizable circuit descriptions; nonsynthesizable testbenches | PDF p. 1 | Separate `src` and `tb`; waits/assertions for stimulus stay in testbenches |
| R03 | Circuit 1 exact port names and 1-bit widths | PDF p. 2, Table 1 | `topLevel_circuit1`: `in0`, `in1`, `outAND`, `outNAND`, `outNOT`, `outNOR`, `outXOR` |
| R04 | Circuit 1 functions, with NOT applied to in0 | PDF p. 2 | Five separate gate files; gate instances in the top level; verify all outputs |
| R05 | Verify every gate separately before connecting it | PDF pp. 2, 4 note 6 | Five independent gate testbenches; run `gates` before integration |
| R06 | Circuit 2 exact ports and gate topology | PDF pp. 2-3, Table 2 and Figure 1 | `in0`, `in1`, `in2`, `outCircuit`, `outCircuitCompl`, all 1 bit; NOR + NOT feed AND; second NOT complements AND output |
| R07 | Create Circuit 2's two-output truth table first | PDF p. 3 | [TRUTH_TABLES.md](TRUTH_TABLES.md), prepared before integration code |
| R08 | Multiplexer named mux4to1, 1-bit data ports, when-else, vector selector; explain width | PDF p. 3 | `mux4to1.vhd`; four scalar inputs, scalar output, `std_logic_vector(1 downto 0)`; two bits encode four selections |
| R09 | All exercise circuits are combinational | PDF p. 3 note 1 | No clock, register or state-machine additions |
| R10 | Multiple .vhd files; higher-level module contains lower-level instances, even if not interconnected | PDF p. 3 notes 2-3 | Separate gates; structural tops for Circuits 1/2; a top-level wrapper for the mux |
| R11 | Use component and port map; declare NOT once and instantiate twice in Circuit 2 | PDF pp. 3-4 note 4 | Named port maps; one NOT component declaration with two instance labels |
| R12 | Connect the final testbench to topLevel; make observed signals available | PDF p. 4 note 5 | Dedicated circuit tops; named internal nets visible in hierarchy and captured waveforms |
| R13 | Exhaustive separate and integrated simulation | PDF p. 4 note 6 and mux instruction p. 3 | NOT: 2 cases; two-input gate: 4; Circuit 1: 4; Circuit 2: 8; mux: 64 (derived binary counts) |
| R14 | Remove component testbenches from integrated simulation; one testbench per circuit run | PDF p. 4 note 7 | Runner compiles only one selected testbench in a fresh working library; saved independent testbench files remain in version control |
| R15 | Create an EDA Playground account; alternative working tools allowed | PDF p. 4 note 8; pp. 1-2 | Account setup remains a group task; local GHDL validation complements the documented EDA workflow |
| R16 | Groups of three; individual in-person examination; report before exam; working laptop | Regulations pp. 1-2 | Group 41; each member rehearses the whole lab; laptop and upload checklists in report outline/status |

## Additional report and schedule information

The supplied master guide records the report deadline (19 October, 11:00), group 41's exam window (22 October, 12:00-13:00), screenshots and diagram requirements. These come from eClass assignment/announcements, not the exercise PDF. The live links could not be reread during this setup. Preserve those dates but recheck announcements before submission.

Report format, filename convention and whether source files belong in the uploaded package remain unresolved. Do not infer that a ZIP is required from the single-file upload form.

## Project choices, not extra lab requirements

- VHDL-93 compatibility, descriptive top-level names, named port maps, 10 ns stimulus spacing, automated assertions and a local GHDL runner.
- Mux data ports `d0` through `d3`, selector `sel`, output `y`, and mapping `00 -> d0` through `11 -> d3`; the PDF does not prescribe these names or mapping labels.
- Separate run folders, logs, optional VCD evidence, report organization and this checklist.
- A mux wrapper applies the general top-level notes conservatively. It does not replace the `when-else` implementation inside `mux4to1`.

Never describe these choices as mandatory wording from the PDF. Passing binary tests does not establish behavior for nonbinary `std_logic` values; define such behavior explicitly if added.
