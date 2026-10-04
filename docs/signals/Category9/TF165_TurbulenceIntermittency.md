# Turbulence Intermittency


## Overview

The **TurbulenceIntermittency** signal is a deterministic turbulence surrogate that combines a dyadic broadband background with three localized high-frequency packets. It moves between persistent multiscale fluctuation and intermittent fine-scale activity, challenging methods that equate weak high-frequency structure with noise.

## Mathematical Definition

Let the phase vector be

```math
\boldsymbol{\theta}
=
(0.2,\,1.1,\,2.0,\,0.7,\,2.7,\,1.6,\,0.4,\,2.3,\,1.3).
```

Define the dyadic broadband component

```math
B(x)=
\sum_{m=0}^{M}
A_B\,2^{-m/\gamma}
\sin\left(
2\pi 2^m x+\theta_{m+1}
\right).
```

Define the Gaussian envelope

```math
g(x;c,w)=
\exp\left[
-\frac12
\left(
\frac{x-c}{w}
\right)^2
\right].
```

For each localized high-frequency packet, define

```math
P_k(x)=
A_k
g(x;c_k,w_k)
\sin\left(
2\pi f_kx+\delta_k
\right).
```

The packet centers, widths, frequencies, amplitudes, and phases are

```math
\mathbf{c}
=
(0.24,\,0.56,\,0.81),
```

```math
\mathbf{w}
=
(0.055,\,0.040,\,0.028),
```

```math
\mathbf{f}
=
(73,\,119,\,181),
```

```math
\mathbf{A}
=
(0.20,\,0.16,\,0.13),
```

```math
\boldsymbol{\delta}
=
(0.3,\,1.1,\,0.8).
```

The signal is

```math
f(x)=
B(x)+\sum_{k=1}^{K}P_k(x).
```

[View Turbulence Intermittency](../../assets/images/TF165_TurbulenceIntermittency.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Multiscale intermittent oscillation |
| Background | $M+1$ dyadic sinusoidal scales with scale-dependent amplitudes |
| Broadband scaling | Amplitudes decay according to $2^{-m/\gamma}$ |
| Local structure | $K$ localized high-frequency packets |
| Packet behavior | Increasing frequencies with decreasing amplitudes and widths |
| Regularity | Smooth but strongly nonstationary |
| Main challenge | Retaining intermittent fine scales while reducing noise |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $M$ | Maximum dyadic scale index | 8 |
| $A_B$ | Broadband amplitude scale | 0.13 |
| $\gamma$ | Broadband scaling exponent denominator | 3 |
| $\boldsymbol{\theta}$ | Broadband phase vector | $(0.2,\,1.1,\,2.0,\,0.7,\,2.7,\,1.6,\,0.4,\,2.3,\,1.3)$ |
| $K$ | Number of localized packets | 3 |
| $\mathbf{c}$ | Packet centers | $(0.24,\,0.56,\,0.81)$ |
| $\mathbf{w}$ | Packet widths | $(0.055,\,0.040,\,0.028)$ |
| $\mathbf{f}$ | Packet frequencies | $(73,\,119,\,181)$ |
| $\mathbf{A}$ | Packet amplitudes | $(0.20,\,0.16,\,0.13)$ |
| $\boldsymbol{\delta}$ | Packet phases | $(0.3,\,1.1,\,0.8)$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF165_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF165_python.md)



## Recommended Uses

- Multiscale denoising
- Intermittency and wave-packet preservation
- Stress testing scale-adaptive thresholds

## Provenance

This deterministic signal is inspired by qualitative intermittency in turbulent measurements. It is not a fluid-dynamical simulation.

[← Previous: T-Wave Alternans](TF164_TWaveAlternans.md) · [Category 9 catalog](index.md) · [Next: Stress–Strain Fracture →](TF166_StressStrainFracture.md)
