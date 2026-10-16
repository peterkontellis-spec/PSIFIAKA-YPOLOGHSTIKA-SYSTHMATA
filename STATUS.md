# ΨΥΣ - Group 41 shared project status

Last updated: 16 October 2026 (Europe/Athens)

## Scope and evidence

Current focus: HMMY451 Lab 1. The user confirmed on 16 October that there is no existing work to import. The repository now contains the project foundations and verified gate modules; the full lab is not complete.

All four pages of the original exercise PDF, including Figure 1, and both pages of the regulations were reread. The exercise was also inspected visually. [Source record](docs/lab1/SOURCES.md) distinguishes direct PDF review from the announcement information carried forward from the user's master guide; live eClass retrieval was unsuccessful during this setup.

## Deadlines

| Milestone | Date / time (Europe/Athens) |
|---|---|
| Submit one group technical report | 19 October 2026, before 11:00 |
| Group 41 mandatory individual examination | 22 October 2026, 12:00-13:00 |
| Arrive at the laboratory | 22 October 2026, by 11:50 |

The master guide records a zero for the exercise if the report deadline is missed. Recheck newer announcements before submission.

## Work plan

Statuses: To do, In progress, Blocked, Done, Unverified. Owners remain unassigned unless agreed. Done requires evidence.

| Work item | Status | Owner | Evidence / remaining work |
|---|---|---|---|
| Read original specification and regulations | Done | Codex | [Requirement map](docs/lab1/REQUIREMENTS.md), [source record](docs/lab1/SOURCES.md) |
| Project structure and local simulation workflow | Done | Codex | [Runner](scripts/run_tests.py), [workflow](docs/lab1/SIMULATION.md), isolated gate runs verified |
| Five gate modules and independent tests | Done | Codex | AND/NAND/NOT/NOR/XOR; 18 cases passed; [logs, VCDs and source hashes](labs/lab1/evidence/README.md) |
| Circuit 1: hierarchical integration | To do | Unassigned | Gate building blocks ready; connect exact ports and test 4 combinations / 5 outputs |
| Circuit 2: two-output truth table | Done | Codex | [Truth table](docs/lab1/TRUTH_TABLES.md), prepared before integration |
| Circuit 2: hierarchical integration | To do | Unassigned | Verified NOR/NOT/AND available; 2 NOT instances; test both outputs on 8 combinations |
| Circuit 3: mux and top-level wrapper | To do | Unassigned | when-else, vector selector; independent leaf test before wrapper; 64 cases each |
| Integrated testbenches | To do | Unassigned | Exact interfaces and planned file names in [INTERFACES.md](docs/lab1/INTERFACES.md); full suite currently rejects missing files |
| EDA Playground account and browser workflow | To do | Each member | PDF account requirement; documented workflow has not yet been executed in browser |
| Report waveform screenshots and block diagrams | To do | Unassigned | Gate logs/VCDs available; screenshots, integrated evidence and diagrams still needed |
| Group report | To do | Unassigned | [Outline](labs/lab1/report/OUTLINE.md) ready; names/IDs, explanations and actual final results pending |
| Packaging and submission | To do | Unassigned | Format/name/source inclusion unconfirmed; no upload performed |
| Individual exam preparation | To do | Each member | Rehearse entire lab; prepare at least one tested group laptop |

## Verification record

- GHDL 5.1.1 mcode, VHDL-93: five independent simulations, 18 binary cases passed. [Evidence](labs/lab1/evidence/README.md).
- Explicit component bindings fixed the initially detected VHDL-93 binding issue; final gate suite passed after the fix.
- Deliberately incorrect AND implementation was detected in a temporary copy.
- Missing completion marker was rejected; full-lab target correctly reports INCOMPLETE while circuit files are absent.
- Runner works outside the repository directory and with spaces in the checkout path.
- No integrated circuit simulation, report screenshot, browser simulation or submission is claimed.

## Open questions and blockers

- Member names, student IDs and work ownership have not been supplied.
- Required report extension, filename convention and source-file packaging remain unconfirmed.
- New eClass announcements could not be checked through the web tool during this setup; dates above retain the master guide's provenance.
- Exact exam questions, permitted materials and live-edit expectations remain unconfirmed.

## Next actions

1. Implement Circuit 1's structural top level and final exhaustive testbench using the verified gates.
2. Implement Circuit 2 exactly as Figure 1 and its prewritten truth table; check both outputs in all eight cases.
3. Implement mux4to1 with when-else, verify it independently, then its top-level wrapper.
4. Run every independent/integrated test, inspect waveforms and collect explained screenshots/diagrams.
5. Complete the group report, confirm packaging and submit before the deadline; rehearse on the examination laptop.

## Maintaining this file

Read before work. After each coherent set of repository changes, update affected work items, verification, blockers, next actions and the dated log; include the update with the code/report changes. Record actual results and evidence paths. Preserve coworkers' updates and source/date for any changed requirements. Revalidate affected evidence after source changes.

## Change log

| Date | Change | Verification |
|---|---|---|
| 16 October 2026 | Initialized shared STATUS.md, README.md and AGENTS.md for group 41 | Initial repository was empty; documentation reviewed against the supplied master guide; no simulations run or submission verified |
| 16 October 2026 | Established PDF-reviewed project foundations; user confirmed no prior work. Added five gates, independent tests, runner, interfaces/truth tables, report outline and verification evidence. | Original 4-page exercise and 2-page regulations read; 18 gate cases passed; negative/failure checks passed. Integrated circuits/report remain to do. |
