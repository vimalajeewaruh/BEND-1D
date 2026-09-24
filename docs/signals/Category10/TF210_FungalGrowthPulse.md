# FungalGrowthPulse


## Overview

A slowly increasing baseline is punctuated by four sigmoidal growth spurts of different widths and magnitudes, with weak oscillation between them.

## Mathematical Definition

With $L(x;c,w)=[1+e^{-(x-c)/w}]^{-1}$,
$$
\begin{aligned}
f(x)={}&0.06+0.12x+0.19L(x;0.19,0.035)
+0.15L(x;0.39,0.018)\\
&+0.27L(x;0.63,0.050)+0.12L(x;0.84,0.020)\\
&+0.018\sin(18\pi x)[L(x;0.17,0.03)-L(x;0.88,0.03)].
\end{aligned}
$$

[FungalGrowthPulse signal](../../assets/images/TF210_FungalGrowthPulse.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Mycology |
| Structure | Trend plus unequal logistic increments and gated ripple |
| Regularity | Smooth cumulative staircase |
| Main challenge | Preserve weak and broad growth phases simultaneously |

## Parameters

| Parameter | Value |
|---|---|
| Growth centers | $0.19,0.39,0.63,0.84$ |
| Growth magnitudes | $0.19,0.15,0.27,0.12$ |
| Growth widths | $0.035,0.018,0.050,0.020$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF210_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF210_python.md)



## Recommended Uses

- Growth-curve denoising
- Multiple-knee preservation
- Weak interphase oscillation recovery

## Provenance

This is a deterministic benchmark surrogate inspired by mycology measurement morphology. It is not a calibrated physical or clinical simulator.

[← Previous: LeafNyctinasty](TF209_LeafNyctinasty.md) · [Category 10 catalog](index.md) · [Next: PianoInharmonicDecay →](TF211_PianoInharmonicDecay.md)

