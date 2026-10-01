# BEND-1D

## Denoising Benchmark Function Repository

A reproducible library of **230 one-dimensional test signals** representing
different smoothness, oscillation, discontinuity, localization, multiscale,
transient, and singularity structures.

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
| [Getting Started](getting-started.md) | Installation, folder structure, and first example |
| [Complete Signal Catalog](docs/index.md) | All 230 signals organized into ten categories |
| [Golden Rules](docs/Rules.md) | SNR normalization, fair aggregation, and reporting principles |
| [Denoising Experiments](docs/DenoiseExamples.md) | Recommended simulation and evaluation workflow |
| [MATLAB Code](docs/codes/matlab/) | MATLAB implementations |
| [Python Code](docs/codes/python/) | Python implementations |
| [Citation](citation.html) | How to cite BEND-1D |
| [License](license.html) | Terms for using and redistributing the library |
| [Contributing](.github/ISSUE_TEMPLATE/report-problem.yml) | Reporting issues and proposing new signals |

## Browse by Category

| Category | Signal range | Main emphasis |
|---|---:|---|
| [1](docs/signals/Category1/index.md) | 1–16 | Foundational application-oriented morphologies, including critical onsets, spectra, impacts, oscillations, and structural changes |
| [2](docs/signals/Category2/index.md) | 17–26 |  Additional application-oriented signals with local defects, transients, multiscale peaks, and asymmetric behavior |
| [3](docs/signals/Category3/index.md) | 27–42 |  Physiological, mechanical, oceanographic, acoustic, and atmospheric measurement structures |
| [4](docs/signals/Category4/index.md) | 43–58 |  Measurement-science signals from production, environmental monitoring, spectroscopy, seismology, and analytical instruments |
| [5](docs/signals/Category5/index.md) | 59–70 |  Cross-disciplinary smoothing problems with sharp peaks, shoulders, notches, transitions, and thin-layer anomalies |
| [6](docs/signals/Category6/index.md) | 71–100 |  Modern cross-disciplinary signals from engineering, computing, astronomy, economics, acoustics, geology, and neuroscience |
| [7](docs/signals/Category7/index.md) | 101–125 |  Contemporary applications and artificial stress tests involving quantum systems, fusion, genomics, AI infrastructure, and weak hidden features |
| [8](docs/signals/Category8/index.md) | 126–155 |  Modern sensing signals and adversarial MishMash constructions with incompatible local scales and regularities |
| [9](docs/signals/Category9/index.md) | 156–180 |  Scientific and mechanism-inspired signals together with controlled diagnostics for alignment, boundaries, resolution, scale bias, and regularity |
| [10](docs/signals/Category10/index.md) | 181–230 |  Research-frontier measurement morphologies and mathematical adversaries involving critical-time behavior, cancellation, and heterogeneous regularity |

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

- [Browse the MATLAB source](docs/codes/matlab.md)
- [Browse the Python source](docs/codes/python.md)
- [Report a code or documentation issue](.github/ISSUE_TEMPLATE/report-problem.yml)

## Citation

If BEND-1D contributes to a publication, presentation, software package, or
teaching resource, please cite the library and record the version, signal IDs,
sample size, noise model, SNR definition, and code commit used in the analysis.

Dixon Vimalajeewa, Malith Premarathna, and Brani Vidakovic. *BEND-1D: A Reproducible Library of One-Dimensional
Benchmark Signals for Denoising and Smoothing*. 2026. Available from:
[https://github.com/vimalajeewaruh/BEND-1S](https://github.com/vimalajeewaruh/BEND-1D).


## BibTeX

```bibtex
@software{vimalajeewa_bend1d_2026,
  author  = {Vimalajeewa, Dixon, Premarathna, Malith, Vidakovic, Brani},
  title   = {BEND-1D: A Reproducible Library of One-Dimensional
             Benchmark Signals for Denoising and Smoothing},
  year    = {2026},
  url     = {https://github.com/Yvimalajeewaruh/BEND-1D},
  note    = {Version 1.0}
}
```

## License and Contributions

The [license](license.html) explains permitted use and redistribution.
Corrections, additional implementations, and carefully motivated new signals
are welcome through the [repository issue tracker](.github/ISSUE_TEMPLATE/report-problem.yml).

---

**BEND-1D:** reproducible signals, transparent code, and morphology-balanced
evaluation for one-dimensional denoising research.

[repository](https://github.com/vimalajeewaruh/BEND-1D).
[matlab-code](https://github.com/vimalajeewaruh/BEND-1D/tree/main/docs/code/matlab)
[python-code](https://github.com/vimalajeewaruh/BEND-1D/tree/main/docs/code/python)
[issues](https://github.com/vimalajeewaruh/BEND-1D/issues/new/choose)
