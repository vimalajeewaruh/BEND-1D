# Python Code

The Python implementation provides deterministic generators for all **230
BEND-1D signals**. Each signal is defined on the unit interval and is returned
in its native scale. Apply power–SNR normalization only when constructing a
denoising experiment.

[Browse Signals](../signals/index.md) ·
[MATLAB Code](matlab.md) ·
[Golden Rules](Rules.md) ·
[Return Home](../)

---

## Requirements

- Python 3.9 or later is recommended.
- Required packages: [NumPy](https://numpy.org/) and
  [Matplotlib](https://matplotlib.org/).
- Some signals may also use [SciPy](https://scipy.org/) for special functions
  or numerical integration.

Install the common dependencies with:

```bash
python -m pip install numpy scipy matplotlib
```

## Suggested Repository Structure

```text
code/
└── python/
    ├── test_function_library001_016.py
    ├── test_function_library017_026.py
    ├── test_function_library027_042.py
    ├── test_function_library043_058.py
    ├── test_function_library059_070.py
    ├── test_function_library071_100.py
    ├── test_function_library101_125.py
    ├── test_function_library126_155.py
    ├── test_function_library156_180.py
    ├── test_function_library181_230.py
    └── normalization.py
```

You may keep the functions in ten category modules or place each signal in a
separate module. Whichever arrangement you choose, retain the signal identifier
and name in every filename, function docstring, and plot title.

## Source Blocks

| Category | Signal range | Suggested Python module |
|---|---:|---|
| Category 1 | 1–16 | `test_function_library001_016.py` |
| Category 2 | 17–26 | `test_function_library017_026.py` |
| Category 3 | 27–42 | `test_function_library027_042.py` |
| Category 4 | 43–58 | `test_function_library043_058.py` |
| Category 5 | 59–70 | `test_function_library059_070.py` |
| Category 6 | 71–100 | `test_function_library071_100.py` |
| Category 7 | 101–125 | `test_function_library101_125.py` |
| Category 8 | 126–155 | `test_function_library126_155.py` |
| Category 9 | 156–180 | `test_function_library156_180.py` |
| Category 10 | 181–230 | `test_function_library181_230.py` |

[Browse the complete Python source on GitHub][python-source]

## Quick Start

The following example generates **Planck** in its native scale.

```python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0.0, 1.0, N)

wavelength = 0.08 + 0.92 * x
f = wavelength**-5 / (np.exp(2.5 / wavelength) - 1.0)

fig, ax = plt.subplots()
ax.plot(x, f, linewidth=1.5)
ax.set(xlabel="x", ylabel="f(x)", title="TF002 Planck")
ax.grid(True)
plt.show()
```

## Common Power–SNR Normalization
```python
import numpy as np

def bend_rescale_snr(f, sigma, target_snr):
    """Rescale centered signal power to a target linear SNR."""
    f = np.asarray(f, dtype=float)
    f_mean = np.mean(f)
    centered = f - f_mean
    signal_power = np.mean(centered**2)

    if signal_power <= 0:
        raise ValueError("The signal must have a nonconstant component.")

    scale = np.sqrt(target_snr * sigma**2 / signal_power)
    return f_mean + scale * centered
```

Example use:

```python
sigma = 0.20
target_snr = 4.0                 # linear power ratio
f_scaled = bend_rescale_snr(f, sigma, target_snr)

rng = np.random.default_rng(2026)
y = f_scaled + rng.normal(0.0, sigma, size=f_scaled.shape)
```

If the target is specified in decibels, convert it first:

```python
target_snr_db = 6.0
target_snr = 10.0 ** (target_snr_db / 10.0)
```

## Reproducible Experiments

For each reported experiment, record:

- the signal identifier and name;
- the BEND-1D version or Git commit;
- the Python and dependency versions;
- the sample size `N` and sampling grid;
- all nondefault signal parameters;
- the noise model, noise standard deviation, and SNR convention;
- the random-number seed and number of Monte Carlo replications; and
- the denoising method and its tuning parameters.

Within each Monte Carlo replication, give every denoising method the **same noisy realization**. See the [Golden Rules](/Rules.md) for the full
evaluation protocol.

## Signal-Level Implementations

Every page in the [signal catalog](../signals/index.md) contains a standalone Python implementation for that signal. These examples are useful when you need only
one function; the category modules are more convenient for generating a complete benchmark block.

## Reporting Problems

If a Python implementation produces an unexpected result, report the signal
ID, Python and dependency versions, sample size, parameter values, and a minimal
script in the [repository issue tracker][issues].

---

[← Return to BEND-1D](../) · [MATLAB Code →](matlab.md)

<!-- Replace YOUR-USERNAME/YOUR-REPOSITORY in the links below. -->
[python-source]: https://github.com/vimalajeewaruh/BEND-1D/tree/main/code/python
[issues]: https://github.com/vimalajeewaruh/BEND-1D/issues
