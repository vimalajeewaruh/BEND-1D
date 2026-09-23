# PulsarGlitchRecovery

## Overview

A persistent pulsar-like oscillation undergoes an abrupt frequency change followed by two recovery time scales while remaining continuous in phase.

## Mathematical Definition

Let $c=0.43$, $u=(x-c)_+$, and $H=I(x\ge c)$. Define
$$
\phi(x)=2\pi\left[9x+H\{2.4u+0.22(1-e^{-u/0.03})
+0.16(1-e^{-u/0.18})\}\right].
$$
Then $f(x)=\sin\{\phi(x)\}$.

[PulsarGlitchRecovery signal](../../assets/images/TF183_PulsarGlitchRecovery.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Astrophysics |
| Structure | Sinusoid with a post-glitch nonlinear phase law |
| Regularity | Continuous amplitude and phase; abrupt local-frequency change |
| Main challenge | Retain a subtle change in oscillatory dynamics |

## Parameters

| Parameter | Value |
|---|---|
| Glitch time | $0.43$ |
| Frequency increment | $2.4$ |
| Recovery scales | $0.03, 0.18$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF183_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF183_python.md)



## Recommended Uses

- Phase-preserving denoising
- Glitch detection
- Multirate recovery estimation

## Provenance

This is a deterministic benchmark surrogate inspired by astrophysics measurement morphology. It is not a calibrated physical or clinical simulator.

[← Previous: FRBScatterTail](TF182_FRBScatterTail.md) · [Category 10 catalog](index.md) · [Next: MagnetarBurstStorm →](TF184_MagnetarBurstStorm.md)

