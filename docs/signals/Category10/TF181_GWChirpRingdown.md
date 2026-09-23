# GWChirpRingdown


## Overview

An accelerating compact-binary-inspired chirp grows in amplitude and frequency until a prescribed merger time, then changes immediately into a damped high-frequency ring-down.

## Mathematical Definition

Let $x_c=0.72$,
$$
A(x)=0.12+0.88(x/x_c)^{1.6},\qquad
\phi(x)=2\pi(4x+5x^2+12x^3+18x^5),
$$
and $\phi_c=\phi(x_c)$. Then
$$
f(x)=
\begin{cases}
A(x)\sin\{\phi(x)\}, & x<x_c,\\
e^{-14(x-x_c)}\sin\{84\pi(x-x_c)+\phi_c\}, & x\ge x_c.
\end{cases}
$$

[GWChirpRingdown signal](../../assets/images/TF181_GWChirpRingdown.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Astrophysics |
| Structure | Accelerating chirp followed by ring-down |
| Regularity | Continuous waveform with an abrupt change of oscillatory regime |
| Main challenge | Preserve phase through the merger and the short decaying tail |

## Parameters

| Parameter | Value |
|---|---|
| Merger time $x_c$ | $0.72$ |
| Ring-down rate | $14$ |
| Ring-down frequency | $42$ cycles/unit |

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

