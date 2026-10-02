# BEND-1D for Python

This package is a Python port of the BEND-1D one-dimensional benchmark signal
library. It contains all 230 signals from the MATLAB source and keeps the same
catalog identifiers, names, category assignments, and recommended sample sizes.

## Install locally

```bash
python -m venv .venv
source .venv/bin/activate       # Windows: .venv\Scripts\activate
python -m pip install -e ".[test]"
```

## Use the library

```python
import numpy as np
import matplotlib.pyplot as plt
import bend1d

x, f, metadata = bend1d.generate("TF001", 1024)
f_clean, details = bend1d.normalize_snr(f, sigma=0.2, target_snr=5)
rng = np.random.default_rng(1234)
y = f_clean + 0.2 * rng.standard_normal(f_clean.size)

plt.plot(x, f_clean, "k", linewidth=2, label="Clean")
plt.plot(x, y, ".", color="0.7", markersize=2, label="Noisy")
plt.legend()
plt.show()
```

Signals can be selected by identifier, catalog name, or full generated name:

```python
bend1d.generate("TF001")
bend1d.generate("Percolation")
bend1d.generate("TF001_Percolation")
```

Inspect the catalog with `bend1d.list_signals()`, optionally passing a category
number, and retrieve one catalog record with `bend1d.info("TF001")`.

## Validate

```bash
pytest
```

The generated implementation layer is derived from the MATLAB signal equations.
Its compatibility runtime is based on SMOP runtime code, distributed under the
MIT license. The public API returns ordinary NumPy arrays, dictionaries, and
pandas DataFrames.
