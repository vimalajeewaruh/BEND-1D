# Transformer Inrush


## Overview

This transformer-inrush surrogate combines a decaying asymmetric offset, a fundamental oscillation with a large transient envelope, and a decaying second harmonic. The initial cycles are strongly nonstationary before settling toward a persistent sinusoid.

## Mathematical Definition

For $0\le x\le1$,

$$
\begin{aligned}
f(x)={}&(0.35+1.05e^{-5x})\sin(16\pi x)
+0.48e^{-4x}\\
&+0.26e^{-5.5x}\sin(32\pi x+0.45).
\end{aligned}
$$

[Transformer Inrush](../../assets/images/TF173_TransformerInrush.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Decaying nonstationary oscillation |
| Persistent component | Fundamental sinusoid of amplitude $0.35$ |
| Transients | Decaying envelope, DC offset, and second harmonic |
| Asymmetry | Strongest near the left boundary |
| Main challenge | Preserve early-cycle distortion and steady oscillation |

## Parameters

| Component | Initial amplitude | Decay rate |
|---|---:|---:|
| Fundamental transient envelope | $1.05$ | $5$ |
| Offset | $0.48$ | $4$ |
| Second harmonic | $0.26$ | $5.5$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF0173_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF0173_python.md)



## Recommended Uses

- Transient harmonic denoising
- Boundary-localized nonstationarity
- Amplitude and phase preservation

## Provenance

This deterministic waveform is inspired by transformer magnetizing inrush. It is not a circuit or magnetic-core simulation.

[← Previous: Tertiary Creep Failure](TF172_TertiaryCreepFailure.md) · [Category 9 catalog](index.md) · [Next: MEMS Pull-In / Release →](TF174_MEMSPullInRelease.md)
