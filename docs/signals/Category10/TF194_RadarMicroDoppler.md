# RadarMicroDoppler


## Overview

The **RadarMicroDoppler** signal contains two overlapping oscillatory components with nested amplitude and phase modulation, producing a nonmonotone micro-Doppler-like time-frequency pattern.

## Mathematical Definition

Define the phase of the first oscillatory component by

```math
\phi_1(x)=
2\pi\left(
f_1x+\beta_1x^2
\right)
+
A_{M1}\sin(2\pi f_{M1}x).
```

Define the phase of the second oscillatory component by

```math
\phi_2(x)=
2\pi\left(
f_2x+\beta_2x^2
\right)
+
A_{M2}\sin(2\pi f_{M2}x).
```

Define the amplitude envelope of the first component by

```math
A_1(x)=
A_{10}
+
A_{11}\cos(2\pi f_Ax).
```

The two oscillatory components are

```math
C_1(x)=
A_1(x)\sin\left[\phi_1(x)\right],
```

and

```math
C_2(x)=
A_2\sin\left[\phi_2(x)\right].
```

The signal is

```math
f(x)=C_1(x)+C_2(x).
```

[View Radar Micro-Doppler](../../assets/images/TF194_RadarMicroDoppler.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Radar sensing |
| Structure | Two polynomial-phase carriers with nested amplitude and phase modulation |
| Component interaction | Overlapping oscillatory components with different frequency trajectories |
| Modulation behavior | First component has amplitude and phase modulation; second component has phase modulation |
| Regularity | Smooth, dense, and nonstationary |
| Main challenge | Preserving migrating time-frequency components and sidebands |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $f_1$ | Component-1 base frequency | 17 |
| $\beta_1$ | Component-1 quadratic phase coefficient | 5 |
| $A_{M1}$ | Component-1 phase-modulation amplitude | 1.25 |
| $f_{M1}$ | Component-1 phase-modulation frequency | 2.7 |
| $A_{10}$ | Component-1 baseline amplitude | 0.58 |
| $A_{11}$ | Component-1 amplitude-modulation magnitude | 0.25 |
| $f_A$ | Component-1 amplitude-modulation frequency | 1.8 |
| $f_2$ | Component-2 base frequency | 39 |
| $\beta_2$ | Component-2 quadratic phase coefficient | 2.5 |
| $A_{M2}$ | Component-2 phase-modulation amplitude | 0.70 |
| $f_{M2}$ | Component-2 phase-modulation frequency | 5.2 |
| $A_2$ | Component-2 amplitude | 0.24 |


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

