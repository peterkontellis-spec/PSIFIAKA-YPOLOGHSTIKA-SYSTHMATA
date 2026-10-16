# ΨΥΣ repository workflow

- Keep this repository focused on ΨΥΣ / HMMY451, group 41; keep DSP work separate.
- Read the root `STATUS.md` before inspecting or changing project work.
- After each coherent set of repository changes, update `STATUS.md` before handing work back. Include the status update in the same commit or pull request as the changes whenever practical.
- Record affected work items, owners when agreed, actual verification results and evidence paths, blockers, next actions, and a dated change-log entry. Use Europe/Athens for dates and times.
- Mark work Done only with supporting evidence. Distinguish implemented code from passing simulations, a drafted report from submission, and repository contents from unreported work elsewhere.
- Record sources and dates for changed requirements or deadlines. Preserve meaningful history and reconcile coworkers' updates; do not overwrite them blindly.
- Run checks relevant to changed circuits or testbenches and record results. For documentation-only changes, review accuracy and links; do not claim simulations were run.

## Lab 1 constraints

- Read `docs/lab1/REQUIREMENTS.md` and `INTERFACES.md` before modifying Lab 1. Preserve exact PDF port names for Circuits 1/2.
- Verify each subcircuit separately before integrating it. Use `component` and `port map`, separate `.vhd` files and exactly one active testbench per run. Keep independent testbench sources in Git.
- Keep the required structural gate hierarchy; do not replace Circuit 2's connections with a flattened expression. Implement mux4to1 using `when-else` and a vector selector.
- Use explicit component binding specifications when required for VHDL-93; the existing gate testbenches demonstrate the tested pattern.
- Run `python3 scripts/run_tests.py gates` after gate changes and the relevant integrated targets when present. An INCOMPLETE result is not a pass. Refresh curated evidence and source hashes after relevant changes.
- Announcements retained from the master guide are not newly verified live announcements; preserve that distinction.
