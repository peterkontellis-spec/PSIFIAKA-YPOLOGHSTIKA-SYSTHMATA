#!/usr/bin/env python3
"""Run isolated VHDL simulations; incomplete suites never report success."""
import argparse
import os
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[1]
LAB = Path('labs/lab1')
GATES = ('and', 'nand', 'not', 'nor', 'xor')


def gate_case(gate):
    return (f'tb_gate_{gate}', 2 if gate == 'not' else 4,
            [LAB / f'src/gates/gate_{gate}.vhd', LAB / f'tb/gates/tb_gate_{gate}.vhd'])


def circuit_case(number):
    gates = GATES if number == 1 else ('nor', 'not', 'and') if number == 2 else ()
    sources = [LAB / f'src/gates/gate_{g}.vhd' for g in gates]
    if number == 3:
        return ('tb_mux4to1', 64, sources + [LAB / 'src/circuit3/mux4to1.vhd',
                LAB / 'src/circuit3/topLevel_mux4to1.vhd', LAB / 'tb/tb_mux4to1.vhd'])
    return (f'tb_circuit{number}', 4 if number == 1 else 8,
            sources + [LAB / f'src/circuit{number}/topLevel_circuit{number}.vhd',
                       LAB / f'tb/tb_circuit{number}.vhd'])


def run_one(ghdl, case, version):
    top, count, sources = case
    build = ROOT / 'build' / 'lab1'
    build.mkdir(parents=True, exist_ok=True)
    # Fresh library for every run: never accidentally reuse old compiled designs.
    work = Path(tempfile.mkdtemp(prefix=top + '-', dir=build))
    log = work / 'simulation.log'
    marker = f'PASS {top}: {count} binary cases'
    with log.open('w') as stream:
        stream.write(version + '\n')
        for command in ([ghdl, '-a', '--std=93'] + [str(ROOT / p) for p in sources],
                        [ghdl, '-e', '--std=93', top],
                        [ghdl, '-r', '--std=93', top, '--assert-level=error',
                         '--vcd=waveform.vcd']):
            display = ' '.join(str(a).replace(str(ROOT) + '/', '') for a in command[1:])
            stream.write('$ ghdl ' + display + '\n')
            stream.flush()
            try:
                result = subprocess.run(command, cwd=work, text=True,
                                        stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
                                        timeout=30)
            except subprocess.TimeoutExpired:
                stream.write('FAIL: command exceeded 30 seconds\n')
                raise RuntimeError(f'{top}: timed out; see {log.relative_to(ROOT)}')
            stream.write(result.stdout)
            stream.flush()
            if result.returncode:
                raise RuntimeError(f'{top}: simulator failed; see {log.relative_to(ROOT)}\n{result.stdout}')
        if marker not in result.stdout:
            raise RuntimeError(f'{top}: missing completion marker; see {log.relative_to(ROOT)}')
    if not (work / 'waveform.vcd').is_file():
        raise RuntimeError(f'{top}: waveform was not produced')
    print(f'{marker}; evidence: {work.relative_to(ROOT)}')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('target', choices=['gates', 'all', 'circuit1', 'circuit2', 'circuit3'])
    args = parser.parse_args()
    cases = [gate_case(g) for g in GATES] if args.target in ('gates', 'all') else []
    if args.target == 'all':
        cases += [circuit_case(n) for n in (1, 2, 3)]
    elif args.target.startswith('circuit'):
        n = int(args.target[-1])
        # Preserve the lab's verify-subcircuits-first order on every integrated run.
        cases = [gate_case(g) for g in (GATES if n == 1 else ('nor', 'not', 'and') if n == 2 else ())]
        cases.append(circuit_case(n))
    missing = sorted({str(p) for _, _, sources in cases for p in sources if not (ROOT / p).is_file()})
    if missing:
        print('INCOMPLETE: required project files are missing; no successful lab run claimed.', file=sys.stderr)
        print('\n'.join(missing), file=sys.stderr)
        return 2
    ghdl = shutil.which(os.environ.get('GHDL', 'ghdl'))
    if not ghdl:
        print('GHDL not found. Install GHDL or set GHDL to its executable; see docs/lab1/SIMULATION.md.', file=sys.stderr)
        return 2
    try:
        version_result = subprocess.run([ghdl, '--version'], text=True, stdout=subprocess.PIPE,
                                        stderr=subprocess.STDOUT, check=True, timeout=10)
        version = '\n'.join(version_result.stdout.splitlines()[:3])
        for case in cases:
            run_one(ghdl, case, version)
    except (OSError, RuntimeError, subprocess.SubprocessError) as error:
        print(f'FAIL: {error}', file=sys.stderr)
        return 1
    print(f'PASS: {args.target} ({len(cases)} independent simulations).')
    if args.target == 'gates':
        print('Gate verification only; integrated circuits and report are not complete.')
    return 0


if __name__ == '__main__':
    sys.exit(main())
