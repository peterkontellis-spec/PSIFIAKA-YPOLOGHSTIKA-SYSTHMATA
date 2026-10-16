# Binary reference tables

Prepared from PDF p. 2 and visual inspection of p. 3 Figure 1 on 16 October 2026, before integrated implementation. These tables are expected results, not simulation evidence.

## Circuit 1

| in0 | in1 | outAND | outNAND | outNOT | outNOR | outXOR |
|---|---|---|---|---|---|---|
| 0 | 0 | 0 | 1 | 1 | 1 | 0 |
| 0 | 1 | 0 | 1 | 1 | 0 | 1 |
| 1 | 0 | 0 | 1 | 0 | 0 | 1 |
| 1 | 1 | 1 | 0 | 0 | 0 | 0 |

The separate NOT test needs only `0 -> 1` and `1 -> 0`.

## Circuit 2: required two-output truth table

| in0 | in1 | in2 | nor_result | not_in2 | outCircuit | outCircuitCompl |
|---|---|---|---|---|---|---|
| 0 | 0 | 0 | 1 | 1 | 1 | 0 |
| 0 | 0 | 1 | 1 | 0 | 0 | 1 |
| 0 | 1 | 0 | 0 | 1 | 0 | 1 |
| 0 | 1 | 1 | 0 | 0 | 0 | 1 |
| 1 | 0 | 0 | 0 | 1 | 0 | 1 |
| 1 | 0 | 1 | 0 | 0 | 0 | 1 |
| 1 | 1 | 0 | 0 | 1 | 0 | 1 |
| 1 | 1 | 1 | 0 | 0 | 0 | 1 |

Figure 1 gives `outCircuit = NOT(in0 OR in1) AND NOT(in2)`. The second output is its complement. Although the expression simplifies, the implementation must retain the specified gate hierarchy.

## Multiplexer selection convention

| sel | y |
|---|---|
| 00 | d0 |
| 01 | d1 |
| 10 | d2 |
| 11 | d3 |

Repeat these four selections for each of the 16 combinations of `d3 d2 d1 d0`: 64 cases. A fixed data pattern with four selector changes is insufficient.
