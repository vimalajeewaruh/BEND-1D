---
layout: default
title: Category 3 — Benchmarking Role
---

# Category 3 Benchmarking Role

Category 3 emphasizes signal structures that are comparatively underrepresented by classical wavelet test functions. The examples contain recurrent or quasi-periodic structure, gradual or abrupt pathological onset, modulation, pulse trains, intermittent high-frequency activity, damped resonance, sparse impulses, and multiscale propagation effects.

## Morphology Summary

| Signal | Benchmarking role |
|---|---|
| NasonPleth | Quasi-periodic breathing with a disturbed interval |
| VasospasmTCD | Repeated pulsatility with changing level and amplitude |
| PVCTrain | Regular ECG-like sequence with one abnormal event |
| CheyneStokes | Recurrent amplitude envelopes separated by apnea |
| EEGBurstSuppress | Intermittent multiscale activity and suppression |
| TremorOnset | Smooth onset of sustained modulated oscillation |
| ArterialPulse | Repeated asymmetric features at several local scales |
| EMGRecruitment | Transition from sparse to dense multiband activity |
| BearingFault | Nearly periodic impacts with damped ring-downs |
| GearDefect | Modulated carrier and localized defect packet |
| RotorRub | Periodic motion with repeated nonlinear contact |
| VortexLockIn | Frequency increase followed by periodic lock-in |
| InternalSolitons | Dominant event with progressively weaker neighbors |
| WhaleClicks | Sparse irregular bipolar clicks and delayed echoes |
| SonarMultipath | Chirped ping, delayed copies, and reverberation |
| LightningSferic | Dominant impulse with multiscale ringing and delayed arrival |

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
- Record whether TF027 used `ipd.csv` or the deterministic fallback.
- Archive the exact `ipd.csv` file when empirical mode is used.
- Include the authoritative `chirp_packet` helper when reporting TF041 results.
- Keep native signal construction separate from power-SNR normalization.

---

[← Return to Category 3 Catalog](index.md)
