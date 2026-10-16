.PHONY: test-gates test-all
PYTHON ?= python3

test-gates:
	$(PYTHON) scripts/run_tests.py gates

test-all:
	$(PYTHON) scripts/run_tests.py all
