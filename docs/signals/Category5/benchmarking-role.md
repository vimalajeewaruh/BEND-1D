---
layout: default
title: Category 5 — Benchmarking Role
---

# Category 5 Benchmarking Role

Category 5 broadens the application range of BEND-1D while emphasizing whether smoothing can preserve small scientifically meaningful structures near dominant components.

## Morphology Summary

| Signal | Benchmarking role |
|---|---|
| ECGBeat | Broad P and T waves with a very sharp QRS complex |
| ArterialPulse | Smooth systolic pulse with small notch and rebound |
| EEGSpindle | Finite-duration frequency-modulated oscillatory packet |
| MassSpectrum | Sparse unequal lines with a close doublet |
| NMRMultiplet | Interacting Lorentzian lines and broad background resonance |
| XRDPeaks | Sharp Bragg peaks on decaying and amorphous background |
| AFMForceCurve | Adhesion, nonlinear contact loading, and snap-off |
| BatteryDischarge | Long plateau, weak shoulder, and terminal cliff |
| FluorescenceBleach | Multirate decay with weak recovery and level change |
| RadioAstronomyLine | Smooth continuum with emission and absorption features |
| OceanThermocline | Dominant smooth transition with inversion and fine structure |
| WellLog | Smoothed stratigraphic boundaries and thin-bed anomaly |

## Power-SNR Normalization

For native samples $f_0(x_i)$ and Gaussian noise standard deviation $\sigma$, a common power-SNR normalization is

$$
f(x_i)=f_0(x_i)
\sqrt{
\frac{\mathrm{SNR}_{\mathrm{target}}\sigma^2}
{N^{-1}\sum_{j=1}^{N}f_0(x_j)^2}
}.
$$

This scaling is applied only for denoising experiments; the page definitions give the native signal scales.

## Reproducibility Notes

- Use the same sampling grid and sample count for every method.
- Give all methods the same noisy realization within a Monte Carlo replication.
- Keep native signal construction separate from power-SNR normalization.
- Report performance for weak features as well as dominant components.
- Preserve the exact page parameters and image filenames.

---

[← Return to Category 5 Catalog](index.md)
