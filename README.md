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

| Category | Signal range | Number | Main emphasis |
|---|---:|---:|---|
| [Category 1](signals/Category1/) | TF001–TF016 | 16 | Foundational application-oriented morphologies, including critical onsets, spectra, impacts, oscillations, and structural changes |
| [Category 2](signals/Category2/) | TF017–TF026 | 10 | Additional application-oriented signals with local defects, transients, multiscale peaks, and asymmetric behavior |
| [Category 3](signals/Category3/) | TF027–TF042 | 16 | Physiological, mechanical, oceanographic, acoustic, and atmospheric measurement structures |
| [Category 4](signals/Category4/) | TF043–TF058 | 16 | Measurement-science signals from production, environmental monitoring, spectroscopy, seismology, and analytical instruments |
| [Category 5](signals/Category5/) | TF059–TF070 | 12 | Cross-disciplinary smoothing problems with sharp peaks, shoulders, notches, transitions, and thin-layer anomalies |
| [Category 6](signals/Category6/) | TF071–TF100 | 30 | Modern cross-disciplinary signals from engineering, computing, astronomy, economics, acoustics, geology, and neuroscience |
| [Category 7](signals/Category7/) | TF101–TF125 | 25 | Contemporary applications and artificial stress tests involving quantum systems, fusion, genomics, AI infrastructure, and weak hidden features |
| [Category 8](signals/Category8/) | TF126–TF155 | 30 | Modern sensing signals and adversarial MishMash constructions with incompatible local scales and regularities |
| [Category 9](signals/Category9/) | TF156–TF180 | 25 | Scientific and mechanism-inspired signals together with controlled diagnostics for alignment, boundaries, resolution, scale bias, and regularity |
| [Category 10](signals/Category10/) | TF181–TF230 | 50 | Research-frontier measurement morphologies and mathematical adversaries involving critical-time behavior, cancellation, and heterogeneous regularity |

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
   [signal catalog](signals/).
2. Generate the deterministic clean signal using its MATLAB or Python code.
3. Apply the common power–SNR normalization described in the
   [Golden Rules](golden-rules.html).
4. Add noise using the same noisy realization for every method being compared.
5. Apply each denoising or smoothing method without changing the native signal
   morphology.
6. Report signal-wise results, morphology-specific results, and the balanced
   global score described in the
   [denoising-experiment guide](denoising-experiments.html).

## Core Evaluation Principle

> **One signal, one vote; one morphology family, one fair share.**

Raw AMSE values should not be pooled across heterogeneous signals as the only
global score. Relative risks should be computed signal by signal and aggregated
geometrically, with morphology-balanced weighting when category sizes differ.
See the [Golden Rules](golden-rules.html) for the full definitions.

## Code and Reproducibility

Each signal page contains copy-ready MATLAB and Python code. The centralized
source folders provide scripts for generating the complete signal bank and its
figures:

- [Browse the MATLAB source][matlab-code]
- [Browse the Python source][python-code]
- [Report a code or documentation issue][issues]

All functions are defined on $0\leq x\leq1$ in their native deterministic
forms. Power–SNR normalization should be applied only when constructing a
denoising experiment.

## Citation

If BEND-1D contributes to a publication, presentation, software package, or
teaching resource, please cite the library and record the version, signal IDs,
sample size, noise model, SNR definition, and code commit used in the analysis.

[View the citation information](citation.html).

## License and Contributions

The [license](license.html) explains permitted use and redistribution.
Corrections, additional implementations, and carefully motivated new signals
are welcome through the [contribution guide](contributing.html) or the
[repository issue tracker][issues].

---

**BEND-1D:** reproducible signals, transparent code, and morphology-balanced
evaluation for one-dimensional denoising research.

<!-- Replace YOUR-USERNAME/YOUR-REPOSITORY in the four links below. -->
[repository]: https://github.com/YOUR-USERNAME/YOUR-REPOSITORY
[matlab-code]: https://github.com/YOUR-USERNAME/YOUR-REPOSITORY/tree/main/code/matlab
[python-code]: https://github.com/YOUR-USERNAME/YOUR-REPOSITORY/tree/main/code/python
[issues]: https://github.com/YOUR-USERNAME/YOUR-REPOSITORY/issues
