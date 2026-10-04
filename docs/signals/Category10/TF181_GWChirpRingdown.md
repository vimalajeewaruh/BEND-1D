# GWChirpRingdown


## Overview

The **GWChirpRingdown** signal is an accelerating compact-binary-inspired chirp that grows in amplitude and frequency until a prescribed merger time, then changes immediately into a damped high-frequency ring-down.

## Mathematical Definition

Let the merger time be $x_c$. Define the pre-merger amplitude by

```math
A(x)=
A_0+A_1
\left(
\frac{x}{x_c}
\right)^p.
```

Define the chirp phase by

```math
\phi(x)=
2\pi
\left(
a_1x+a_2x^2+a_3x^3+a_5x^5
\right).
```

The phase at merger is

```math
\phi_c=\phi(x_c).
```

For $x<x_c$, define the accelerating chirp by

```math
f(x)=
A(x)\sin\left(\phi(x)\right).
```

For $x\geq x_c$, define the ring-down by

```math
f(x)=
A_R e^{-\alpha_R(x-x_c)}
\sin\left[
2\pi f_R(x-x_c)+\phi_c
\right].
```

[View GW Chirp Ringdown](../../assets/images/TF181_GWChirpRingdown.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Astrophysics |
| Primary family | Accelerating chirp with damped ring-down |
| Pre-merger behavior | Increasing amplitude and instantaneous frequency |
| Merger location | Transition at $x_c$ |
| Post-merger behavior | Exponentially damped high-frequency oscillation |
| Phase connection | Ring-down begins with phase $\phi_c$ |
| Main challenge | Preserving phase through the merger and the short decaying tail |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $x_c$ | Merger time | 0.72 |
| $A_0$ | Initial chirp amplitude | 0.12 |
| $A_1$ | Chirp amplitude-growth coefficient | 0.88 |
| $p$ | Chirp amplitude-growth exponent | 1.6 |
| $a_1$ | Linear phase coefficient | 4 |
| $a_2$ | Quadratic phase coefficient | 5 |
| $a_3$ | Cubic phase coefficient | 12 |
| $a_5$ | Fifth-order phase coefficient | 18 |
| $A_R$ | Ring-down amplitude | 1 |
| $\alpha_R$ | Ring-down decay rate | 14 |
| $f_R$ | Ring-down frequency | 42 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF181_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF181_python.md)



## Recommended Uses

- Nonstationary chirp denoising
- Merger-time and phase preservation
- Rapid regime-change recovery

## Provenance

This is a deterministic benchmark surrogate inspired by astrophysics measurement morphology. It is not a calibrated physical or clinical simulator.

[Category 10 catalog](index.md) · [Next: FRBScatterTail →](TF182_FRBScatterTail.md)

