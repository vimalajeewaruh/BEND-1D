# Transformer Inrush


## Overview

The **TransformerInrush** signal combines a decaying asymmetric offset, a fundamental oscillation with a large transient envelope, and a decaying second harmonic. The initial cycles are strongly nonstationary before settling toward a persistent sinusoid.

## Mathematical Definition

Define the fundamental component with a decaying transient envelope

```math
F(x)=
\left(
A_0+A_Te^{-\alpha_Tx}
\right)
\sin(2\pi f_0x).
```

Define the decaying asymmetric offset

```math
D(x)=
A_De^{-\alpha_Dx}.
```

Define the decaying second harmonic

```math
H(x)=
A_He^{-\alpha_Hx}
\sin\left(
2\pi f_Hx+\delta_H
\right).
```

The signal is

```math
f(x)=
F(x)+D(x)+H(x),
\qquad 0\leq x\leq1.
```

[View Transformer Inrush](../../assets/images/TF173_TransformerInrush.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Decaying nonstationary oscillation |
| Persistent component | Fundamental sinusoid with amplitude $A_0$ |
| Transient envelope | Additional fundamental amplitude decaying at rate $\alpha_T$ |
| Offset | Positive asymmetric component decaying at rate $\alpha_D$ |
| Harmonic structure | Decaying second harmonic with phase shift $\delta_H$ |
| Asymmetry | Strongest near the left boundary |
| Long-term behavior | Approaches the persistent fundamental oscillation |
| Main challenge | Preserving early-cycle distortion and steady oscillation |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $A_0$ | Persistent fundamental amplitude | 0.35 |
| $A_T$ | Fundamental transient-envelope amplitude | 1.05 |
| $\alpha_T$ | Fundamental-envelope decay rate | 5 |
| $f_0$ | Fundamental frequency | 8 |
| $A_D$ | Offset amplitude | 0.48 |
| $\alpha_D$ | Offset decay rate | 4 |
| $A_H$ | Second-harmonic amplitude | 0.26 |
| $\alpha_H$ | Second-harmonic decay rate | 5.5 |
| $f_H$ | Second-harmonic frequency | 16 |
| $\delta_H$ | Second-harmonic phase shift | 0.45 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF173_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF173_python.md)



## Recommended Uses

- Transient harmonic denoising
- Boundary-localized nonstationarity
- Amplitude and phase preservation

## Provenance

This deterministic waveform is inspired by transformer magnetizing inrush. It is not a circuit or magnetic-core simulation.

[← Previous: Tertiary Creep Failure](TF172_TertiaryCreepFailure.md) · [Category 9 catalog](index.md) · [Next: MEMS Pull-In / Release →](TF174_MEMSPullInRelease.md)
