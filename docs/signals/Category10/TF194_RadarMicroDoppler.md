# RadarMicroDoppler


## Overview

Two overlapping oscillatory components use nested amplitude and phase modulation to reproduce a nonmonotone micro-Doppler-like time-frequency pattern.

## Mathematical Definition

Define
$$
\phi_1=2\pi(17x+5x^2)+1.25\sin(2\pi2.7x),\qquad
\phi_2=2\pi(39x+2.5x^2)+0.70\sin(2\pi5.2x).
$$
Then
$$
f(x)=[0.58+0.25\cos(2\pi1.8x)]\sin\phi_1+0.24\sin\phi_2.
$$

[RadarMicroDoppler signal](../../assets/images/TF194_RadarMicroDoppler.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Radar sensing |
| Structure | Two polynomial-phase carriers with nested modulation |
| Regularity | Smooth, dense, and nonstationary |
| Main challenge | Preserve migrating time-frequency components and sidebands |

## Parameters

| Parameter | Value |
|---|---|
| Carrier 1 base frequency | $17$ |
| Carrier 2 base frequency | $39$ |
| Component-2 amplitude | $0.24$ |


## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF194_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF194_python.md)




## Recommended Uses

- Micro-Doppler denoising
- Nested modulation recovery
- Time-frequency ridge preservation

## Provenance

This is a deterministic benchmark surrogate inspired by radar sensing measurement morphology. It is not a calibrated physical simulator.

[← Previous: GNSSMultipathFade](TF193_GNSSMultipathFade.md) · [Category 10 catalog](index.md) · [Next: MeltPoolSpatter →](TF195_MeltPoolSpatter.md)

