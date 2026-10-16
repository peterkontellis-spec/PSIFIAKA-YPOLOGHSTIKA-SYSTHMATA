# ΨΥΣ — Group 41 shared project status

Last updated: 16 October 2026 (Europe/Athens)

## Scope and evidence

Current focus: HMMY451 Lab 1. This status covers ΨΥΣ only.
Requirements and dates below come from the group's supplied master guide; announcements have not been rechecked during status preparation. Course references: [Lab 1 assignment](https://www.eclass.tuc.gr/modules/work/index.php?course=HMMY451&id=18796), [exercise specification](https://www.eclass.tuc.gr/modules/work/index.php?course=HMMY451&get=18796&file_type=1), and [Thursday exam schedule](https://www.eclass.tuc.gr/modules/announcements/index.php?course=HMMY451&an_id=71657).
The GitHub repository was inspected on 16 October 2026 and contained no commits or project files. This initial setup adds documentation only. Implementation progress outside this repository is **unverified**, rather than assumed not started.

## Deadlines

| Milestone | Date / time (Europe/Athens) |
|---|---|
| Submit one group technical report | 19 October 2026, before 11:00 |
| Group 41 mandatory individual examination | 22 October 2026, 12:00–13:00 |
| Arrive at the laboratory | 22 October 2026, by 11:50 |

The master guide records a zero for the exercise if the report deadline is missed.

## Work plan

Use statuses: Unverified, To do, In progress, Blocked, Done. Set an owner when agreed. Mark Done only with supporting evidence.

| Work item | Completion criteria | Status | Owner | Evidence / files |
|---|---|---|---|---|
| Inspect existing project and simulation setup | Identify existing sources, testbenches, tool configuration, and reproducible run instructions | Done | Codex | Initial clone inspected: empty repository; no simulation setup present |
| Circuit 1: logic gates | Separate AND/NAND/NOT/NOR/XOR modules; independent gate testbenches; hierarchical top level; all 4 integrated binary cases verified | Unverified | Unassigned | No implementation files in the initial repository; external work not reported |
| Circuit 2: connected gates | Two-output truth table; 1 NOR, 2 NOT instances, 1 AND; separately verified subcircuits; all 8 integrated cases verified for both outputs | Unverified | Unassigned | No implementation files in the initial repository; external work not reported |
| Circuit 3: 4-to-1 multiplexer | Four 1-bit data inputs; one 1-bit output; 2-bit std_logic_vector selector; when-else; all 64 binary cases verified | Unverified | Unassigned | No implementation files in the initial repository; external work not reported |
| Simulation evidence | Reproducible runs and readable waveforms for independent modules and integrated circuits | Unverified | Unassigned | No implementation files in the initial repository; external work not reported |
| Group report | Group 41 and member details; implementation explanations; diagrams with names/widths; truth table; selector-width explanation; annotated simulation screenshots | Unverified | Unassigned | No implementation files in the initial repository; external work not reported |
| Packaging and submission | Confirm format/naming/source inclusion; upload one group file; reopen and verify submitted file | Unverified | Unassigned | No submission evidence provided |
| Individual exam preparation | Each member can explain and run all circuits; at least one working laptop; report and sources accessible | Unverified | Each member | No preparation results provided |

## Verification record

No repository simulations or tests have been run as part of this status preparation. After each relevant run, record the circuit/module, command or tool configuration, expected case count, result, and evidence path. Never infer a passing result from the presence of a testbench.

## Open questions and blockers

- The repository is linked: [PSIFIAKA-YPOLOGHSTIKA-SYSTHMATA](https://github.com/peterkontellis-spec/PSIFIAKA-YPOLOGHSTIKA-SYSTHMATA).
- No VHDL sources, testbenches, simulation setup or report were present in the initial repository. Any existing work outside the repository needs to be added and reviewed.
- Work ownership and group member details have not been supplied.
- Required report format, filename convention and source-file packaging are not confirmed in the master guide.
- Exact exam questions, permitted notes and live-edit expectations remain unconfirmed.

## Next actions

1. Add any existing group work and establish the simulation tool and reproducible run instructions; reconcile statuses with that evidence.
2. Agree work owners, complete missing circuit implementations and independent tests.
3. Verify integrated circuits, retain waveform evidence and assemble the report.
4. Resolve packaging requirements and submit before the deadline.
5. Rehearse all circuits individually and prepare the group laptop.

## Maintaining this file

Read this status before beginning repository work. After each coherent set of repository changes, update affected work items, verification results, blockers and next actions before handing work back. Include the status update with the corresponding code or report changes. Record actual results and source/date for deadline changes. Do not overwrite a coworker's progress without reconciling it with the repository evidence.

## Change log

| Date | Change | Verification |
|---|---|---|
| 16 October 2026 | Initialized shared STATUS.md, README.md and AGENTS.md for group 41 | Initial repository was empty; documentation reviewed against the supplied master guide; no simulations run or submission verified |
