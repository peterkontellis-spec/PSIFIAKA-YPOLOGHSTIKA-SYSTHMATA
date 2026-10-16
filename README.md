# ΨΥΣ - Digital Computer Systems

Shared HMMY451 laboratory projects for **group 41**, academic year 2026-2027. Current focus: Lab 1.

Read [STATUS.md](STATUS.md) before work and update it after each set of changes. [AGENTS.md](AGENTS.md) records the same workflow for coding agents.

## Start here

1. Read the full original lab PDF and the [source-backed requirements](docs/lab1/REQUIREMENTS.md).
2. Follow the [interface and hierarchy plan](docs/lab1/INTERFACES.md) and [truth tables](docs/lab1/TRUTH_TABLES.md).
3. Use the [simulation instructions](docs/lab1/SIMULATION.md) to run independent gates before integration.
4. Keep evidence and build the [group report](labs/lab1/report/OUTLINE.md).

## Current foundation

- Five separate gate modules with five independent exhaustive VHDL testbenches: **18 binary cases passed**.
- Three circuit workspaces, exact interface plans, and the required Circuit 2 truth table prepared before integration.
- A local test runner with isolated runs and recorded logs/waveforms; [verification evidence](labs/lab1/evidence/README.md).
- Requirement checklist, report outline and shared work status.

Integrated circuits, mux implementation and final report remain to do. The original PDF was reviewed directly; live eClass announcement dates were retained from the supplied master guide. See [source provenance](docs/lab1/SOURCES.md).

## Run

Requires Python 3.8+ and GHDL on PATH (or the `GHDL` executable override):

```sh
python3 scripts/run_tests.py gates
```

`python3 scripts/run_tests.py all` intentionally reports INCOMPLETE until the remaining designs/testbenches exist. Gate success is not whole-lab completion.

## Layout

| Path | Purpose |
|---|---|
| `docs/lab1/` | Requirements, source provenance, interfaces, truth tables, simulation guide |
| `labs/lab1/src/gates/` | Verified reusable combinational gates |
| `labs/lab1/src/circuit1/` ... `circuit3/` | Integrated circuit implementation workspaces |
| `labs/lab1/tb/` | Independent and future integrated VHDL testbenches |
| `labs/lab1/evidence/` | Curated verification logs and waveforms |
| `labs/lab1/report/` | Technical report outline and future report work |
| `scripts/` | Simulation launcher; all circuit/stimulus logic remains VHDL |
| `build/` | Generated, ignored simulator work folders |

## Group 41 dates

Report: **19 October 2026 before 11:00**. Examination: **22 October, 12:00-13:00**, arrive by **11:50**. All times Europe/Athens. Check newer announcements before submission and attendance.
