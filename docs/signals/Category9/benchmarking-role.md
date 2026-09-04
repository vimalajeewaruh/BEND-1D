---
layout: default
title: "Category 9 — Benchmarking Role"
---

# Category 9 — Benchmarking Role

Category 9 combines twenty mechanism-inspired signals with five controlled diagnostics. The application-oriented functions test whether a method can preserve scientifically recognizable structure; the final five isolate specific methodological sensitivities.

## Morphology Summary

| Signals | Benchmark emphasis |
|---|---|
| TF156–TF160 | Shocks, edges, plateaus, and edge-associated oscillation |
| TF161–TF164 | Repeated physiological waveforms and weak local variations |
| TF165 | Broadband and intermittent multiscale oscillation |
| TF166–TF169 | Material and thermal transitions, failure, and multistage change |
| TF170–TF175 | Nonlinear dynamics, dispersive waves, transients, and regime switches |
| TF176 | Translation and dyadic-alignment sensitivity |
| TF177 | Boundary-handling sensitivity |
| TF178 | Peak-resolution limit |
| TF179 | Scale bias at approximately equal energy |
| TF180 | Adaptation to different local Hölder exponents |

## Native Sampling

TF176 must be sampled at $N=4096$ because its centers are defined by the one-based indices $512$, $1409$, $2306$, and $3203$. The remaining Category 9 examples use $N=1024$ in the supplied implementations.

## Power–SNR Normalization

To preserve offsets while equalizing centered signal power, first compute

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

Apply this normalization only when constructing a denoising experiment. The mathematical definitions and plots in the individual pages remain on their native deterministic scales.

## Suggested Reporting

- Report performance signal by signal before aggregation.
- Include localization or morphology-specific diagnostics when AMSE alone can hide failure.
- For TF176 and TF177, compare matched copies rather than only the total record error.
- For TF178, report the smallest reliably resolved separation.
- For TF179, compare error across widths after accounting for equalized energy.
- For TF180, summarize error as a function of the Hölder exponent.
- Use paired noisy realizations when comparing denoisers.

[← Previous: Hölder Ladder](TF180_HolderLadder.md) · [Return to Category 9 catalog](index.md)
