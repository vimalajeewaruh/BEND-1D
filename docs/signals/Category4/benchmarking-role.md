---
layout: default
title: Category 4 — Benchmarking Role
---

# Category 4 Benchmarking Role

Category 4 focuses on deterministic measurement-science surrogates. Each signal represents a process observed through an instrument rather than a complete mechanistic model.

## Morphology Summary

| Signal | Benchmarking role |
|---|---|
| StampShadeRun | Smooth production drift with a discrete batch change |
| PerforationDrift | Drift and periodic error with one fine-scale anomaly |
| StampReflectance | Broad spectral bands, shoulder, and weak secondary feature |
| PlateWear | Progressive deterioration with a maintenance reset |
| TreeRing | Multiscale variation, drought depressions, and recovery |
| IceCore | Slow and fine variability with an excursion and level change |
| Seismogram | P and S arrivals followed by multifrequency coda |
| VolcanicTremor | Smooth onset, persistent tremor, and amplitude bursts |
| RogueWave | Structured ocean background with localized extreme group |
| StellarTransitFlare | Weak variability with opposite-sign transit and flare |
| CyclicVoltammetry | Forward–reverse hysteresis with unequal peaks |
| FractureAE | Sparse-to-dense pulses and resonant tails near failure |
| Pharmacokinetic | Absorption, multirate elimination, and delayed shoulder |
| EpidemicSeasonal | Seasonal background, outbreak, and intervention shift |
| PollutionEpisode | Diurnal periodicity with unequal transient episodes |
| Chromatogram | Drifting baseline with unequal and overlapping peaks |

## Power-SNR Normalization

For native samples $f_0(x_i)$ and Gaussian noise standard deviation $\sigma$, a common power-SNR normalization is

$$
f(x_i)=f_0(x_i)
\sqrt{
\frac{\mathrm{SNR}_{\mathrm{target}}\sigma^2}
{N^{-1}\sum_{j=1}^{N}f_0(x_j)^2}
}.
$$

This scaling is applied only for denoising experiments; the documented formulas define the native signals.

## Reproducibility Notes

- Use the same sampling grid and sample count for all methods.
- Give every method the same noisy realization within each Monte Carlo replication.
- Record the native and normalized signal scales separately.
- Preserve the exact parameters and image filenames documented on each page.
- Report both global and morphology-specific denoising performance.

---

[← Return to Category 4 Catalog](index.md)
