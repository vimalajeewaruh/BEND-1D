# BEND-1D

## Benchmark for Evaluation of Nonlinear Denoising in One Dimension

A reproducible library of **230 one-dimensional test signals** representing
different smoothness, oscillation, discontinuity, localization, multiscale,
transient, and singularity structures.

[Get Started](getting-started.html) ·
[Browse All Signals](docs/index.md) ·
[Golden Rules](docs/Rules.md) ·
[MATLAB Code][matlab-code] ·
[Python Code][python-code] ·
[View on GitHub][repository]

---

## About the Library

BEND-1D is designed for reproducible comparison of signal denoising and
smoothing methods. It contains deterministic signals with known noiseless
truths, allowing reconstruction error and morphology preservation to be
evaluated directly.

The library includes smooth curves, jumps, cusps, derivative singularities,
localized oscillations, chirps, repeated impacts, pulse trains, spectral
peaks, regime changes, multiscale transients, and deliberately adversarial
signals. Many functions are motivated by recognizable scientific,
engineering, biomedical, environmental, and economic measurements.

## Quick Access

| Resource | Contents |
|---|---|
| [Getting Started](getting-started.html) | Installation, folder structure, and first example |
| [Complete Signal Catalog](docs/signals/) | All 230 signals organized into ten categories |
| [Golden Rules](docs/Rules.md) | SNR normalization, fair aggregation, and reporting principles |
| [Denoising Experiments](denoising-experiments.html) | Recommended simulation and evaluation workflow |
| [MATLAB Code][matlab-code] | MATLAB implementations and figure-generation scripts |
| [Python Code][python-code] | Reproducible Python implementations |
| [Citation](citation.html) | How to cite BEND-1D |
| [License](license.html) | Terms for using and redistributing the library |
| [Contributing](contributing.html) | Reporting issues and proposing new signals |

## Browse by Category

| Category | Signal range | Main emphasis |
|---|---:|---|
| [Category 1](docs/docs/signals/Category1/index.md) | 1–16 | Foundational application-oriented morphologies, including critical onsets, spectra, impacts, oscillations, and structural changes |
| [Category 2](docs/signals/Category2/index.md) | 17–26 |  Additional application-oriented signals with local defects, transients, multiscale peaks, and asymmetric behavior |
| [Category 3](docs/signals/Category3/index.md) | 27–42 |  Physiological, mechanical, oceanographic, acoustic, and atmospheric measurement structures |
| [Category 4](docs/signals/Category4/) | 43–58 |  Measurement-science signals from production, environmental monitoring, spectroscopy, seismology, and analytical instruments |
| [Category 5](docs/signals/Category5/index.md) | 59–70 |  Cross-disciplinary smoothing problems with sharp peaks, shoulders, notches, transitions, and thin-layer anomalies |
| [Category 6](docs/signals/Category6/index.md) | 71–100 |  Modern cross-disciplinary signals from engineering, computing, astronomy, economics, acoustics, geology, and neuroscience |
| [Category 7](docs/signals/Category7/index.md) | 101–125 |  Contemporary applications and artificial stress tests involving quantum systems, fusion, genomics, AI infrastructure, and weak hidden features |
| [Category 8](docs/signals/Category8/index.md) | 126–155 |  Modern sensing signals and adversarial MishMash constructions with incompatible local scales and regularities |
| [Category 9](docs/signals/Category9/index.md) | 156–180 |  Scientific and mechanism-inspired signals together with controlled diagnostics for alignment, boundaries, resolution, scale bias, and regularity |
| [Category 10](docs/signals/Category10/index.md) | 181–230 |  Research-frontier measurement morphologies and mathematical adversaries involving critical-time behavior, cancellation, and heterogeneous regularity |

## What Each Signal Page Contains

Every signal page provides:

- a signal image using the naming convention `TF###_SignalName.png`;
- an overview and scientific or mathematical motivation;
- the mathematical definition and parameter values;
- morphological characteristics and the principal denoising challenge;
- standalone MATLAB and Python implementations;
- recommended benchmarking uses and provenance information; and
- previous, next, and category-catalog navigation links.

## Recommended Benchmark Workflow

1. Select a signal or a morphology-balanced collection from the
   [signal catalog](docs/signals/index.md).
2. Generate the deterministic clean signal using its MATLAB or Python code.
3. Apply the common power–SNR normalization described in the
   [Golden Rules](docs/Rules.md).
4. Add noise using the same noisy realization for every method being compared.
5. Apply each denoising or smoothing method without changing the native signal
   morphology.
6. Report signal-wise results, morphology-specific results, and the balanced
   global score described in the
   [denoising-experiment guide](docs/denoising-experiments.md).

## Core Evaluation Principle

> **One signal, one vote; one morphology family, one fair share.**

Raw AMSE values should not be pooled across heterogeneous signals as the only
global score. Relative risks should be computed signal by signal and aggregated
geometrically, with morphology-balanced weighting when category sizes differ.
See the [Golden Rules](docs/Rules.md) for the full definitions.

## Code and Reproducibility

Each signal page contains copy-ready MATLAB and Python code. The centralized
source folders provide scripts for generating the complete signal bank and its
figures:

- [Browse the MATLAB source][docs/codes/matlab.md]
- [Browse the Python source][docs/codes/python.md]
- [Report a code or documentation issue][docs/issues]

All functions are defined on $0\leq x\leq1$ in their native deterministic
forms. Power–SNR normalization should be applied only when constructing a
denoising experiment.

## Citation

If BEND-1D contributes to a publication, presentation, software package, or
teaching resource, please cite the library and record the version, signal IDs,
sample size, noise model, SNR definition, and code commit used in the analysis.

[View the citation information](docs/citation.md).

## License and Contributions

The [license](license.html) explains permitted use and redistribution.
Corrections, additional implementations, and carefully motivated new signals
are welcome through the [contribution guide](contributing.html) or the
[repository issue tracker][issues].

---

**BEND-1D:** reproducible signals, transparent code, and morphology-balanced
evaluation for one-dimensional denoising research.

<!-- Replace YOUR-USERNAME/YOUR-REPOSITORY in the four links below. -->
[repository]: https://github.com/vimalajeewaruh/BEND-1D
[matlab-code]: https://github.com/vimalajeewaruh/BEND-1D/tree/main/docs/code/matlab
[python-code]: https://github.com/vimalajeewaruh/BEND-1D/tree/main/docs/code/python
[issues]: https://github.com/vimalajeewaruh/BEND-1D/issues
