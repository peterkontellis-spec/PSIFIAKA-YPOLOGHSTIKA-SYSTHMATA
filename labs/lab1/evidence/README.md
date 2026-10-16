# Verification evidence - 16 October 2026

## Completed gate verification

Tool: GHDL 5.1.1, mcode, VHDL-93, local macOS x86_64. Command: `python3 scripts/run_tests.py gates` with `GHDL` set to the local executable. Each simulation used a fresh working library and exactly one testbench. Source/testbench/runner fingerprints are recorded in [gates/SHA256SUMS](gates/SHA256SUMS).

| Gate | Binary cases | Result | Evidence |
|---|---|---|---|
| AND | 4 | PASS | [Log](gates/and/simulation.log), [VCD](gates/and/waveform.vcd) |
| NAND | 4 | PASS | [Log](gates/nand/simulation.log), [VCD](gates/nand/waveform.vcd) |
| NOT | 2 | PASS | [Log](gates/not/simulation.log), [VCD](gates/not/waveform.vcd) |
| NOR | 4 | PASS | [Log](gates/nor/simulation.log), [VCD](gates/nor/waveform.vcd) |
| XOR | 4 | PASS | [Log](gates/xor/simulation.log), [VCD](gates/xor/waveform.vcd) |

18 independent gate input cases passed. Logs contain source paths relative to the repository for portability. VCD files are original simulator output; they are not report screenshots.

The first VHDL-93 run exposed an unbound component. Explicit component-to-entity configuration specifications were added to the testbenches, then the entire gate suite passed. The final evidence above is from the corrected sources.

## Runner failure checks

Performed in temporary copies, leaving the verified project sources unchanged:

- Replaced AND behavior with OR: the independent test failed on input case 1, and the runner returned failure.
- Removed the expected completion report: the runner rejected the simulation despite its normal simulator exit.
- Requested the full lab suite with missing circuit files: the runner returned INCOMPLETE (exit 2), without a success claim.
- Invoked the runner outside the checkout and from a checkout path containing spaces: source resolution and failure detection worked.

## Still required

- Independent mux verification and all three integrated circuit simulations.
- Human-readable waveform screenshots with captions for the report.
- EDA Playground account/workflow and reproduction on the group's examination laptop.
- Report completion, packaging confirmation and verified submission.

These gate results do not establish that Lab 1 is complete.
