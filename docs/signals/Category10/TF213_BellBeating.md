# BellBeating


## Overview

The **BellBeating** signal contains two closely spaced modes that produce a long-lived beat envelope, while a third higher-frequency mode decays much more rapidly.

## Mathematical Definition

Define the two closely spaced modes by

```math
M_1(x)=
A_1 e^{-\alpha_1 x}
\sin(2\pi f_1x),
```

and

```math
M_2(x)=
A_2 e^{-\alpha_1 x}
\sin(2\pi f_2x+\delta_2).
```

Define the faster-decaying higher-frequency mode by

```math
M_3(x)=
A_3 e^{-\alpha_3 x}
\sin(2\pi f_3x+\delta_3).
```

The signal is

```math
f(x)=
M_1(x)+M_2(x)+M_3(x).
```

[View Bell Beating](../../assets/images/TF213_BellBeating.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Music/acoustics |
| Structure | Three damped sinusoids with a close-frequency pair |
| Beat behavior | Interference between $f_1$ and $f_2$ produces a long-lived amplitude envelope |
| Decay behavior | The close-frequency pair shares a slow decay, while the higher mode decays more rapidly |
| Regularity | Smooth, oscillatory, and nonstationary |
| Main challenge | Preserving the perceptually important beat envelope |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $A_1$ | First-mode amplitude | 1 |
| $f_1$ | First-mode frequency | 11 |
| $A_2$ | Second-mode amplitude | 0.92 |
| $f_2$ | Second-mode frequency | 11.75 |
| $\delta_2$ | Second-mode phase offset | 0.12 |
| $\alpha_1$ | Shared decay rate of the close-frequency pair | 2.3 |
| $A_3$ | Third-mode amplitude | 0.35 |
| $f_3$ | Third-mode frequency | 27.3 |
| $\delta_3$ | Third-mode phase offset | 0.5 |
| $\alpha_3$ | Third-mode decay rate | 6.9 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF213_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF213_python.md)



## Recommended Uses

- Beat-envelope recovery
- Close-mode preservation
- Decaying acoustic-signal denoising

## Provenance

This is a deterministic benchmark surrogate inspired by music/acoustics measurement morphology. It is not a calibrated physical or environmental simulator.

[← Previous: GuitarPluckDualDecay](TF212_GuitarPluckDualDecay.md) · [Category 10 catalog](index.md) · [Next: DrumModePacket →](TF214_DrumModePacket.md)

