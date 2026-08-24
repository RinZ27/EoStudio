# Performance tests

Empty on purpose, and that is a gap rather than a pass.

This directory previously held `test_performance_benchmarks.py`, which timed an
empty CPython loop (`_ = i * i`, 100 000 iterations) and asserted the average
iteration cost stayed under 100 ns:

```python
self.assertLess(avg_latency_ns, 100.0, "Latency exceeds production SLA threshold of 100ns")
```

It imported nothing from `eostudio`, so it measured interpreter and host CPU
speed and reported the result as an EoStudio SLA. On this machine it failed,
which is the only reason it was noticed; on a faster machine it would have
passed while still verifying nothing. Its sibling asserted that a list
comprehension managed more than 100 operations per second, which cannot fail.

`run_all_tests.py` still runs `unittest discover` over this directory, so it now
discovers zero tests and reports success. Treat that as **NOT RUN**, not as
passing.

## What belongs here

A benchmark that imports `eostudio` and measures something a user would notice
— project load time, render or export throughput, incremental rebuild latency —
against a budget recorded with the hardware it was measured on. A threshold with
no stated machine is not a budget.
