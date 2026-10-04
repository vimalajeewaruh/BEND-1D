# XrayQPODrift

## Overview

The **XrayQPODrift** signal is a quasi-periodic oscillation whose amplitude and instantaneous frequency both change over time. These changes cause its wavelet representation to migrate across scales while its visibility varies.

## Mathematical Definition

Define the smooth logistic transition

```math
L(x;c,w)=
\left[1+e^{-(x-c)/w}\right]^{-1}.
```

Define the amplitude envelope by

```math
A(x)=
A_0
+
A_R L(x;c_R,w_R)
-
A_F L(x;c_F,w_F).
```

Define the oscillatory phase by

```math
\phi(x)=
2\pi
\left(
a_1x+a_2x^2+a_3x^3
\right)
+
A_M\sin(2\pi f_Mx).
```

The signal is

```math
f(x)=
A(x)\sin\left[\phi(x)\right].
```

[View X-ray QPO Drift](../../assets/images/TF185_XrayQPODrift.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | High-energy astrophysics |
| Primary family | Amplitude- and frequency-modulated oscillation |
| Structure | Polynomial-phase oscillation with a smoothly varying amplitude envelope |
| Amplitude behavior | Smooth rise followed by a later decrease |
| Frequency behavior | Nonlinear drift with additional phase modulation |
| Regularity | Smooth and globally oscillatory |
| Main challenge | Following simultaneous amplitude and frequency drift |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $A_0$ | Baseline amplitude | 0.45 |
| $A_R$ | Rising amplitude increment | 0.35 |
| $c_R$ | Rising-transition center | 0.18 |
| $w_R$ | Rising-transition width | 0.06 |
| $A_F$ | Falling amplitude decrement | 0.22 |
| $c_F$ | Falling-transition center | 0.78 |
| $w_F$ | Falling-transition width | 0.05 |
| $a_1$ | Linear phase coefficient | 10 |
| $a_2$ | Quadratic phase coefficient | 8 |
| $a_3$ | Cubic phase coefficient | 1.8 |
| $A_M$ | Phase-modulation amplitude | 0.7 |
| $f_M$ | Phase-modulation frequency | 1.3 |

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

