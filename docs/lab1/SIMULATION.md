# Simulation workflow

Read [STATUS.md](../../STATUS.md), [REQUIREMENTS.md](REQUIREMENTS.md) and the full exercise before changing sources.

## Local verification

Prerequisites: Python 3.8 or newer and a working [GHDL installation](https://ghdl.github.io/ghdl/). All design and stimulus logic is VHDL; Python only invokes GHDL and checks its result.

From the repository root:

```sh
python3 scripts/run_tests.py gates
# Equivalent: make test-gates
```

If GHDL is not on PATH, set `GHDL` to its executable path for the command. The repository does not install software or depend on a particular user's local path.

The runner analyzes and elaborates VHDL-93, then simulates with assertion failures treated as errors. Each gate has its own testbench and fresh working library. Inputs settle for 10 ns before checking against explicit truth-table constants. The 10 ns interval is stimulus spacing, not a modeled gate delay or a clock.

For each run, `build/lab1/<testbench>-<unique-id>/` holds `simulation.log` and `waveform.vcd`. Preserve useful evidence under `labs/lab1/evidence/` with a description of the source version and result. Build folders are ignored by Git. A timeout, missing completion message, missing file or assertion failure is a failed/incomplete run, never a pass.

After implementing the remaining designs and testbenches:

```sh
python3 scripts/run_tests.py circuit1
python3 scripts/run_tests.py circuit2
python3 scripts/run_tests.py circuit3
python3 scripts/run_tests.py all
```

The integrated targets currently exit with `INCOMPLETE` because their files do not yet exist. `gates` passing only establishes the reusable gate foundation. Before integration runs, the runner reruns the appropriate subcircuit tests; the mux target includes its own independent leaf test before its wrapper test.

## EDA Playground workflow

The PDF asks each student to create an [EDA Playground](https://www.edaplayground.com/) account. Account setup and an actual browser simulation remain pending.

1. Select a VHDL simulator supporting the repository's VHDL-93 sources.
2. For an independent gate simulation, use that gate's source and matching `tb_gate_*.vhd` only. Select its testbench entity as the simulation top.
3. Run each gate independently and check all expected cases before creating integrated connections.
4. For a completed circuit, include its required gate/design files and top-level module. Remove the independent gate testbenches from the active project and use only the circuit's final testbench. Keep the originals saved in Git.
5. Inspect inputs, outputs and relevant internal signals in the waveform viewer. Check expected truth-table results. Record the tool/settings used.
6. Capture readable screenshots and write captions explaining them. A console PASS or raw VCD file alone does not replace the report's screenshot evidence.

The file lists in `scripts/run_tests.py` document the intended compilation order. Do not combine all testbench files into one active simulation. The EDA steps have been documented from the lab's workflow but have not yet been executed in the browser.

## Before claiming completion

- Confirm each required subcircuit and integrated test actually ran.
- Check all output signals for every binary case (not just complements agreeing).
- Reproduce the results on the laptop the group will bring.
- Add evidence paths, tool/version, results and remaining issues to `STATUS.md`.
