---
layout: default
title: "Category 10 — Benchmarking Role"
---

# Category 10 — Benchmarking Role

Category 10 extends BEND-1D with fifty deterministic signals that emphasize modern measurement morphologies and controlled structural adversaries. Each signal has a known noiseless truth, but the application labels describe qualitative inspiration rather than calibrated physical simulation.

## Morphology Summary

| Signals | Benchmark emphasis |
|---|---|
| TF181–TF190 | Chirps, scattering tails, phase slips, burst clusters, ramp-crash cycles, collisions, and slowing recovery |
| TF191–TF200 | Knees, asymmetric operating cycles, fades, nested modulation, sparse events, beating, switching, and saturation |
| TF201–TF210 | Overlapping biomedical events, multiscale neurophysiology, asymmetric responses, plant kinetics, and repeated transitions |
| TF211–TF220 | Inharmonic acoustic decay, beat envelopes, control cycles, transport events, and climate transitions |
| TF221–TF225 | Nonstationary climate oscillation, critical-time compression, volatility structure, liquidity gaps, and multirate shocks |
| TF226 | Extreme local curvature under real-axis analyticity |
| TF227–TF228 | Coupled cusps and compressed oscillations |
| TF229 | Weak-feature recovery after near-cancellation |
| TF230 | Spatially heterogeneous local regularity |

## Native Sampling

The supplied standalone implementations use

$$
x_i=\frac{i-1}{N-1},
\qquad i=1,\ldots,N,
\qquad N=1024.
$$

Definitions involving centering or maximum normalization use this sampled grid. If another value of $N$ is used, report it because narrow features and discrete normalizations can change slightly.

## Power–SNR Normalization

Keep the native function unchanged for documentation and plotting. When constructing a denoising experiment, compute

$$
\bar f_0=\frac1N\sum_{i=1}^{N}f_0(x_i),
\qquad
P_0=\frac1N\sum_{i=1}^{N}[f_0(x_i)-\bar f_0]^2.
$$

For noise standard deviation $\sigma$ and target linear SNR, use

$$
f(x_i)=\bar f_0+[f_0(x_i)-\bar f_0]
\sqrt{\frac{\mathrm{SNR}_{\mathrm{target}}\sigma^2}{P_0}}.
$$

This retains the native DC level while equalizing centered signal power.

## Suggested Reporting

- Use paired noisy realizations when comparing denoisers.
- Report signal-wise results before morphology-balanced aggregation.
- Supplement AMSE with feature-specific measures when a small feature can disappear with little effect on global error.
- For oscillatory signals, examine phase, envelope, or instantaneous-frequency distortion.
- For knees, transitions, and shocks, report location bias and transition-width distortion.
- For sparse-event signals, report missed and false events as well as amplitude error.
- For TF226–TF230, explicitly report performance on the controlled structural feature each signal was designed to isolate.

## Interpretation

No method is expected to dominate all fifty functions. The purpose of Category 10 is to distinguish broad morphological robustness from excellent performance on a small collection of familiar examples.

[← Previous: RegularityQuilt](TF230_RegularityQuilt.md) · [Return to Category 10 catalog](index.md)
