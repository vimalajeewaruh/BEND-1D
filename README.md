# BEND-1D: Benchmark for Endpoint-Neutral Denoising in One Dimension

## Denoising Benchmark Function Repository

BEND-1D is designed for reproducible comparison of signal denoising and
smoothing methods. It contains deterministic signals with known noiseless
truths, allowing reconstruction error and morphology preservation to be
evaluated directly. The name is intentionally not tied to wavelets, to a
particular denoising paradigm, or permanently to the number 230.

The present collection is referred to as **BEND-1D v1.0 (230 signals)**.
This includes smooth curves, jumps, cusps, derivative singularities,
localized oscillations, chirps, repeated impacts, pulse trains, spectral
peaks, regime changes, multiscale transients, and deliberately adversarial
signals. Many functions are motivated by recognizable scientific,
engineering, biomedical, environmental, and economic measurements.

## Quick Access

| Resource | Contents |
|:---|:---|
| [Getting Started](getting-started.md) | Installation, folder structure, and first example |
| [Complete Signal Catalog](docs/signals/) | All 230 signals organized into ten categories |
| [Golden Rules](docs/Rules.md) | SNR normalization, fair aggregation, and reporting principles |
| [Denoising Experiments](docs/DenoiseExamples.md) | Recommended simulation and evaluation workflow |
| [MATLAB Toolbox](docs/codes/matlab/) | MATLAB source files |
| [Python Library](docs/codes/python/) | Python source files |
| [License](license.html) | Terms for using and redistributing the library |
| [Contributing](.github/ISSUE_TEMPLATE/report-problem.yml) | Reporting issues and proposing new signals |


## Code and Reproducibility

Each signal page contains mathematical definitions, properties, and copy-ready MATLAB and Python code. The centralized
[MATLAB](docs/codes/matlab.md) and [PYTHON](docs/codes/python.md) source folders provide scripts for installing bend1d and generating the complete signal bank and its
figures. [Report a code or documentation issue](.github/ISSUE_TEMPLATE/report-problem.yml)

## Citation

If BEND-1D contributes to a publication, presentation, software package, or
teaching resource, please cite the library and record the version, signal IDs,
sample size, noise model, SNR definition, and code commit used in the analysis.

- Dixon Vimalajeewa, Malith Premarathna, and Brani Vidakovic. *BEND-1D: A Reproducible Library of One-Dimensional
Benchmark Signals for Denoising and Smoothing*. 2026. Available from:
[https://github.com/vimalajeewaruh/BEND-1S](https://github.com/vimalajeewaruh/BEND-1D).

- BibTeX

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

---
## MorphPrint
A complementary name for the future quantitative feature description is *MorphPrint*. 
Each signal will eventually receive a compact morphological feature vector, or *MorphPrint*, 
summarizing properties such as regularity, sparsity, oscillation, localization, multiscale energy,
and discontinuity structure. Thus, BEND-1D denotes the signal library, whereas MorphPrint will denote 
its quantitative characterization.
