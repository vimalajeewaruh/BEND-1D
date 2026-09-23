# XrayQPODrift

## Overview

A quasi-periodic oscillation changes both amplitude and instantaneous frequency, causing its wavelet representation to migrate across scales while its visibility changes.

## Mathematical Definition

With $L(x;c,w)=[1+e^{-(x-c)/w}]^{-1}$,
$$
A(x)=0.45+0.35L(x;0.18,0.06)-0.22L(x;0.78,0.05),
$$
$$
\phi(x)=2\pi(10x+8x^2+1.8x^3)+0.7\sin(2\pi1.3x),
\qquad f(x)=A(x)\sin\{\phi(x)\}.
$$

[XrayQPODrift signal](../../assets/images/TF185_XrayQPODrift.png)


## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | High-energy astrophysics |
| Structure | Amplitude-modulated polynomial-phase oscillation |
| Regularity | Smooth and globally oscillatory |
| Main challenge | Follow simultaneous amplitude and frequency drift |

## Parameters

| Parameter | Value |
|---|---|
| Baseline amplitude | $0.45$ |
| Rising transition | $(0.18,0.06)$ |
| Falling transition | $(0.78,0.05)$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF185_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF185_python.md)



## Recommended Uses

- QPO denoising
- Time-frequency ridge preservation
- Amplitude-modulated chirp recovery

## Provenance

This is a deterministic benchmark surrogate inspired by high-energy astrophysics measurement morphology. It is not a calibrated physical or clinical simulator.

[← Previous: MagnetarBurstStorm](TF184_MagnetarBurstStorm.md) · [Category 10 catalog](index.md) · [Next: QubitRamseyWander →](TF186_QubitRamseyWander.md)

