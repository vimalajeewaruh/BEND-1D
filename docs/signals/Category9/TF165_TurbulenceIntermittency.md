# Turbulence Intermittency


## Overview

This deterministic turbulence surrogate combines a dyadic broadband background with three localized high-frequency packets. It moves between persistent multiscale fluctuation and intermittent fine-scale activity, challenging methods that equate weak high-frequency structure with noise.

## Mathematical Definition

Let

$$
\theta=(0.2,1.1,2.0,0.7,2.7,1.6,0.4,2.3,1.3).
$$

The broadband component is

$$
B(x)=\sum_{m=0}^{8}0.13\,2^{-m/3}\sin(2\pi 2^m x+\theta_{m+1}).
$$

With the Gaussian envelope $g(x;c,w)=\exp[-\tfrac12((x-c)/w)^2]$, the full signal is

$$
\begin{aligned}
f(x)=B(x)
&+0.20g(x;0.24,0.055)\sin(2\pi73x+0.3)\\
&+0.16g(x;0.56,0.040)\sin(2\pi119x+1.1)\\
&+0.13g(x;0.81,0.028)\sin(2\pi181x+0.8).
\end{aligned}
$$

[Turbulence Intermittency](../../assets/images/TF165_TurbulenceIntermittency.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Multiscale intermittent oscillation |
| Background | Nine dyadic sinusoidal scales |
| Local structure | Three shrinking high-frequency packets |
| Regularity | Smooth but strongly nonstationary |
| Main challenge | Retain intermittent fine scales while reducing noise |

## Parameters

| Feature | Center | Width | Frequency | Amplitude |
|---|---:|---:|---:|---:|
| Packet 1 | $0.24$ | $0.055$ | $73$ | $0.20$ |
| Packet 2 | $0.56$ | $0.040$ | $119$ | $0.16$ |
| Packet 3 | $0.81$ | $0.028$ | $181$ | $0.13$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF0165_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF0165_python.md)



## Recommended Uses

- Multiscale denoising
- Intermittency and wave-packet preservation
- Stress testing scale-adaptive thresholds

## Provenance

This deterministic signal is inspired by qualitative intermittency in turbulent measurements. It is not a fluid-dynamical simulation.

[← Previous: T-Wave Alternans](TF164_TWaveAlternans.md) · [Category 9 catalog](index.md) · [Next: Stress–Strain Fracture →](TF166_StressStrainFracture.md)
